from neo4j import GraphDatabase

# Configura las credenciales y la URL de conexión
uri = "neo4j+s://a5ac4c2f.databases.neo4j.io"  # Reemplaza <endpoint_uri> con tu URI de Neo4j Aura
username = "neo4j"         # Reemplaza <usuario> con tu usuario de Neo4j Aura
password = "x7EeQjQkiG1Xb5-awXNsujQcry97KFSYN8RSFP5kjsU"      # Reemplaza <contraseña> con tu contraseña de Neo4j Aura

# Crea una instancia del controlador
driver = GraphDatabase.driver(uri, auth=(username, password))

def print_greeting(tx, message):
    result = tx.run("CREATE (a:Greeting) "
                    "SET a.message = $message "
                    "RETURN a.message + ', created'", message=message)
    return result.single()[0]

# Abre una sesión y ejecuta una consulta
with driver.session() as session:
    greeting = session.execute_write(print_greeting, "Conectada a la Base de Datos Neo4j")
    print(greeting)

# Cierra el controlador
driver.close()

