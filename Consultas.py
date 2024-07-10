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



# Ejecutar la función con el nombre del alumno y mostrar los resultados
primos = consultar_primos_de_amigos("Hector Tovar")

# Mostrar los resultados
for record in primos:
    print(record["primos"])

# Cerrar la conexión
driver.close()