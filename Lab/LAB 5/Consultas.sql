;---------------------------------------------------------------------
;-------------- ACTIVIDAD 2:
;-- Ejercicio 1. ¿Cuántos ríos fluyen a través 
;-- de cada país que tiene más de 15 ríos?

SELECT Country.name, COUNT(*)
FROM Country, geo_river
WHERE Country.code = geo_river.country
GROUP BY Country.name
HAVING COUNT(*) > 15;

;---------------------------------------------------------------------
;-- Ejercicio 2. Obtenga el nombre de los países que 
;-- pertenecen o son miembros de la UNESCO o de UNASUR.

SELECT name
FROM Country
WHERE code IN (SELECT country
               FROM ismember
               WHERE  organization = 'UNESCO'  or 
              organization = 'UNASUR');
              
;-- Se verifica los miembros de la UNESCO o de UNASUR

SELECT *
FROM ismember 
WHERE  organization = 'UNESCO' or organization = 'UNASUR';

;---------------------------------------------------------------------
;------- Ejercicio No. 3: ¿Cuál es el nombre, población y altitud 
;-- de cada ciudad en Colombia(según lo registrado en la base de datos)? 
;-- Los resultados deben estar ordenados de manera descendente por población.

SELECT City.name, City.population, City.elevation
FROM City JOIN Country ON City.country = Country.code
WHERE Country.name = 'Colombia'
ORDER BY population DESC;

;---------------------------------------------------------------------
;----- Ejercicio 4.a) el PIB está compuesto al menos en un 70%
;-- por los sectores de Servicios e Industria juntos     
;-- (b) la inflación es inferior al 2%.
        
;-- Realizando la consulta con las dos condiciones 4a y 4b

;-- Para obtener el codigo de los paises
SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  (service +industry)>=70 or inflation < 2 );

;-- Para obtener el nombre de los paises
SELECT Country.name
FROM Country INNER JOIN Economy ON Country.code = Economy.country
WHERE (economy.service +economy.industry)>=70 or economy.inflation < 2 ;

;---------------------------------------------------------------------
;-------------- ACTIVIDAD 3:

;-- Ejercicio 1:

;-- Enunciado:
SELECT CONCAT(c.Code, “ ”, c.Name) AS “Country Name”,
FROM Country c, Economy e
WHERE e.Unemployment >= 15


;-- Respuesta:

SELECT CONCAT(c.Code, ' ', c.Name) AS "Country Name"
FROM Country c, Economy e
WHERE e.Unemployment >= 15

;-- Ejercicio 2

;-- Enunciado:

SELECT *
FROM desert 
ORDER BY Area DESC, Name ASC 


;-- Respuesta:

SELECT * 
FROM desert 
ORDER BY Area DESC 


;-- Ejercicio 3:

;-- Enunciado:

SELECT name FROM Country c
JOIN isMember m ON c.code = m.country
WHERE m.organization = 'Mercosur'


;-- Resultado:

SELECT name
     FROM Country as C
     WHERE C.code IN (SELECT country
               FROM ismember as m
               WHERE m.organization = 'Mercosur' );

;--------------------------------------------------------------------

;-- PRUEBAS:

;-- Para obtener el codigo de los paises:
SELECT country
From economy
WHERE (service + industry)>=70;

SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  (service +industry)>=70)
               
               
;-- PRUEBA: Se verifica los paises con servicios o industria con al menos 70%  

 SELECT country, service, industry FROM Economy
               WHERE industry>=70 or service >= 70  
               
SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  industry>=70 or service >= 70 );

;-- PRUEBA: Para obtener el codigo de los paises con inflación inferior a 2

SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  inflation < 2 );



