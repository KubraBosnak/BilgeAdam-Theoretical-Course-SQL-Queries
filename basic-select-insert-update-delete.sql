-- CTRL + SHIFT + R  ==> intellisense refresh

SELECT * FROM HarcamaTipleri
WHERE Id=2

INSERT INTO HarcamaTipleri(Id,TipAdi,Aciklama,OnemDerecesi)
 VALUES (1, '��le Yeme�i' , 'M��teri ile Ak�am Yeme�i', 2)
 
 -- T�M SATIRLARI G�NCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=10

 -- ID'S� 1 OLAN SATIRLARI G�NCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=10
 WHERE Id=1

 -- ID'S� 1 OLAN SATIRLARI 20 OLARAK G�NCELLER
 UPDATE HarcamaTipleri SET OnemDerecesi=20
 WHERE OnemDerecesi=1

 -- T�M SATIRLARI S�LER
 DELETE FROM HarcamaTipleri

 -- T�M SATIRLARI S�LER
 DELETE FROM HarcamaTipleri
 WHERE Id=2