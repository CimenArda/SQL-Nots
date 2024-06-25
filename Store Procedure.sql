

--Stored Procedures(Sakl� Yordamlar)

--Normal Sorgulardan daha h�zl� �al�s�rlar
/*Nedeni ise normal sorgular execute edilirken "Execute plan" i�lemi yap�l�r.Bu i�lem s�ras�nda hangi tablodan veri �ekilecek,hangi kolonlardan gelecek bunlar nerede vs gibi i�lemler yap�l�r. Bir sorgu her �al�st�r�ld�g�nda bu i�lemler tekrar yap�l�r.
	Fakat sorgu store procedure olarak �al�st�r�l�rsa bu i�lem sadee bir kere yap�l�r ve o da ilk �al�st�rma esnas�ndad�r.
	Di�er cal�st�rmalarda bu i�lemler yap�lmaz. Bundan dolay� h�z art��� olur.
	��erisinde select �nsert update delete i�lemleri yap�labilir.
	�� i�e kullan�labilir.
	��lerinde Fonksiyon olusturulabilir.

	Sorgular�m�z�n d�sar�dan alacag� de�erler parametre olarak store procedurlere ge�irilebildi�inden dolay� sorgular�m�z�n "SQL INJECT�ON " yemelerinide de �nlemi� oluruz.

	Fiziksel veritaban� nesnesidir.Haliyele Create komutu ile olusturulur.

	Programmability -->Store Procedures


--*/
----Create proc [isim]
--(
--	varsa parametreler
--)
--as
----Yaz�lacak sorgular kodlar sartlar fonksiyonlar komutlar


--Tan�mlama
Create proc sp_Ornek
(
	@ID int --aksi s�ylenmedi�i  takdirde bu parametrenin yap�s� inputtur.
)
as
Select * from Personeller where PersonelID=@ID

Exec sp_Ornek 3



--Geriye de�er d�nd�ren store procedureler

Create Proc UrunGetir
(
	@Fiyat  Money 
)
as
Select * from Urunler Where BirimFiyati>@Fiyat
Return @@RowCount

exec UrunGetir 14
--Bu �ekilde geriye d�n�len de�eri elde etmeksizin kullan�labilir.S�k�nt� olmaz



--Output ile De�er D�nd�rme
Create proc Sp_Ornek3
(
	@ID int,
	@Adi nvarchar(Max) Output,
	@SoyAdi nvarchar(Max) Output
)
as
Select @Adi=Adi,@SoyAdi=SoyAdi from Personeller where PersonelID=@ID

--Kullan�m�
Declare @Adi nvarchar(max),@SoyAdi nvarchar(max)
Exec Sp_Ornek3 3,@Adi Output ,@SoyAdi Output
Select @Adi + ' '+@SoyAdi



--�rnek
--D��ar�dan ald�g� isim ,soyisim ve �ehir bilgilerini personeller tablosunda ilgili kolonlara ekleyen sotre procedure � yazal�m

Create proc sp_PersonelEkle
(
	@Ad nvarchar(max),
	@SoyAd nvarchar(max),
	@�ehir nvarchar(max)

)
as
Insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@SoyAd,@�ehir)

Exec sp_PersonelEkle 'Arda','�imen','Sivas'

Select * from Personeller




-- Stored Procedure - Parametrelere Varsay�lan De�er Verme
Create proc sp_PersonelEkle2
(
	@Ad nvarchar(max) ='�simsiz',
	@SoyAd nvarchar(max) ='Soyads�z',
	@�ehir nvarchar(max) ='�ehir girilmemi�'

)
as
Insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@SoyAd,@�ehir)


Exec sp_PersonelEkle2 'G�khan' 'Asker' 'Hatay'
--Burada varsay�lan de�erler devreye girmez.

Exec sp_PersonelEkle2
--bu �ekilde parametre girmezsek varsay�lan de�erler devreye girer.

Exec sp_PersonelEkle2 '�brahim'
--adi parametresi de�erini al�r.Di�erleri varsay�lan de�erler eklenir.


