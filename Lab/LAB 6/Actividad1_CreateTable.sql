;---------------------------------------------------------------------
;-------------- ACTIVIDAD 1:

;--Considere el siguiente esquema de base de datos

;--SubContractor(SID*, S_Lname, S_Fname, Salary)
;--Builder(BID*, B_Lname, B_Fname, License) 
;--Neighborhood(NID*, N_Name, City)
;--HireInfo(BID**, SID**, HireDate) 
;--House(HID*, H_Name, FinishDate, Price, BID**, NID**) 

;-- * son las llaves primarias
;-- ** son las llaves foráneas

;-- Ejercicio No. 1: Escriba las instrucciones/comandos 
;-- para llevar el esquema a un SGBD usando SQL

;-- Se crea la tabla SubContractor
CREATE TABLE SubContractor (
	sid SERIAL PRIMARY KEY,
	s_lname VARCHAR(50) NOT NULL,
	s_fname VARCHAR(50) NOT NULL,
	salary INT NOT NULL
);

;-- Se crea la tabla Builder
CREATE TABLE Builder (
	bid SERIAL PRIMARY KEY,
	b_lname VARCHAR(50) NOT NULL,
	b_fname VARCHAR(50) NOT NULL,
	license VARCHAR(50) NOT NULL
);

;-- Se crea la tabla Neighborhood
CREATE TABLE Neighborhood (
	nid SERIAL PRIMARY KEY,
	n_name VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL
);

;-- Se crea la tabla HireInfo
CREATE TABLE HireInfo (
	bid INT,
	sid INT,
	hire_date DATE NOT NULL,
	CONSTRAINT "FK_HireInfo.bid"
		FOREIGN KEY (bid)
			REFERENCES Builder(bid),
	CONSTRAINT "FK_HireInfo.sid"
    	FOREIGN KEY (sid)
      		REFERENCES SubContractor(sid),
  	PRIMARY KEY (bid, sid)
);

;-- Se crea la tabla House
CREATE TABLE House (
  	hid SERIAL PRIMARY KEY,
  	h_name VARCHAR(50) NOT NULL,
  	finish_date DATE NOT NULL,
  	price INT NOT NULL,
  	bid INT,
	nid INT,
	CONSTRAINT "FK_House.bid"
		FOREIGN KEY (bid)
			REFERENCES Builder(bid),
	CONSTRAINT "FK_House.nid"
    	FOREIGN KEY (nid)
      		REFERENCES Neighborhood(nid)
);

;-- Para eliminar las tablas
DROP TABLE IF EXISTS SubContractor CASCADE;
DROP TABLE IF EXISTS Builder CASCADE;
DROP TABLE IF EXISTS Neighborhood CASCADE;
DROP TABLE IF EXISTS HireInfo CASCADE;
DROP TABLE IF EXISTS House CASCADE;