--12/02/2025
--#region SQL NOTLARI
-- Transact SQL (T-SQL) Dili Özellikleri

-- Transact-SQL, veritabanında transaction (işlem) bazlı veri yönetimi sağlayan bir SQL dilidir.

-- Yorum Satırı "--" ifadesidir.

-- T-SQL ile veri çekme, kaydetme, güncelleme ve silme gibi işlemlerle veritabanına müdahale edebilir, database oluşturma - silme, tablo oluşturma - silme işlemlerini gerçekleştirebilir ve diğer veritabanı yapıları ve programatik işlemlerde kullanacağımız veritabanı programlama araçlarını oluşturabiliriz.

-- T-SQL büyük küçük harf duyarlılığına sahip bir dil değildir.
-- gençay = Gençay = GeNçAy
--#endregion
-- 
USE Northwind -- Kullanacağımız veritabanını bu şekilde seçeriz.


-- Select Komutu
Select 3

Select 'Gençay'   -- tablo şekilinde seçilen değeri getirir
print 'Gençay'    -- mesaj ekranında gösterir

Select 3, 5, 7    -- tablo şekilinde seçilen değeri getirir

Select 'Gençay', 'Yıldız', 25

Select * from Personeller   -- Personeller tablosunu getirir. * üzerinde durulursa tüm sütunları gösterir.

Select Adi, SoyAdi from Personeller    -- İstenen kolanları getirmek için

-- Alias (takma ad) Kolon İsmi Atama 
Select 3 as Değer     -- Kolon ismi Değer, hücre içine yazılacak değer 3 olacaktır.
Select 3 Değer        -- Güncel versiyonda "as" yazmaya gerek yoktur.

Select 'Gençay' Adi, 'Yıldız' SoyAdi

Select Adi İsimler, SoyAdi Soyİsimler from Personeller

-- Boşluk Karakteri Olan Alias Atama
Select 1453 İstanbulun Fethi

Select 1453 [İstanbulun Fethi]

-- Boşluk Karakteri Olan Tabloyu Sorgulama
Select * from Satış Detayları

Select * from [Satis Detaylari]

-- Kolonları Birleştirme
Select Adi, SoyAdi from Personeller

Select Adi + ' ' + SoyAdi [Personel Bilgileri] from Personeller       -- iki kolanda aynı tipte ise 

-- Farklı Tipte Kolonları Birleştirme
Select Adi + ' ' + IseBaslamaTarihi from Personeller      -- farklı tipte olduğu için çalışmaz.

Select Adi + ' ' + Convert(nvarchar, IseBaslamaTarihi) from Personeller    -- nvarchar'a çevirerek yazdırabiliriz.

Select Adi + ' ' + CAST(IseBaslamaTarihi as nvarchar) from Personeller

-- Select Sorgularında (Where) Şartı Yazmak

Select * from Personeller;

-- Personeller tablosunda şehri London olan verileri listeleyelim.
Select * from Personeller Where Sehir = 'London';

-- Personeller tablosunda bağlı çalıştığı kişi sayısı 5'ten küçük olanları listeleyelim.
Select * from Personeller Where BagliCalistigiKisi < 5;

-- And Operatörü
-- Personeller tablosunda şehri London ve ülkesi UK olanları listeleyelim.
Select * from Personeller Where Sehir = 'London' and Ulke = 'UK';

-- Or Operatörü
-- Personeller tablosunda UnvanEki 'Mr.' olan veya şehri Seattle olan tüm personelleri listeleyelim.
Select * from Personeller Where UnvanEki = 'Mr.' or Sehir = 'Seattle';

-- Karışık Örnekler
-- Adı Robert soyadı King olan personelin tüm bilgilerini çek.
Select * from Personeller Where Adi = 'Robert' and SoyAdi = 'King';

-- PersonelID'si 5 olan personeli getir.
Select * from Personeller Where PersonelID = 5;

-- PersonelID'si 5'ten büyük olan tüm personelleri getir.
Select * from Personeller Where PersonelID >= 5;

-- Karşılaştırma Operatörleri:
<>  -- Eşit Değilse
=   -- Eşitse
<=  -- Küçük ve Eşitse
>=  -- Büyük ve Eşitse

-- Fonksiyon Sonuçlarını Şart Olarak Kullanmak
-- 1993 yılında işe başlayanları listele.
Select * from Personeller Where YEAR(IseBaslamaTarihi) = 1993;

-- 1992 yılından sonra işe başlayanları listele.
Select * from Personeller Where YEAR(IseBaslamaTarihi) > 1992;

-- Doğum günü, ayın 29'u olmayan personelleri listeleyelim.
Select * from Personeller Where DAY(DogumTarihi) <> 29;

-- Yaşadığı şehrin London, Tacoma ve Kirkland olduğu personellerin adını listeleyelim.
Select Adi from Personeller Where Sehir = 'London' or Sehir = 'Tacoma' or Sehir = 'Kirkland';

--In Komutu
Select Adi from Personeller Where Sehir In('London','Tacoma','Kirkland')


-- Doğum yılı 1950 ile 1965 yılları arasında olan personelleri getirelim.
Select * from Personeller Where YEAR(DogumTarihi) > 1950 and YEAR(DogumTarihi) < 1965;

--Betwwen Komutu
Select * from Personeller Where YEAR(DogumTarihi) Between 1950 and 1965

-- Like Sorguları
-- %(Genel Önemli Değil) Operatörü

-- İsminin baş harfi J olan personellerin adını ve soyadını yazdıralım.
Select Adi, SoyAdi from Personeller Where Adi Like 'J%';

-- İsminin son harfi y olan personellerin adını ve soyadını yazdıralım.
Select Adi, SoyAdi from Personeller Where Adi Like '%y';

-- İsminin son üç harfi "ert" olan personeli getirelim.
Select * from Personeller Where Adi Like '%ert';

-- İsminin ilk harfi "r", son harfi "t" olan personeli getirelim.
Select * from Personeller Where Adi Like 'r%t';

-- Gereksiz bir kullanım.
Select * from Personeller Where Adi Like 'r%' and Adi Like '%t';

-- İsminin içinde "an" geçen personelin adını yazdıralım.
Select Adi from Personeller Where Adi Like '%an%';

-- İsminin baş harfi "n" olan ve içerisinde "an" geçen personeli getirelim.
Select * from Personeller Where Adi Like 'n%an%';

-- Gereksiz bir kullanım.
Select * from Personeller Where Adi Like 'n%' and Adi Like '%an%';

-- (_ Özel Önemli Değil) Operatörü
-- İsminin ilk harfi "a", ikinci harfi fark etmez ve üçüncü harfi "d" olan personeli getirelim.
Select * from Personeller Where Adi Like 'a_d%';

-- İsminin ilk harfi "m", ikinci - üçüncü - dördüncü fark etmez ve beşinci harfi "a" olan personeli getirelim.
Select * from Personeller Where Adi Like 'm___a%';

-- [] (Ya da) Operatörü

-- İsminin ilk harfi n, m veya r olan personelleri getirelim.
Select * from Personeller Where Adi Like '[nmr]%';

-- İsminin içerisinde a ya da i geçen personelleri getirelim.
Select * from Personeller Where Adi Like '%[ai]%';

-- [-] (Alfabetik Arasında) Operatörü

-- İsminin baş harfi a ile k arasında alfabetik sıraya göre herhangi bir harf olan personellerin adını yazdıralım.
Select Adi from Personeller Where Adi Like '[a-k]%';

-- [^] (Değil) Operatörü

-- İsminin baş harfi a olmayan personelleri getirelim.
Select * from Personeller Where Adi Like '[^a]%';

-- İsminin baş harfi a veya n olmayan personelleri getirelim.
Select * from Personeller Where Adi Like '[^an]%';
