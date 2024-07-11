from neo4j import GraphDatabase

# Configura tu conexión a la base de datos Neo4j
URI = "bolt://localhost:7687"
AUTH = ("neo4j", "123456789")

#Agregar nodo
def add_person(driver, label, properties):
    query = f"""
    CREATE (n:{label} {{nombre: $nombre, fecha_nac: $fecha_nac, actividad: $actividad, gusto1: $gusto1, gusto2: $gusto2, disgusto: $disgusto, defuncion: $defuncion}})
    RETURN n
    """
    with driver.session() as session:
        result = session.run(query, properties)
        return result.single()[0]

#Eliminar nodo y relaciones por el nombre 
def delete_person(driver, name):
    query = """
    MATCH (n {nombre: $nombre})
    DETACH DELETE n
    """
    with driver.session() as session:
        session.run(query, nombre=name)

#Actualizar nodo
def update_person(driver, name, properties):
    query = """
    MATCH (n {nombre: $nombre})
    SET n += $properties
    RETURN n
    """
    with driver.session() as session:
        result = session.run(query, nombre=name, properties=properties)
        return result.single()[0]


#Eliminar relación por ID
def delete_relationship(driver, element_id):
    query = """
    MATCH ()-[r]->()
    WHERE elementId(r) = $element_id
    DELETE r
    """
    with driver.session() as session:
        session.run(query, element_id=element_id)
