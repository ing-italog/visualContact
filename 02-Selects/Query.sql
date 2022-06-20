
--------------------------------CREATE DB--------------------------------
USE [master]
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'VisualContact') 
BEGIN
  CREATE DATABASE VisualContact;
END
------------------------------------------------------------------------


--------------------------------CREATE TABLE--------------------------------
CREATE TABLE VisualContact.dbo.Person (
   NRegistro INT PRIMARY KEY IDENTITY(1, 1),
   FirstName VARCHAR(100) NOT NULL,
   LastName VARCHAR(100) NOT NULL,
   Nota INT NOT NULL,
   Localidad VARCHAR(100) NOT NULL
)
---------------------------------------------------------------------------


--------------------------------INSERT VALUES-------------------------------
INSERT INTO VisualContact.dbo.Person (FirstName, LastName, Nota, Localidad) 
VALUES('Ana','Herrera',5,'Alfaro'),
      ('Pedro','Ruiz',6,'Tudela'),
	  ('Carlos','Tus',4,'Alfaro'),
	  ('Maria','Pes',6,'Cortes'),
	  ('Antonio','Tous',7,'Alfaro'),
	  ('Nuria','Jiménez',8,'Ablitas'),
	  ('Celia','Irurzun',4,'Tudela')
----------------------------------------------------------------------------

----------------------------------------------------------------------------
--2.1 Localidad IN (“Alfaro” AND “Cortes”).
SELECT * FROM VisualContact.dbo.Person WITH(NOLOCK) WHERE Localidad IN ('Alfaro', 'Cortes')

/*
RESPUESTA 

1	Ana	Herrera	5	Alfaro
3	Carlos	Tus	4	Alfaro
4	Maria	Pes	6	Cortes
5	Antonio	Tous	7	Alfaro

*/

----------------------------------------------------------------------------
--2.2 Nota BETWEEN (6 AND 7) AND N° de Registro NOT IN (2, 4).
SELECT * FROM VisualContact.dbo.Person WITH(NOLOCK) 
WHERE NOTA BETWEEN 6 AND 7
AND NRegistro NOT IN (2, 4)

/*
RESPUESTA 

5	Antonio	Tous	7	Alfaro

*/

----------------------------------------------------------------------------


----------------------------------------------------------------------------
--2.3 Nombre LIKE ‘%a%’ AND Apellido LIKE ‘%s%’.
SELECT * FROM VisualContact.dbo.Person WITH(NOLOCK) 
WHERE FirstName LIKE '%a%'AND LastName LIKE '%s%'

/*
RESPUESTA 

3	Carlos	Tus	4	Alfaro
4	Maria	Pes	6	Cortes
5	Antonio	Tous	7	Alfaro

*/
