SELECT * INTO Customers_Copy
FROM Customers

SELECT CompanyName, ContactName + ' (' + ContactTitle + ')' AS Contact 
	INTO Customers_Copy2
FROM Customers

SELECT * FROM Customers_Copy
SELECT * FROM Customers_Copy2

SELECT t.* 
	INTO CategoryProducts
FROM (
SELECT C.CategoryName, P.ProductName, P.UnitPrice
FROM Categories AS C
	INNER JOIN Products AS P ON P.CategoryID = C.CategoryID) AS t

select * from CategoryProducts

drop table Customers_Copy2

select * 
	into customers2
from Customers
where 1 = 0

select * from customers
select * from customers2

INSERT INTO customers2
SELECT * from customers WHERE Country = 'Germany'

SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder,0))
FROM Products
order by ProductName