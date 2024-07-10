from neo4j import GraphDatabase

# Configura las credenciales y la URL de conexión
uri = "bolt://localhost:7687"  # Cambia esto a la URI de tu base de datos
user = "neo4j"                 # Nombre de usuario de tu base de datos
password = "123456789"          # Contraseña de tu base de datos
database = "arbol"  # Nombre de la base de datos

# Crea una instancia del controlador
driver = GraphDatabase.driver(uri, auth=(user, password))

# Función para ejecutar una consulta y devolver los resultados
def execute_query(query, database, parameters=None):
    with driver.session(database=database) as session:
        result = session.run(query, parameters)
        return [record for record in result]

# Definir la función para consultar los nodos que son estudiantes
def consultar_estudiantes():
    query = """
    MATCH (n) WHERE n.actividad = 'ESTUDIANTE' 
    RETURN n
    """
    return execute_query(query, database)

# Definir la función para consultar todos los primos de los amigos de un alumno
def consultar_primos_de_amigos(alumno_nombre):
    query = """
    MATCH (AlumnoA {nombre: $nombre})-[:Amigo_de]->(amigo)
    MATCH (amigo)-[:Hijo_de]->(padres)
    MATCH (padres)-[:Hijo_de]->(abuelos)
    MATCH (abuelos)-[:Padre_de|Madre_de]->(tios)
    MATCH (tios)-[:Padre_de|Madre_de]->(primos)
    WHERE NOT (padres)-[:Padre_de|Madre_de]->(primos)
    RETURN DISTINCT primos
    """
    parameters = {"nombre": alumno_nombre}
    return execute_query(query, database, parameters)

# Definir la función para encontrar la persona a menos saltos que comparta algún gusto con el padre de un alumno
def consultar_persona_con_gustos_parecidos(alumno_nombre):
    query = """
    MATCH (padre)-[:Padre_de]->({nombre: $nombre})
    WITH padre
    MATCH (otro)
    WHERE (otro.gusto1 = padre.gusto1 OR otro.gusto1 = padre.gusto2 OR otro.gusto2 = padre.gusto1 OR otro.gusto2 = padre.gusto2)
    AND otro <> padre
    RETURN otro
    ORDER BY CASE WHEN otro.gusto1 IN [padre.gusto1, padre.gusto2] THEN 1 ELSE 0 END +
             CASE WHEN otro.gusto2 IN [padre.gusto1, padre.gusto2] THEN 1 ELSE 0 END DESC
    LIMIT 1
    """
    parameters = {"nombre": alumno_nombre}
    return execute_query(query, database, parameters)

# Definir la función para encontrar la persona a mayor distancia que comparta algún gusto pero no tenga disgusto
def consultar_persona_mas_distante_con_gustos(alumno_nombre):
    query = """
    MATCH (AlumnoA {nombre: $nombre})
    MATCH (otro)
    WHERE (otro.gusto1 = AlumnoA.gusto1 OR otro.gusto1 = AlumnoA.gusto2 OR otro.gusto2 = AlumnoA.gusto1 OR otro.gusto2 = AlumnoA.gusto2)
    AND otro <> AlumnoA
    AND otro.disgusto <> AlumnoA.gusto1
    AND otro.disgusto <> AlumnoA.gusto2
    RETURN otro
    ORDER BY CASE WHEN otro.gusto1 IN [AlumnoA.gusto1, AlumnoA.gusto2] THEN 1 ELSE 0 END +
             CASE WHEN otro.gusto2 IN [AlumnoA.gusto1, AlumnoA.gusto2] THEN 1 ELSE 0 END ASC
    LIMIT 1
    """
    parameters = {"nombre": alumno_nombre}
    return execute_query(query, database, parameters)

# Definir la función para encontrar parientes que AlumnoA podría presentarle a AlumnoB
def consultar_parientes_por_gustos_y_rango_etario(alumnoA_nombre, alumnoB_nombre):
    query = """
    MATCH (AlumnoA {nombre: $alumnoA_nombre})
    MATCH (AlumnoB {nombre: $alumnoB_nombre})
    WITH AlumnoB, date(AlumnoB.fecha_nac) AS fecha_nac
    WITH AlumnoB, fecha_nac, fecha_nac - duration({years: 5}) AS fecha_min, fecha_nac + duration({years: 5}) AS fecha_max
    MATCH (AlumnoA)-[:Padre_de|Madre_de|Hijo_de]->(Pariente)
    WHERE (Pariente.gusto1 = AlumnoB.gusto1 OR Pariente.gusto1 = AlumnoB.gusto2 OR Pariente.gusto2 = AlumnoB.gusto1 OR Pariente.gusto2 = AlumnoB.gusto2)
    AND date(Pariente.fecha_nac) > fecha_min AND date(Pariente.fecha_nac) < fecha_max
    AND Pariente <> AlumnoA AND Pariente <> AlumnoB
    RETURN DISTINCT Pariente
    ORDER BY Pariente.nombre
    """
    parameters = {"alumnoA_nombre": alumnoA_nombre, "alumnoB_nombre": alumnoB_nombre}
    return execute_query(query, database, parameters)

# Definir la función para encontrar tíos masculinos de un amigo de un alumno que le disgusten los gatos y sean veterinarios
def consultar_tios_veterinarios_disgustan_gatos(alumnoA_nombre):
    query = """
    MATCH (alumnoA {nombre: $alumnoA_nombre})-[:Amigo_de]->(amigo)
    MATCH (amigo)-[:Hijo_de]->(padre_madre)
    MATCH (padre_madre)-[:Hijo_de]->(abuelos)
    MATCH (abuelos)-[:Padre_de|Madre_de]->(tios:Hombre)
    WHERE tios.actividad = 'VETERINARIO' AND tios.disgusto = 'Gatos'
    RETURN DISTINCT tios
    """
    parameters = {"alumnoA_nombre": alumnoA_nombre}
    return execute_query(query, database, parameters)

# Definir la función para encontrar el pariente vivo de mayor edad de cada alumno
def consultar_pariente_mayor_edad_vivo(alumno_nombre):
    query = """
    MATCH (alumno:Hombre {nombre: $alumno_nombre})
    MATCH (pariente)
    WHERE (pariente:Hombre OR pariente:Mujer)
          AND pariente <> alumno
          AND pariente.defuncion IS NULL
    WITH pariente
    ORDER BY pariente.fecha_nac ASC
    LIMIT 1
    RETURN pariente.nombre AS Nombre, pariente.fecha_nac AS Fecha_de_Nacimiento
    """
    parameters = {"alumno_nombre": alumno_nombre}
    return execute_query(query, database, parameters)

# Ejecutar la función con el nombre del alumno y mostrar los resultados
pariente_mayor_edad_vivo = consultar_pariente_mayor_edad_vivo("Jose Garcia")

# Mostrar los resultados
for record in pariente_mayor_edad_vivo:
    print(record["Nombre"], record["Fecha_de_Nacimiento"])

# Cerrar la conexión
driver.close()