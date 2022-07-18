
;-- Ejercicio 1. ¿Cuántos ríos fluyen a través 
;-- de cada país que tiene más de 15 ríos?

SELECT Country.name, COUNT(*)
FROM Country, geo_river
WHERE Country.code = geo_river.country
GROUP BY Country.name
HAVING COUNT(*) >= 15;

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


;-- Ejercicio No. 3: ¿Cuál es el nombre, población y altitud 
;-- de cada ciudad en Colombia(según lo registrado en la base de datos)? 
;-- Los resultados deben estar ordenados de manera descendente por población.

SELECT City.name, City.population, City.elevation
FROM City JOIN Country ON City.country = Country.code
WHERE Country.name = 'Colombia'
ORDER BY population DESC;


;-- Ejercicio 4.a) el PIB está compuesto al menos en un 70%
;-- por los sectores de Servicios e Industria juntos


SELECT country
From economy
WHERE (service + industry)>=70;

               
               
;-- PRUEBA: Se verifica los paises con servicios o industria con al menos 70%  

 SELECT country, service, industry FROM Economy
               WHERE industry>=70 or service >= 70  
               
SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  industry>=70 or service >= 70 );
     
;-- (b) la inflación es inferior al 2%.
        
SELECT code
FROM Country
WHERE code IN (SELECT country
               FROM Economy
               WHERE  inflation < 2 );
