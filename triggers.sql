 -- Triggers (Tetikleyiciler)
 -- Trigger bir tabloda gerçekleşen insert, update veya delete olaylarını takip etme yeteneğine sahiptir
--Bir işlemden sonra başka bir işlem yapabilmeyi veya bir işlemin yerine başka bir işlem yapabilmeyi sağlayan yapıdır.
--Kullanıcı elle triggger tetikleyemeyiz. 
--Trigger diğer yapılardan farkı çalışacağı zamanı kendisi belirler
--Kullanıcı elle triggger tetikleyemeyiz. 
--Trigger diğer yapılardan farkı çalışacağı zamanı kendisi belirler
-- Eklenme işlemlerinde inserted tablosu devreye girer
-- Silinme işlemlerinde ise deleted tablosu devreye alınır
-- Güncellenmeye çalışılan kayıt eski halini deleted tablosunda yeni hali inserted tablosunda tutulur

select * from Products 

insert into Products(ProductName, UnitPrice ,UnitsInStock)
values('Test', 15, 15)

delete Products where ProductID=79
--Product tablosuna delete komutu gönderildiğinde delete komutu yerine update komutunu çalıştıran trigger yazalım

----------------------------------------------------------------------------
--Değişkenler kullanımı : declare @degiskenAdi veriTipi


--Değişken adlarından önce @ karakteri kullanılır
--Daha sonra değişken adı ve en son veri tipi yazılır
-- Değişkenlere atama set veya select ile yapılabilir

declare @calisanID int
select @calisanID=EmployeeID from Employees where FirstName='Nancy'
--set @calisanID=7
print 'Nancy isimli calisanın ID si : ' + cast(@calisanID as nvarchar(10))
----------------------------------------------------------

--instead of trigger : Belirli bir tablo üzerinde belirli bir işlemin yerine başka bir işlem çalıştırmayı sağlayan trigger tipidir
--El ile trigger tetiklenemez . Çalışcağı zamanı kendi belirler. Örneğin procedure de exec ile biz çalıştırırken trigger öyle bir durum söz konusu değil
--Object Explorer hangi tabloya yazdıysak onun altında trigger menüsünde
create trigger trgDeleteProduct
on Products --hangi tabloda çalışacağız
instead of -- hangi trigger tipi
delete --hangi işlem içi trigger
as
	declare @id int		--silmeye çalıştığımız ürün id si
	--select @id=ProductID from deleted -- select ile atama
	set @id=(select ProductID from deleted)
	update Products set Discontinued=1 where ProductID=@id


--after trigger : Belirli bir tablo üzerinde belirli bir işlemden sonra başka bir işlem daha yapabilmeyi sağlayan triggerdır. 

-- OrderDetails tablosuna kayıt girildiğinde satılan ürün adedi kadar o ürünün stoğundan düşen trigger yazalım

create trigger trgDescProduct
on [Order Details]
after
insert
as 
	declare @id int, @adet smallint
	select @id=ProductID, @adet=Quantity from inserted
	update Products set UnitsInStock-=@adet where ProductID=@id

select * from Products
select * from [Order Details] order by ProductID

insert into [Order Details](OrderID,ProductID, UnitPrice, Quantity, Discount) values(10285, 1, 18, 5, 0)

delete [Order Details] where OrderID=10285

--OrderDetails tablosundan kayıt silindiğinde o ürünün stoğunu satış adeti kadar artıran trigger yazınız
go
create trigger trg_SatisSil
on [Order Details]
after
delete
as
	declare @id int, @adet smallint
	select @id=ProductID, @adet=Quantity from deleted
	update Products set UnitsInStock+=@adet where ProductID=@id

delete [Order Details] where OrderID=10248 and ProductID=1 and UnitPrice = 12 and Quantity=10 and Discount=0
select * from Products