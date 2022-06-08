-- VIEW Oluþtur
CREATE VIEW VIEW_CategoryProducts AS

SELECT C.CategoryName, P.ProductName, P.UnitPrice
FROM Categories AS C
	LEFT JOIN Products AS P ON P.CategoryID = C.CategoryID


-- VIEW Düzenle
ALTER VIEW VIEW_CategoryProducts AS

SELECT C.CategoryName, P.ProductName, P.UnitPrice
FROM Categories AS C
	LEFT JOIN Products AS P ON P.CategoryID = C.CategoryID

-- VIEW Sil
DROP VIEW VIEW_CategoryProducts

-- Örnek
SELECT CategoryName, ProductName FROM VIEW_CategoryProducts
WHERE CategoryName = 'Condiments'