--------------------------------CREATE DB--------------------------------
USE [master]
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'VisualContact') 
BEGIN
  CREATE DATABASE VisualContact;
END
------------------------------------------------------------------------


--------------------------------CREATE TABLES---------------------------
CREATE TABLE VisualContact.dbo.Provider (
    NIF VARCHAR(100) NOT NULL PRIMARY KEY,
	Name VARCHAR(250) NOT NULL,
	ADDRESS VARCHAR(250) NOT NULL,
	TmStmp DATETIME NOT NULL,	
	LogicDelete BIT,
	TmStmpDelete DATETIME
)

CREATE TABLE VisualContact.dbo.Products(
   Code VARCHAR(150) NOT NULL PRIMARY KEY,   
   NIFProvider VARCHAR(100),
   Name VARCHAR(250) NOT NULL,
   Price MONEY NOT NULL,
   TmStmp DATETIME NOT NULL,	
   LogicDelete BIT,
   TmStmpDelete DATETIME,
   CONSTRAINT FK_Provider FOREIGN KEY (NIFProvider) REFERENCES VisualContact.dbo.Provider(NIF) ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE VisualContact.dbo.Costumer(
   DNI VARCHAR(150) PRIMARY KEY NOT NULL,
   FirstName VARCHAR(100) NOT NULL,
   LastName VARCHAR(100) NOT NULL,
   Address VARCHAR(100),
   BirthDay DATETIME,
   TmStmp DATETIME NOT NULL,	
   LogicDelete BIT,
   TmStmpDelete DATETIME
)

CREATE TABLE VisualContact.dbo.Sell(
   Id VARCHAR(150) PRIMARY KEY NOT NULL,
   DNICostumer  VARCHAR(150),
   TmStmp DATETIME NOT NULL,	
   LogicDelete BIT,
   TmStmpDelete DATETIME,
   CONSTRAINT FK_Costumer FOREIGN KEY (DNICostumer) REFERENCES VisualContact.dbo.Costumer(DNI) ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE VisualContact.dbo.DetailSell(
    Id VARCHAR(150) PRIMARY KEY NOT NULL,
	IdSell VARCHAR(150),		
	CodeProduct VARCHAR(150),		
	TotalItems INT NOT NULL,
    TmStmp DATETIME NOT NULL,	
    LogicDelete BIT,
    TmStmpDelete DATETIME,
	CONSTRAINT FK_Sell FOREIGN KEY (IdSell) REFERENCES VisualContact.dbo.Sell(Id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Product FOREIGN KEY (CodeProduct) REFERENCES VisualContact.dbo.Products(Code) ON UPDATE CASCADE ON DELETE SET NULL	
)


/*
DROP TABLE DetailSell
DROP TABLE Sell
DROP TABLE Costumer
DROP TABLE Products
DROP TABLE Provider
*/


--------------------------------INSERT VALUES---------------------------
INSERT INTO  VisualContact.dbo.Costumer (DNI, FirstName, LastName, Address, BirthDay, TmStmp)
VALUES ('81255612','Italo Alberto', 'Guevara villamil', 'Calle 7 # 90 - 64','1997-06-20 01:42:57.563', GETUTCDATE()),
       ('778454843','Jose', 'Barragan Reyes', 'Calle 64f 77 - 13', '1998-06-20 01:42:57.563',GETUTCDATE()),
	   ('43651394','Olga', 'Quiroz', 'aV 1 # mayo 23', '1990-02-20 01:42:57.563',GETUTCDATE())


INSERT INTO VisualContact.dbo.Provider(NIF, Name, ADDRESS,TmStmp)
VALUES('123456789', 'Proveedor 1', 'Calle 7 # 12-23', GETUTCDATE()),
      ('987654321', 'Proveedor 2', 'Carera 20 # 46 - 58', GETUTCDATE()),
	  ('9876543541', 'Proveedor 3', 'Carera 20 # 46 - 58', GETUTCDATE()),
	  ('5632945821', 'Proveedor 4', 'Carera 20 # 46 - 58', GETUTCDATE())


INSERT INTO VisualContact.dbo.Products(Code, NIFProvider, Name, Price, TmStmp)
VALUES('abc123', '123456789', 'producto 1', 100,GETUTCDATE()),
      ('abc321', '123456789', 'producto 2', 800, GETUTCDATE()),
      ('XYz123', '987654321', 'producto 3', 300, GETUTCDATE()),
	  ('zxy321', '5632945821', 'producto 4', 250, GETUTCDATE()),
	  ('tpa845', '5632945821', 'producto 5', 80, GETUTCDATE())

INSERT INTO VisualContact.dbo.Sell(Id, DNICostumer, TmStmp)
VALUES('fwfw54465', '81255612', GETUTCDATE()),
      ('T446gs52', '778454843', GETUTCDATE()),
	  ('GEI814s52', '778454843', GETUTCDATE()),
	  ('J746gs52', '43651394', GETUTCDATE())

	  
INSERT INTO VisualContact.dbo.DetailSell(Id ,IdSell, CodeProduct, TotalItems, TmStmp)
VALUES ('posd5q48', 'fwfw54465','abc123', 2, GETUTCDATE()),
       ('fsd5q48', 'fwfw54465','abc321', 1, GETUTCDATE()),
	   ('45sd5q48', 'T446gs52','abc123', 3, GETUTCDATE()),
	   ('q84d5q48', 'GEI814s52','zxy321', 1, GETUTCDATE()),
	   ('eeq84d5q48', 'GEI814s52','tpa845', 5, GETUTCDATE()),
	   ('htrd5q48', 'J746gs52','zxy321', 1, GETUTCDATE())
	   



