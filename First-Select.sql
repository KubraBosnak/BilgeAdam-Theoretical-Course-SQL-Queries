--    T-SQL ALT KATEGOR�LER�
-- 1. DML (Data Manipulation Language) => Veri ��leme Dili

   --  SELECT > Veri Se�me 
   --  INSERT > Veri Ekleme
   --  UPDATE > Veri D�zenleme 
   --  DELETE > Veri Silme

-- 2. DDL (Data Definition Language) => Veri Tan�mlama Dili

   -- CREATE > Tablo Olu�turma
   -- ALTER  > Tablo D�zenleme 
   -- DROP   > Tablo Kald�rma

-- 3. DCL (Data Control Language) => Veri Kontrol Dili

  -- GRANT  > Kullan�c�ya yetki vermek i�in kullan�l�r
  -- DENY   > Kullan�c�ya yetkilerini engellemek i�in kullan�l�r. GRANT'�n tersidir.
  -- REVOKE > De�i�tirilen yetkinin eski haline getirmek i�in kullan�l�r.

  -- T�M VER�LER� �EKMEK ���N KULLANILIR.
  SELECT 
  *
  FROM Kullanicilar

  -- S�TUN �S�MLER�N� YAZARAK �STED���M�Z VER�Y� BU �EK�LDE �EKEB�L�R�Z.

  SELECT 
		Adi, 
		Soyadi, 
		Yas
  FROM Kullanicilar