;---------------------------------------------------------------------
;-------------- ACTIVIDAD 1:

;-- Ejercicio No. 2:Escriba las instrucciones/comandos 
;-- para poblar (insertar) registros (tuplas) en las
;-- tablas creadas en el Ejercicio No. 1.

;---------------------------------------------------------------------
;-- Insertar datos en la tabla SubContractor
INSERT INTO SubContractor (s_lname, s_fname, salary) 
	VALUES  ('Arias', 'Diana', 1000000),
			('Teran', 'Sebastian', 500000),
			('Gomez', 'Jorge', 15000000),
			('Salinas', 'Juan', 20000000),
			('Lopez', 'Emma', 3980000),
			('Perez', 'Jhon', 5480000),
			('Acosta', 'Rodrigo', 22000000),
			('Duque', 'Emma', 1800000),
			('Giraldo', 'Luis', 1400000),
			('Acosta', 'Valentina', 1800000),
			('Paz', 'Nicolas', 2600000),
			('Restrepo', 'Valeria', 1900000),
			('Bedoya', 'Manuel', 2300000),
			('Muñoz', 'Camilo', 1700000);

;-- Para ver la tabla SubContractor
SELECT * FROM SubContractor

;---------------------------------------------------------------------           
;-- Insertar datos en la tabla Builder
INSERT INTO Builder (b_lname, b_fname,license) 
	VALUES  ('Perea', 'Juan', 'ATM123'),
			('Morales', 'Angelica', 'BST334'),
			('Rios', 'Antonio', 'ABC220'),
			('Vargas', 'Mateo', 'QWF364'),
			('Wick', 'Jhon', 'ZER324'),
			('Castaño', 'Kevin', 'NGI789'),
			('Sanchez', 'Santiago', 'LDB567'),
			('Valdez', 'Ramiro', 'VKR345'),
			('Hoyos', 'Javier', 'ATM123'),
			('Tavarez', 'Jose', 'ATM123'),
            ('Erazo', 'Santiago', 'NGI789');

;-- Para ver la tabla Builder
SELECT * FROM Builder

;---------------------------------------------------------------------            
;-- Insertar datos en la tabla Neighborhood
INSERT INTO Neighborhood (n_name , city ) 
	VALUES  ('Santa teresita', 'Cali'),
			('Rosales', 'Bogotá'),
			('Belén', 'Medellin'),
			('Ingenio', 'Cali'),
			('El Prado', 'Barranquilla'),
			('El Poblado', 'Medellin'),
			('Chico', 'Bogota'),
			('Santa Ana', 'Bogota'),
			('Estadio', 'Medellin'),
			('Loma Los Bernal', 'Medellin'),
			('Robledo', 'Medellin');

;-- Para ver la tabla Neighborhood
SELECT * FROM Neighborhood

;---------------------------------------------------------------------         
;-- Insertar datos en la tabla HireInfo
INSERT INTO HireInfo (bid , sid , hire_date ) 
	VALUES  (4,11,'2019-07-07'),
			(4,13,'2019-07-07'),
			(2,5,'2018-11-15'),
			(6,7,'2010-09-08'),
            (7,7,'2022-10-08'),
			(9,8,'2022-02-20'),
			(1,2,'2021-05-06'),
			(3,1,'2021-09-22'),
			(1,3,'2019-06-11'),
			(9,4,'2019-08-15'),
			(5,9,'2019-08-15');
            
;-- Para ver la tabla HireInfo
SELECT * FROM HireInfo

;---------------------------------------------------------------------
;-- Insertar datos en la tabla House
INSERT INTO House (h_name , finish_date , price, bid, nid) 
	VALUES  ('Santa María', '1998-05-20', 220000000, 3, 2),
			('La Loma', '2012-12-14', 90000000, 1, 4),
			('San Gabriel', '2017-02-15', 310000000, 9, 2),
			('San Pedro', '2008-09-07', 350000000, 4, 9),
			('San Miguel', '2007-03-26', 120000000, 7, 4),
			('Las consultas', '2022-07-29', 450000000, 2, 6),
			('El cañaduzal', '1997-06-12', 160000000, 7, 1),
			('El cañaduzal', '1995-06-20', 80000000, 9, 7),
			('El cañaduzal', '1991-06-11', 73000000, 2, 1),
			('Nova', '1990-02-22', 49000000, 5, 1),
			('Nova', '2005-08-12', 8200000, 6, 3);
          
;-- Para ver la tabla House
SELECT * FROM House
