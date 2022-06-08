/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [CustomerID] AS ID
      ,[CompanyName] AS SirketAdi
      ,[ContactName] AS IletisimKisisi
	  ,'test' AS TestColumn
	  ,[CompanyName] + ' (' + [ContactName] + ')' AS CompanyContact
      --,[ContactTitle]
      --,[Address]
      --,[City]
      --,[Region]
      --,[PostalCode]
      --,[Country]
      --,[Phone]
      --,[Fax]
FROM [Customers] AS C


SELECT * FROM Customers WHERE [CustomerID] = 'ALFKI' OR [CustomerID] = 'BERGS'

SELECT * FROM Customers WHERE City = 'London' AND ContactTitle = 'Sales Representative'

SELECT * FROM Products WHERE Discontinued = 1

-- Wildcards
SELECT * FROM Customers WHERE CompanyName LIKE 'An%' -- "An" ile baþlayanlarý getir
SELECT * FROM Customers WHERE CompanyName LIKE '%An%'-- Ýçinde "An"	geçenleri getir.
SELECT * FROM Customers WHERE ContactTitle LIKE 'Sales ______________'
SELECT * FROM Customers WHERE CustomerID LIKE '%C_U'
SELECT * FROM Customers WHERE CustomerID LIKE '[A-D]%'
SELECT * FROM Customers WHERE CustomerID LIKE '[AD]%'
SELECT * FROM Customers WHERE CustomerID LIKE '[^AD]%'
SELECT * FROM Customers WHERE CustomerID LIKE '[^A-D]%'

SELECT DISTINCT ContactTitle, ContactName  FROM Customers WHERE City = 'London'
SELECT TOP(10) ContactTitle  FROM Customers WHERE City = 'London'

SELECT * FROM Customers ORDER BY CompanyName ASC  -- DESC

SELECT * FROM Customers ORDER BY City ASC, ContactTitle DESC , CompanyName ASC

SELECT * FROM Customers WHERE Region IS NOT NULL

SELECT * FROM Products 
WHERE (UnitPrice BETWEEN 20 AND 30) 
		AND (Discontinued = 0)

SELECT * FROM Products 
WHERE (UnitPrice IN (25,10,15)) 
		--AND (Discontinued = 0)

SELECT count(*) from Customers
SELECT count(*) from Products where Discontinued = 0

SELECT SUM(UnitPrice * UnitsInStock) AS Total from Products
SELECT MIN(UnitPrice) AS MinUnitPrice from Products
SELECT MAX(UnitPrice) AS MaxUnitPrice from Products

SELECT 
	MIN(UnitPrice) AS MinUnitPrice, 
	MAX(UnitPrice) AS MaxUnitPrice,
	SUM(UnitPrice * UnitsInStock) AS Total,
	AVG(UnitPrice) AS avarage
from Products

SELECT COUNT(*) FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)

SELECT COUNT(*) FROM Products
WHERE UnitPrice IN (SELECT UnitPrice FROM Products WHERE UnitPrice BETWEEN 10 AND 16)