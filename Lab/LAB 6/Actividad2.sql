;---------------------------------------------------------------------
;---------------------- ACTIVIDAD 2:

;-- Ejercicio No. 1: Presente nombre completo de todos los 
;-- subcontratistas (SubContractor) que tengan un salario 
;-- mayor a 3000000. Asegúrese de que se obtengan 5 registros.

SELECT s_fname AS Nombre,s_lname AS Apellido
FROM SubContractor
WHERE salary>3000000;

SELECT CONCAT(s_fname,' ',s_lname) AS "Nombre_Completo_Subcontratista"
FROM SubContractor
WHERE salary>3000000;

;-- Ejercicio No.2 Presente el nombre de los constructores 
;-- (Builder) y subcontratistas (SubContractor) que hayan 
;-- sido contratados en el 2019

;-- Con el NATURAL JOIN
SELECT Builder.b_fname AS "Nombre_Constructor", SubContractor.s_fname AS "Nombre_Subcontratista"
FROM HireInfo
NATURAL JOIN Builder
NATURAL JOIN SubContractor
WHERE CAST(EXTRACT(YEAR FROM hire_date) AS INT) = 2019;


;-- Ejercicio No.3 Presente de todos los constructores (Builder) 
;-- que tiene casas en construcción, el resultado en una sola 
;-- columna llamada Full_Name especifica el nombre de estos 
;-- constructores que deben estar ordenados por apellido. 
;-- Asegúrese de que se obtengan 8 registros.

SELECT CONCAT(Builder.b_fname, ' ', Builder.b_lname) AS "Full_Name"
FROM Builder
NATURAL JOIN House
GROUP BY "Full_Name", Builder.b_lname
ORDER BY Builder.b_lname;

;-- Ejercicio No.4: Presente todos los subcontratistas y 
;-- los constructor que los contrató. Muestre los apellidos 
;-- de los subcontratistas y los apellidos de los constructores 
;-- junto con el salario de cada subcontratista. 
;-- (Asegúrese de que se obtengan 11 registros).

SELECT SubContractor.s_lname AS "Apellido_Subcontratista", 
		Builder.b_lname AS "Apellido_Constructor", 
		SubContractor.salary AS "Salario_subcontratista"
FROM HireInfo
NATURAL JOIN SubContractor
NATURAL JOIN Builder;

;-- Ejercicio No.5: Obtenga todos los constructores y 
;-- las casas en construcción, el resultado presenta 
;-- el apellido del constructor y el nombre de la casa 
;-- ordenados por apellido. Algunos constructores no 
;-- tienen casas en construcción deben estar incluidos. 
;-- (Asegúrese de que se obtengan 14 registros).

SELECT Builder.b_lname AS "Apellido_Constructor",
 House.h_name AS "Nombre_casa"
FROM Builder
NATURAL LEFT JOIN House
ORDER BY Builder.b_lname;

;-- Ejercicio No.6: Obtenga el nombre y el apellido 
;-- en un solo campo llamado Full_name de los 
;-- constructores de las casas llamadas "Nova" 
;-- o "El cañaduzal". (5 registros)

SELECT CONCAT(Builder.b_fname, ' ' ,Builder.b_lname) AS "Full_name"
FROM Builder
JOIN House ON Builder.bid=House.bid
AND (House.h_name='Nova' OR House.h_name='El cañaduzal');

;-- Ejercicio No.7: Presente el nombres de todas las casas 
;-- que han sido construidas por los constructores cuyo 
;-- apellido comience con una 'P', el resultado debe incluir 
;-- el nombre de estos constructores y sus apellidos

SELECT House.h_name AS "Nombre_casa",
		Builder.b_fname AS "Nombre_Constructor",
		Builder.b_lname AS "Apellido_Constructor"
FROM House
NATURAL JOIN Builder
WHERE Builder.b_lname LIKE('P%');

;-- Ejercicio No.8: Mostrar el nombre del barrio(s) y 
;-- la ciudad que tiene una casa nombrada “Las consultas”. 
;-- Asegúrese de que esta casa exista en sus registros y 
;-- que existan registros coincidentes en Barrios (Neighborhood)


SELECT Neighborhood.n_name AS "Barrio", Neighborhood.city AS "Ciudad"
FROM Neighborhood
NATURAL JOIN House
WHERE House.h_name = 'Las consultas';