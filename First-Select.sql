--    T-SQL ALT KATEGORÝLERÝ
-- 1. DML (Data Manipulation Language) => Veri Ýþleme Dili

   --  SELECT > Veri Seçme 
   --  INSERT > Veri Ekleme
   --  UPDATE > Veri Düzenleme 
   --  DELETE > Veri Silme

-- 2. DDL (Data Definition Language) => Veri Tanýmlama Dili

   -- CREATE > Tablo Oluþturma
   -- ALTER  > Tablo Düzenleme 
   -- DROP   > Tablo Kaldýrma

-- 3. DCL (Data Control Language) => Veri Kontrol Dili

  -- GRANT  > Kullanýcýya yetki vermek için kullanýlýr
  -- DENY   > Kullanýcýya yetkilerini engellemek için kullanýlýr. GRANT'ýn tersidir.
  -- REVOKE > Deðiþtirilen yetkinin eski haline getirmek için kullanýlýr.

  -- TÜM VERÝLERÝ ÇEKMEK ÝÇÝN KULLANILIR.
  SELECT 
  *
  FROM Kullanicilar

  -- SÜTUN ÝSÝMLERÝNÝ YAZARAK ÝSTEDÝÐÝMÝZ VERÝYÝ BU ÞEKÝLDE ÇEKEBÝLÝRÝZ.

  SELECT 
		Adi, 
		Soyadi, 
		Yas
  FROM Kullanicilar