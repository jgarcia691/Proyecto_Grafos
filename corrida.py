from neo4j import GraphDatabase
import Consultas_CRUD

# Configura tu conexión a la base de datos Neo4j
URI = "bolt://localhost:7687"
AUTH = ("neo4j", "123456789")


 

#Main
if __name__ == "__main__":
    driver = GraphDatabase.driver(URI, auth=AUTH)


    
    
    




# Agregar un nodo
   # person_properties = {
    #    "nombre": "Rondon",
    #    "fecha_nac": "1990-01-01",
    #    "actividad": "OTROS",
    #    "gusto1": "Leer",
    #    "gusto2": "Música",
    #    "disgusto": "Motos",
    #    "defuncion": None
  #  }
   # new_person = consultas2.add_person(driver, "Hombre", person_properties)
   # print("Added person:", new_person)



    
    #Actualizar un nodo
    #person_properties = {
    #   "nombre": "Rafael Mata",
    #  "fecha_nac": "1990-01-01",
    # "actividad": "OTROS",
    #"gusto1": "Leer",
    #"gusto2": "Música",
    # "disgusto": "Motos",
    #"defuncion": None
    #}
    #consultas2.update_person(driver, "Rafael Mata", person_properties)


    #Eliminar el nodo Rondon
    #consultas2.delete_person(driver, "Juan Figueroa")

    

    driver.close()




   
