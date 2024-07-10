
//Consultas Todos los que son estudiantes

Match (n) WHERE (n.actividad='ESTUDIANTE') 
RETURN n

//Todos los primos de los amigos de alumnoA
MATCH (AlumnoA {nombre: 'Hector Tovar'})-[:Amigo_de]->(amigo)
MATCH (amigo)-[:Hijo_de]->(padres)
MATCH (padres)-[:Hijo_de]->(abuelos)
MATCH (abuelos)-[:Padre_de|Madre_de]->(tios)
MATCH (tios)-[:Padre_de|Madre_de]->(primos)
WHERE NOT (padres)-[:Padre_de|Madre_de]->(primos)
RETURN primos

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