USE master
GO

-- Data Definition Language(DDL) - CREATE, ALTER, DROP

-- database oluþturma
CREATE DATABASE testDB;
 
 -- database silme
--DROP DATABASE testDB

-- backup alma
--BACKUP DATABASE [testDB]
--TO DISK = 'C:\Users\murat\testDB.bak'

-- testDB database ine geç
USE testDB
GO

-- tablo oluþtur
CREATE TABLE Persons (
	PersonID int,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	[Address] nvarchar(250),
	City nvarchar(30)
)

-- tablo sil
DROP TABLE Persons

-- tablo kolon sil
ALTER TABLE Persons
DROP COLUMN Email

-- tablo kolon ekle
ALTER TABLE Persons
ADD Email nvarchar(50)

DROP TABLE Orders

-- kýsýtlarla(constraints) tablo oluþturma
CREATE TABLE Persons (
	PersonID int NOT NULL PRIMARY KEY IDENTITY(10,2),
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50),
	[Address] nvarchar(250),
	Age int CHECK (Age >= 18),
	Email nvarchar(50) NOT NULL UNIQUE,
	City nvarchar(30) DEFAULT 'istanbul'
)

CREATE TABLE Orders (
	OrderID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderNo int NOT NULL,
	PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
)



CREATE TABLE Persons2 (
	PersonID int IDENTITY(1,1),
	FirstName nvarchar(50),
	LastName nvarchar(50),
	[Address] nvarchar(250),
	Age int,
	Email nvarchar(50),
	City nvarchar(30)
)

ALTER TABLE Persons2
ALTER COLUMN PersonID int NOT NULL

ALTER TABLE Persons2
ADD CONSTRAINT PK_Person2_PersonID PRIMARY KEY (PersonID)

ALTER TABLE Persons2
DROP CONSTRAINT PK_Person2_PersonID

ALTER TABLE Persons2
DROP COLUMN PersonID

ALTER TABLE Persons2
ADD PersonID int IDENTITY(1,1) NOT NULL

CREATE TABLE Orders2 (
	OrderID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderNo int NOT NULL,
	PersonID int
)

ALTER TABLE Orders2
ADD CONSTRAINT FK_Person2_PersonID_Orders2_PersonID
FOREIGN KEY (PersonID) REFERENCES Persons2(PersonID)

ALTER TABLE Persons2
ADD CONSTRAINT DF_Person2_City
DEFAULT 'istanbul' FOR City

ALTER TABLE Persons2
--DROP CONSTRAINT CHK_Person2_Age_18
ADD CONSTRAINT CHK_Person2_Age_18
CHECK (Age >= 18 AND Age < 30)
--CHECK (Age >= 18 AND City = 'istanbul')

INSERT INTO Persons2 VALUES ('Murat3','Baþeren',NULL, 20, NULL,DEFAULT)
select * from Persons2