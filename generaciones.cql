#Eliminar nodos Hombre existentes
MATCH (h:Hombre) DETACH DELETE h

#Eliminar nodos Mujer existentes
MATCH (m:Mujer) DETACH DELETE m

#Crear nodos Hombre INTEGRANTES
CREATE (:Hombre {nombre: 'Jose Garcia', fecha_nac: '2000-05-18', actividad: 'ESTUDIANTE', gusto1: 'Tecnologias', gusto2: 'Peliculas', disgusto: 'Moda'})
CREATE (:Hombre {nombre: 'Jenfer Martinez', fecha_nac: '2004-09-19', actividad: 'ESTUDIANTE', gusto1: 'Futbol', gusto2: 'Leer', disgusto: 'Gatos'})
CREATE (:Hombre {nombre: 'Hector Tovar', fecha_nac: '2004-07-18', actividad: 'ESTUDIANTE', gusto1: 'Viajar', gusto2: 'Musica', disgusto: 'Motos'})
CREATE (:Hombre {nombre: 'Benjamin Ortiz', fecha_nac: '2003-12-18', actividad: 'ESTUDIANTE', gusto1: 'Viajar', gusto2: 'Musica', disgusto: 'Motos'})

#Crear nodos Mujer Integrantes
CREATE (:Mujer {nombre: 'Valery Medina', fecha_nac: '2004-05-18', actividad: 'ESTUDIANTE', gusto1: 'Moda', gusto2: 'Peliculas', disgusto: 'Perros'})


# Crear relaciones de amigos
# Jose
MATCH (a:Hombre {nombre: 'Jose Garcia'}), (b:Mujer {nombre: 'Valery Medina'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jose Garcia'}), (b:Hombre {nombre: 'Jenfer Martinez'})
CREATE (a)-[:Amigo_de {fecha_ini: '2022-01-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jose Garcia'}), (b:Hombre {nombre: 'Hector Tovar'})
CREATE (a)-[:Amigo_de {fecha_ini: '2023-10-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jose Garcia'}), (b:Hombre {nombre: 'Benjamin Ortiz'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)

# Valery

MATCH (a:Mujer {nombre: 'Valery Medina'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Valery Medina'}), (b:Hombre {nombre: 'Jenfer Martinez'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Valery Medina'}), (b:Hombre {nombre: 'Hector Tovar'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Valery Medina'}), (b:Hombre {nombre: 'Benjamin Ortiz'})
CREATE (a)-[:Amigo_de {fecha_ini: '2023-01-30'}]->(b)

#Jenfer
MATCH (a:Hombre {nombre: 'Jenfer Martinez'}), (b:Mujer {nombre: 'Valery Medina'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jenfer Martinez'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Amigo_de {fecha_ini: '2022-01-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jenfer Martinez'}), (b:Hombre {nombre: 'Hector Tovar'})
CREATE (a)-[:Amigo_de {fecha_ini: '2023-10-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Jenfer Martinez'}), (b:Hombre {nombre: 'Benjamin Ortiz'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)

#hector
MATCH (a:Hombre {nombre: 'Hector Tovar'}), (b:Mujer {nombre: 'Valery Medina'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Hector Tovar'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Amigo_de {fecha_ini: '2022-01-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Hector Tovar'}), (b:Hombre {nombre: 'Jenfer Martinez'})
CREATE (a)-[:Amigo_de {fecha_ini: '2023-10-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Hector Tovarz'}), (b:Hombre {nombre: 'Benjamin Ortiz'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)

#Bejamin
MATCH (a:Hombre {nombre: 'Benjamin Ortiz'}), (b:Mujer {nombre: 'Valery Medina'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Benjamin Ortiz'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Amigo_de {fecha_ini: '2022-01-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Benjamin Ortiz'}), (b:Hombre {nombre: 'Jenfer Martinez'})
CREATE (a)-[:Amigo_de {fecha_ini: '2023-10-15'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Benjamin Ortiz'}), (b:Hombre {nombre: 'Hector Tovar'})
CREATE (a)-[:Amigo_de {fecha_ini: '2024-04-30'}]->(b)

//FAMILIA JOSE GARCIA
#Crear nodos Hombre INTEGRANTES
CREATE (:Hombre {nombre: 'Dixon Garcia', fecha_nac: '1972-07-05', actividad: 'ABOGADO', gusto1: 'Peliculas', gusto2: 'Viajar', disgusto: 'Moda'})
CREATE (:Mujer {nombre: 'Johania Romero', fecha_nac: '1973-03-19', actividad: 'DOCENTE', gusto1: 'Viajar', gusto2: 'Moda', disgusto: 'Gatos'})
CREATE (:Hombre {nombre: 'Jesus Garcia', fecha_nac: '2007-02-23', actividad: 'ESTUDIANTE', gusto1: 'Futbol', gusto2: 'Musica', disgusto: 'Leer'})
//Parte Papa
CREATE (:Hombre {nombre: 'Nelson Garcia', fecha_nac: '1974-01-11', actividad: 'ABOGADO', gusto1: 'Volibol', gusto2: 'Perros', disgusto: 'Motos'})
CREATE (:Mujer {nombre: 'Desire Betermy', fecha_nac: '1974-08-21', actividad: 'DOCENTE', gusto1: 'Perros', gusto2: 'Viajes', disgusto: 'Tecnologia'})
CREATE (:Mujer {nombre: 'Vianka Betermy', fecha_nac: '1999-03-09', actividad: 'ABOGADO', gusto1: 'Perros', gusto2: 'Musica', disgusto: 'Futbol'})
CREATE (:Hombre {nombre: 'Miguel Garcia', fecha_nac: '1970-09-11', actividad: 'OTROS', gusto1: 'Musica', gusto2: 'Voleibol', disgusto: 'Leer', defuncion:'2019-06-19'})
CREATE (:Hombre {nombre: 'Roanyer Garcia', fecha_nac: '2009-02-17', actividad: 'ESTUDIANTE', gusto1: 'Musica', gusto2: 'Futbol', disgusto: 'Naturaleza'})
CREATE (:Mujer {nombre: 'Justina Sabala', fecha_nac: '1960-05-27', actividad: 'OTROS', gusto1: 'Moda', gusto2: 'Naturaleza', disgusto: 'Musica'})
CREATE (:Hombre {nombre: 'Octavio Garcia', fecha_nac: '1933-08-27', actividad: 'OTROS', gusto1: 'Musica', gusto2: 'Naturaleza', disgusto: 'Leer', defuncion:'2015-06-17'})
CREATE (:Mujer {nombre: 'Elba Gascon', fecha_nac: '1940-01-01', actividad: 'OTROS', gusto1: 'Moda', gusto2: 'Musica', disgusto: 'Perros'})
//Parte Mama
CREATE (:Mujer {nombre: 'Eugenia Romero', fecha_nac: '1930-09-10', actividad: 'OTROS', gusto1: 'Naturaleza', gusto2: 'Moda', disgusto: 'Musica',defuncion:'1992-09-10'})
CREATE (:Hombre {nombre: 'Joel La Palma', fecha_nac: '1935-08-05', actividad: 'OTROS', gusto1: 'Musica', gusto2: 'Naturaleza', disgusto: 'Leer'})
CREATE (:Hombre {nombre: 'Noel Romero', fecha_nac: '1952-04-03', actividad: 'ABOGADO', gusto1: 'Autos', gusto2: 'Viajar', disgusto: 'Motos'})
CREATE (:Mujer {nombre: 'Gledis Flores', fecha_nac: '1960-06-15', actividad: 'DOCENTE', gusto1: 'Moda', gusto2: 'Musica', disgusto: 'Perros'})
CREATE (:Hombre {nombre: 'Yoraco Romero', fecha_nac: '1990-09-18', actividad: 'ABOGADO', gusto1: 'Autos', gusto2: 'Viajar', disgusto: 'Gatos'})
CREATE (:Mujer {nombre: 'Urimare Romero', fecha_nac: '1996-03-12', actividad: 'ABOGADO', gusto1: 'Moda', gusto2: 'Musica', disgusto: 'Naturaleza'})
CREATE (:Mujer {nombre: 'Francis Romero', fecha_nac: '1976-11-15', actividad: 'OTROS', gusto1: 'Moda', gusto2: 'Musica', disgusto: 'Naturaleza'})
CREATE (:Mujer {nombre: 'Luisana Nasser', fecha_nac: '2003-09-23', actividad: 'VETERINARIO', gusto1: 'Perros', gusto2: 'Musica', disgusto: 'Gatos'})
CREATE (:Mujer {nombre: 'Amira Nasser', fecha_nac: '2013-04-19', actividad: 'ESTUDIANTE', gusto1: 'Moda', gusto2: 'Gatos', disgusto: 'Tecnologia'})
CREATE (:Hombre {nombre: 'Luis Romero', fecha_nac: '1970-06-20', actividad: 'VETERINARIO', gusto1: 'Naturaleza', gusto2: 'Perros', disgusto: 'Gatos'})
CREATE (:Mujer {nombre: 'Darling Lisboa', fecha_nac: '1973-01-05', actividad: 'DOCENTE', gusto1: 'Moda', gusto2: 'Autos', disgusto: 'Naturaleza'})
CREATE (:Hombre {nombre: 'Joel Romero', fecha_nac: '1996-10-04', actividad: 'INGENIERO', gusto1: 'Motos', gusto2: 'Autos', disgusto: 'Leer'})
CREATE (:Mujer {nombre: 'Lady Romero', fecha_nac: '1999-05-19', actividad: 'ESTUDIANTE', gusto1: 'Moda', gusto2: 'Gatos', disgusto: 'Musica'})

//RELACIONES PADRE->HIJO
MATCH (a:Hombre {nombre: 'Dixon Garcia'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: '2000-05-18'}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Dixon Garcia'}), (b:Hombre {nombre: 'Jesus Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: '2007-02-23'}]->(b)

MATCH (a:Mujer {nombre: 'Johania Romero'}), (b:Hombre {nombre: 'Jose Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Johania Romero'}), (b:Hombre {nombre: 'Jesus Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Octavio Garcia'}), (b:Hombre {nombre: 'Dixon Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: '1972-07-05'}]->(b)

MATCH (a:Hombre {nombre: 'Octavio Garcia'}), (b:Hombre {nombre: 'Nelson Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Octavio Garcia'}), (b:Hombre {nombre: 'Miguel Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Elba Gascon'}), (b:Hombre {nombre: 'Dixon Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Elba Gascon'}), (b:Hombre {nombre: 'Miguel Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Elba Gascon'}), (b:Hombre {nombre: 'Nelson Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Miguel Garcia'}), (b:Hombre {nombre: 'Roanyer Garcia'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Justina Sabala'}), (b:Hombre {nombre: 'Roanyer Garcia'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Nelson Garcia'}), (b:Mujer {nombre: 'Vianka Betermy'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Desire Betermy'}), (b:Mujer {nombre: 'Vianka Betermy'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Francis Romero'}), (b:Mujer {nombre: 'Luisana Nasser'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Francis Romero'}), (b:Mujer {nombre: 'Amira Nasser'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Eugenia Romero'}), (b:Mujer {nombre: 'Johania Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Eugenia Romero'}), (b:Mujer {nombre: 'Francis Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Eugenia Romero'}), (b:Hombre {nombre: 'Noel Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Eugenia Romero'}), (b:Hombre {nombre: 'Luis Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Joel La Palma'}), (b:Mujer {nombre: 'Francis Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Joel La Palma'}), (b:Mujer {nombre: 'Johania Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Joel La Palma'}), (b:Hombre {nombre: 'Luis Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Luis Romero'}), (b:Mujer {nombre: 'Joel Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Luis Romero'}), (b:Mujer {nombre: 'Lady Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Darling Lisboa'}), (b:Mujer {nombre: 'Lady Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Darling Lisboa'}), (b:Hombre {nombre: 'Joel Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Hombre {nombre: 'Noel Romero'}), (b:Mujer {nombre: 'Urimare Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Hombre {nombre: 'Noel Romero'}), (b:Hombre {nombre: 'Yoraco Romero'})
CREATE (a)-[:Padre_de {fecha_ini: b.fecha_nac}]->(b)

MATCH (a:Mujer {nombre: 'Gledis Flores'}), (b:Mujer {nombre: 'Urimare Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)
WITH a
MATCH (a:Mujer {nombre: 'Gledis Flores'}), (b:Hombre {nombre: 'Yoraco Romero'})
CREATE (a)-[:Madre_de {fecha_ini: b.fecha_nac}]->(b)


#CASADOS
#DIXON Y JOHANIA (PADRES)
MATCH (a:Mujer {nombre: 'Johania Romero'}), (b:Hombre {nombre: 'Dixon Garcia'})
CREATE (a)-[:Casado_con {fecha_ini: '1998-12-28'}]->(b)

MATCH (a:Hombre {nombre: 'Dixon Garcia'}), (b:Mujer {nombre: 'Johania Romero'})
CREATE (a)-[:Casado_con {fecha_ini: '1998-12-28'}]->(b)

#OCTAVIO Y ELBA (ABUELOS)
MATCH (a:Hombre {nombre: 'Octavio Garcia'}), (b:Mujer {nombre: 'Elba Gascon'})
CREATE (a)-[:Casado_con {fecha_ini: '1955-06-28'}]->(b)

MATCH (a:Mujer {nombre: 'Elba Gascon'}), (b:Hombre {nombre: 'Octavio Garcia'})
CREATE (a)-[:Casado_con {fecha_ini: '1955-06-28'}]->(b)

MATCH (a:Hombre {nombre: 'Joel La Palma'}), (b:Mujer {nombre: 'Eugenia Romero'})
CREATE (a)-[:Casado_con {fecha_ini: '1965-11-01'}]->(b)

MATCH (a:Mujer {nombre: 'Eugenia Romero'}), (b:Hombre {nombre: 'Joel La Palma'})
CREATE (a)-[:Casado_con {fecha_ini: '1965-11-01'}]->(b)

#TIOS PARTE PAPA
MATCH (a:Hombre {nombre: 'Nelson Garcia'}), (b:Mujer {nombre: 'Desire Betermy'})
CREATE (a)-[:Casado_con {fecha_ini: '2009-07-15'}]->(b)

MATCH (a:Mujer {nombre: 'Desire Betermy'}), (b:Hombre {nombre: 'Nelson Garcia'})
CREATE (a)-[:Casado_con {fecha_ini: '2009-07-15'}]->(b)

MATCH (a:Hombre {nombre: 'Miguel Garcia'}), (b:Mujer {nombre: 'Justina Sabala'})
CREATE (a)-[:Casado_con {fecha_ini: '2000-01-28'}]->(b)

MATCH (a:Mujer {nombre: 'Justina Sabala'}), (b:Hombre {nombre: 'Miguel Garcia'})
CREATE (a)-[:Casado_con {fecha_ini: '2000-01-28'}]->(b)

#TIOS PARTE MAMA
MATCH (a:Hombre {nombre: 'Noel Romero'}), (b:Mujer {nombre: 'Gledis Flores'})
CREATE (a)-[:Casado_con {fecha_ini: '1980-05-20'}]->(b)

MATCH (a:Mujer {nombre: 'Gledis Flores'}), (b:Hombre {nombre: 'Noel Romero'})
CREATE (a)-[:Casado_con {fecha_ini: '1980-05-20'}]->(b)

MATCH (a:Hombre {nombre: 'Luis Romero'}), (b:Mujer {nombre: 'Darling Lisboa'})
CREATE (a)-[:Casado_con {fecha_ini: '1980-06-28'}]->(b)

MATCH (a:Mujer {nombre: 'Darling Lisboa'}), (b:Hombre {nombre: 'Luis Romero'})
CREATE (a)-[:Casado_con {fecha_ini: '1980-06-28'}]->(b)


//Consultas
Todos los que son estudiantes

Match (n) WHERE (n.actividad='ESTUDIANTE') 
RETURN n


//Persona a menos saltos que comparta algún gusto con el padre de alumnoA

MATCH (padre)-[:Padre_de]->({nombre:'Jose Garcia'})
WITH padre
MATCH (otro)
WHERE (otro.gusto1 = padre.gusto1 OR otro.gusto1 = padre.gusto2 OR otro.gusto2 = padre.gusto1 OR otro.gusto2 = padre.gusto2)
AND otro <> padre
RETURN otro
ORDER BY CASE WHEN otro.gusto1 IN [padre.gusto1, padre.gusto2] THEN 1 ELSE 0 END +
         CASE WHEN otro.gusto2 IN [padre.gusto1, padre.gusto2] THEN 1 ELSE 0 END DESC
LIMIT 1


//Persona a mayor distancia de alumnoA que comparta algún gusto, pero no le disguste algo de AlumnoA

MATCH (AlumnoA {nombre: 'Valery Medina'})
MATCH (otro)
WHERE (otro.gusto1 = AlumnoA.gusto1 OR otro.gusto1 = AlumnoA.gusto2 OR otro.gusto2 = AlumnoA.gusto1 OR otro.gusto2 = AlumnoA.gusto2)
AND otro <> AlumnoA
AND otro.disgusto <> AlumnoA.gusto1
AND otro.disgusto <> AlumnoA.gusto2
RETURN otro
ORDER BY CASE WHEN otro.gusto1 IN [AlumnoA.gusto1, AlumnoA.gusto2] THEN 1 ELSE 0 END +
         CASE WHEN otro.gusto2 IN [AlumnoA.gusto1, AlumnoA.gusto2] THEN 1 ELSE 0 END ASC
LIMIT 1


//Parientes que alumnoA podría presentarle a alumnoB según gustos y rango etario

// Define los nombres de los alumnos
MATCH (AlumnoA {nombre: 'Jose Garcia'})
MATCH (AlumnoB {nombre: 'Valery Medina'})

// Define el rango etario
WITH AlumnoB, date(AlumnoB.fecha_nac) AS fecha_nac
WITH AlumnoB, fecha_nac, fecha_nac - duration({years: 5}) AS fecha_min, fecha_nac + duration({years: 5}) AS fecha_max

// Buscar parientes de AlumnoA que coincidan en gustos y rango etario
MATCH (AlumnoA)-[:Padre_de|Madre_de|Hermano_de|Hijo_de|Tio_de|Tia_de|Sobrino_de|Sobrina_de|Abuelo_de|Abuela_de|Nieto_de|Nieta_de|Primo_de|Prima_de]->(Pariente)
WHERE (Pariente.gusto1 = AlumnoB.gusto1 OR Pariente.gusto1 = AlumnoB.gusto2 OR Pariente.gusto2 = AlumnoB.gusto1 OR Pariente.gusto2 = AlumnoB.gusto2)
AND date(Pariente.fecha_nac) >= fecha_min AND date(Pariente.fecha_nac) <= fecha_max
AND Pariente <> AlumnoA AND Pariente <> AlumnoB

RETURN Pariente.nombre AS Nombre, Pariente.fecha_nac AS Fecha_de_Nacimiento, Pariente.gusto1 AS Gusto1, Pariente.gusto2 AS Gusto2
ORDER BY Pariente.nombre

//Tíos masculinos de un amigo que le disgusten los gatos y sean veterinarios.

MATCH (alumnoA{nombre: 'Valery Medina'})-[:Amigo_de]->(amigo)
MATCH (amigo)-[:Hijo_de]->(padre_madre)
Match (padre_madre)-[:Hijo_de]->(abuelos)
MATCH (abuelos)-[:Padre_de]->(tios)
WHERE (tios.actividad='VETERINARIO' AND tios.disgusto='Gatos')
RETURN  tios 


//Pariente vivo de mayor edad de cada alumno.

MATCH (alumno:Hombre {nombre: 'Jose Garcia'})
MATCH (pariente)
WHERE (pariente:Hombre OR pariente:Mujer)
      AND pariente <> alumno
      AND pariente.defuncion IS NULL
WITH pariente
ORDER BY pariente.fecha_nac ASC
LIMIT 1
RETURN pariente.nombre AS Nombre, pariente.fecha_nac AS Fecha_de_Nacimiento
