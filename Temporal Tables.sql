

--Temporal Teables(System-Versioned Table -Zamansal Tablolar)
-- SQL Server'da veri deðiþikliklerinin otomatik olarak takip edilmesini ve sorgulanmasýný saðlayan bir özelliktir. Zamansal tablolar, veri geçmiþini tutar ve belirli bir zaman dilimindeki veri durumunu sorgulamanýza olanak tanýr.




--Temporal Tables Özelliðini kullanýrken Nelere Dikkat Etmeliyiz ?

--Temporal Tables ile raporlama ve takip mekanizmasý oluþturacaðýmýz tablolarda Primary key ile tanýmlanmýþ bir kolon olmasý gerekmektedir.Bu þekilde yaþam döngüsünde hangi verinin deðiþime uðradýgýný bu primary key aracýlýgýyla ayýrt edebileceðiz.

--Takibi saðlayacaðimiz ve kaydýný tutacaðýmýz tablomuzun içerisinde bir baþlangýç(StartDate) birde bitiþ(EndDate) niteliðinde iki adet "datetime2" tipinden kolonlarýn bulunmasý gerekmektedir.

--Linked Server üzerinden Temporal Tables kullanýlmamaktadýr.
--History tablomuzda constraint yapýlarýn hiçbirini uygulayamayýz.
--Eðer bir tabloda Temporal Tables aktifse o tabloda Truncate iþlemi gerçekleþtiremiyoruz.
--History Tablosunda direkt olarak DML iþlemleri gerçekleþtiremiyoruz.
--Temporal Tables özelliðinin bulundugu bir tabloda Computed Column(Hesaplanmýþ kolon) tanýmlamýyoruz.



--Temporal Tables Oluþturma

Create Table DersKayitlari
(
	--1.kýsým
	DersID int primary key Identity(1,1),
	Ders nvarchar(max),
	Onay BIT,

	--2.kýsým
	StartDate DATETIME2 Generated always as row start not null,
	EndDate Datetime2 Generated always as row end not null,

	--3.kýsým
	PERIOD For System_Time(StartDate,EndDate)
)
With(SYSTEM_VERSIONING=ON(HISTORY_TABLE =dbo.DersKayitlariLog))--Eðer Hýstory_table özelliði history tablosuna isim vermezsek rastgele isimde oluþturulur.



--Var olan Tabloyu Temporal Tables Olarak Ayarlama
Create Table DersKayitlari2
(
		DersID int primary key Identity(1,1),
		Ders nvarchar(max),
		Onay BIT

)
Insert DersKayitlari2 values ('matematik',1),('türkçe',2),('fen',3)

--Eðerki bu tabloyu temporal yapmak istiyorsak dikkat!!
--Tablo içerisinde veri varmý yok mu ? eðer varsa yeni eklenecek olan "StartDate" ve "EndDate" kolonlarý boþ kalamayacaklarý için varsayýlan deðerlerin belirtilmesi gerekmektedir.Yok eðer veri yoksa bu iþlemi düþünmemize gerek yoktur.


--EÐER VERÝ YOKSA.....
Alter table DersKayitlari2
Add
StartDate Datetime2 generated always as row start not null,
EndDate Datetime2 generated always as row end not null,
Period for System_Time(StartDate,EndDate)

--Eðer Veri Varsa
Alter Table DersKayitlari2
Add
StartDate Datetime2 generated always as row start not null,
Default Cast('1900-01-01 00:00:00.0000000' as Datetime2),
EndDate Datetime2 generated always as row end not null,
Default Cast('9999-12-31 23:59:59.99999999' as Datetime2),
Period for System_Time(StartDate,EndDate)

--þeklinde periyodik kayýt kolonlarýmýzý ekleyebiliriz.

--Kolonlarý ekledikten sonra ilgili tablo aþagýdaki gibi temporal hale getirilebilir.

Alter Table DersKayitlari2
Set 
(SYSTEM_VERSIONING=ON(HISTORY_TABLE =dbo.DersKayitlari2Log))



 --Parametrik Olarak Temporal Tabloyu Sorgulama

 --AS OF<Datetime>

 Select * from DersKayitlari
 for System_Time as of '2016-09-26 06:22:53.5454555'
 where DersID=2

 --From
  Select * from DersKayitlari
 for System_Time From '2016-09-26 06:22:53.5454555' to '2016-10-26 06:22:53.5454555'
 where DersID=2



 --Veritabýnýndaki temporal tablolarý listelemek
 Select 
 Name,OBJECT_ID,TEMPORAL_TYPE_DESC,HISTORY_TABLE_ID,OBJECT_NAME(HISTORY_TABLE_ID) AS
 [History Tablo Adý]
 FROM sys.tables
 where OBJECT_NAME (HISTORY_TABLE_ID) IS NOT NULL

 

 --Temporal Tabloyu Pasifize etme

 Alter TABLE dbo.DersKayitlari Set (SYSTEM_VERSIONING=OFF)

 Truncate table DersKayitlari
 Drop Table DersKayitlari
