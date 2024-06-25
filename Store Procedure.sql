

--Stored Procedures(Saklý Yordamlar)

--Normal Sorgulardan daha hýzlý çalýsýrlar
/*Nedeni ise normal sorgular execute edilirken "Execute plan" iþlemi yapýlýr.Bu iþlem sýrasýnda hangi tablodan veri çekilecek,hangi kolonlardan gelecek bunlar nerede vs gibi iþlemler yapýlýr. Bir sorgu her çalýstýrýldýgýnda bu iþlemler tekrar yapýlýr.
	Fakat sorgu store procedure olarak çalýstýrýlýrsa bu iþlem sadee bir kere yapýlýr ve o da ilk çalýstýrma esnasýndadýr.
	Diðer calýstýrmalarda bu iþlemler yapýlmaz. Bundan dolayý hýz artýþý olur.
	Ýçerisinde select ýnsert update delete iþlemleri yapýlabilir.
	Ýç içe kullanýlabilir.
	Ýçlerinde Fonksiyon olusturulabilir.

	Sorgularýmýzýn dýsarýdan alacagý deðerler parametre olarak store procedurlere geçirilebildiðinden dolayý sorgularýmýzýn "SQL INJECTÝON " yemelerinide de önlemiþ oluruz.

	Fiziksel veritabaný nesnesidir.Haliyele Create komutu ile olusturulur.

	Programmability -->Store Procedures


--*/
----Create proc [isim]
--(
--	varsa parametreler
--)
--as
----Yazýlacak sorgular kodlar sartlar fonksiyonlar komutlar


--Tanýmlama
Create proc sp_Ornek
(
	@ID int --aksi söylenmediði  takdirde bu parametrenin yapýsý inputtur.
)
as
Select * from Personeller where PersonelID=@ID

Exec sp_Ornek 3



--Geriye deðer döndüren store procedureler

Create Proc UrunGetir
(
	@Fiyat  Money 
)
as
Select * from Urunler Where BirimFiyati>@Fiyat
Return @@RowCount

exec UrunGetir 14
--Bu þekilde geriye dönülen deðeri elde etmeksizin kullanýlabilir.Sýkýntý olmaz



--Output ile Deðer Döndürme
Create proc Sp_Ornek3
(
	@ID int,
	@Adi nvarchar(Max) Output,
	@SoyAdi nvarchar(Max) Output
)
as
Select @Adi=Adi,@SoyAdi=SoyAdi from Personeller where PersonelID=@ID

--Kullanýmý
Declare @Adi nvarchar(max),@SoyAdi nvarchar(max)
Exec Sp_Ornek3 3,@Adi Output ,@SoyAdi Output
Select @Adi + ' '+@SoyAdi



--Örnek
--Dýþarýdan aldýgý isim ,soyisim ve þehir bilgilerini personeller tablosunda ilgili kolonlara ekleyen sotre procedure ü yazalým

Create proc sp_PersonelEkle
(
	@Ad nvarchar(max),
	@SoyAd nvarchar(max),
	@Þehir nvarchar(max)

)
as
Insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@SoyAd,@Þehir)

Exec sp_PersonelEkle 'Arda','Çimen','Sivas'

Select * from Personeller




-- Stored Procedure - Parametrelere Varsayýlan Deðer Verme
Create proc sp_PersonelEkle2
(
	@Ad nvarchar(max) ='Ýsimsiz',
	@SoyAd nvarchar(max) ='Soyadsýz',
	@Þehir nvarchar(max) ='þehir girilmemiþ'

)
as
Insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@SoyAd,@Þehir)


Exec sp_PersonelEkle2 'Gökhan' 'Asker' 'Hatay'
--Burada varsayýlan deðerler devreye girmez.

Exec sp_PersonelEkle2
--bu þekilde parametre girmezsek varsayýlan deðerler devreye girer.

Exec sp_PersonelEkle2 'Ýbrahim'
--adi parametresi deðerini alýr.Diðerleri varsayýlan deðerler eklenir.


