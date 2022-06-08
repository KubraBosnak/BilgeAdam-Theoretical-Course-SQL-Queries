-- VIEW Olu�tur
CREATE VIEW VIEW_CategoryProducts AS

SELECT C.CategoryName, P.ProductName, P.UnitPrice
FROM Categories AS C
	LEFT JOIN Products AS P ON P.CategoryID = C.CategoryID


-- VIEW D�zenle
ALTER VIEW VIEW_CategoryProducts AS

SELECT C.CategoryName, P.ProductName, P.UnitPrice
FROM Categories AS C
	LEFT JOIN Products AS P ON P.CategoryID = C.CategoryID

-- VIEW Sil
DROP VIEW VIEW_CategoryProducts

-- �rnek
SELECT CategoryName, ProductName FROM VIEW_CategoryProducts
WHERE CategoryName = 'Condiments'