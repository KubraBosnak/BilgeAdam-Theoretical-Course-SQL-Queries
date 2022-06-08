
CREATE PROCEDURE SelectAllCustomers
	@City nvarchar(15),
	@Country nvarchar(15)
AS
SELECT * FROM Customers WHERE City = @City AND Country = @Country

-- RDMS
-- MSSQL, MYSQL, Oracle, PostgreSQL, ACCESS

ALTER PROCEDURE SelectAllCustomers
	@City nvarchar(15),
	@Country nvarchar(15)
AS

--BEGIN
--	SELECT * FROM Customers
--END

IF (@Country IS NULL AND @City IS NULL)
	SELECT * FROM Customers
ELSE IF (@City IS NULL)
	SELECT * FROM Customers WHERE Country = @Country
ELSE IF (@Country IS NULL)
	SELECT * FROM Customers WHERE City = @City
ELSE
	SELECT * FROM Customers WHERE City = @City AND Country = @Country

EXEC SelectAllCustomers 'London','UK'
EXEC SelectAllCustomers 'London',NULL
EXEC SelectAllCustomers NULL,'UK'
EXEC SelectAllCustomers NULL,NULL

DROP PROCEDURE SelectAllCustomers