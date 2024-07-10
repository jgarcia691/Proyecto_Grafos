from neo4j import GraphDatabase

# Configura las credenciales y la URL de conexión
uri = "bolt://localhost:7687"  # Cambia esto a la URI de tu base de datos
user = "neo4j"                 # Nombre de usuario de tu base de datos
password = "123456789"          # Contraseña de tu base de datos

# Crea una instancia del controlador
driver = GraphDatabase.driver(uri, auth=(user, password))

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

