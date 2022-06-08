-- CTRL + SHIFT + R  ==> intellisense refresh

SELECT * FROM HarcamaTipleri
WHERE Id=2

INSERT INTO HarcamaTipleri(Id,TipAdi,Aciklama,OnemDerecesi)
 VALUES (1, 'Öðle Yemeði' , 'Müþteri ile Akþam Yemeði', 2)
 
 -- TÜM SATIRLARI GÜNCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=10

 -- ID'SÝ 1 OLAN SATIRLARI GÜNCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=10
 WHERE Id=1

 -- ID'SÝ 1 OLAN SATIRLARI 20 OLARAK GÜNCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=20
 WHERE OnemDerecesi=1

 -- TÜM SATIRLARI SÝLER
 DELETE FROM HarcamaTipleri

 -- TÜM SATIRLARI SÝLER
 DELETE FROM HarcamaTipleri
 WHERE Id=2