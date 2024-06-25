

--Temporal Teables(System-Versioned Table -Zamansal Tablolar)
-- SQL Server'da veri de�i�ikliklerinin otomatik olarak takip edilmesini ve sorgulanmas�n� sa�layan bir �zelliktir. Zamansal tablolar, veri ge�mi�ini tutar ve belirli bir zaman dilimindeki veri durumunu sorgulaman�za olanak tan�r.




--Temporal Tables �zelli�ini kullan�rken Nelere Dikkat Etmeliyiz ?

--Temporal Tables ile raporlama ve takip mekanizmas� olu�turaca��m�z tablolarda Primary key ile tan�mlanm�� bir kolon olmas� gerekmektedir.Bu �ekilde ya�am d�ng�s�nde hangi verinin de�i�ime u�rad�g�n� bu primary key arac�l�g�yla ay�rt edebilece�iz.

--Takibi sa�layaca�imiz ve kayd�n� tutaca��m�z tablomuzun i�erisinde bir ba�lang��(StartDate) birde biti�(EndDate) niteli�inde iki adet "datetime2" tipinden kolonlar�n bulunmas� gerekmektedir.

--Linked Server �zerinden Temporal Tables kullan�lmamaktad�r.
--History tablomuzda constraint yap�lar�n hi�birini uygulayamay�z.
--E�er bir tabloda Temporal Tables aktifse o tabloda Truncate i�lemi ger�ekle�tiremiyoruz.
--History Tablosunda direkt olarak DML i�lemleri ger�ekle�tiremiyoruz.
--Temporal Tables �zelli�inin bulundugu bir tabloda Computed Column(Hesaplanm�� kolon) tan�mlam�yoruz.



--Temporal Tables Olu�turma

Create Table DersKayitlari
(
	--1.k�s�m
	DersID int primary key Identity(1,1),
	Ders nvarchar(max),
	Onay BIT,

	--2.k�s�m
	StartDate DATETIME2 Generated always as row start not null,
	EndDate Datetime2 Generated always as row end not null,

	--3.k�s�m
	PERIOD For System_Time(StartDate,EndDate)
)
With(SYSTEM_VERSIONING=ON(HISTORY_TABLE =dbo.DersKayitlariLog))--E�er H�story_table �zelli�i history tablosuna isim vermezsek rastgele isimde olu�turulur.



--Var olan Tabloyu Temporal Tables Olarak Ayarlama
Create Table DersKayitlari2
(
		DersID int primary key Identity(1,1),
		Ders nvarchar(max),
		Onay BIT

)
Insert DersKayitlari2 values ('matematik',1),('t�rk�e',2),('fen',3)

--E�erki bu tabloyu temporal yapmak istiyorsak dikkat!!
--Tablo i�erisinde veri varm� yok mu ? e�er varsa yeni eklenecek olan "StartDate" ve "EndDate" kolonlar� bo� kalamayacaklar� i�in varsay�lan de�erlerin belirtilmesi gerekmektedir.Yok e�er veri yoksa bu i�lemi d���nmemize gerek yoktur.


--E�ER VER� YOKSA.....
Alter table DersKayitlari2
Add
StartDate Datetime2 generated always as row start not null,
EndDate Datetime2 generated always as row end not null,
Period for System_Time(StartDate,EndDate)

--E�er Veri Varsa
Alter Table DersKayitlari2
Add
StartDate Datetime2 generated always as row start not null,
Default Cast('1900-01-01 00:00:00.0000000' as Datetime2),
EndDate Datetime2 generated always as row end not null,
Default Cast('9999-12-31 23:59:59.99999999' as Datetime2),
Period for System_Time(StartDate,EndDate)

--�eklinde periyodik kay�t kolonlar�m�z� ekleyebiliriz.

--Kolonlar� ekledikten sonra ilgili tablo a�ag�daki gibi temporal hale getirilebilir.

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



 --Veritab�n�ndaki temporal tablolar� listelemek
 Select 
 Name,OBJECT_ID,TEMPORAL_TYPE_DESC,HISTORY_TABLE_ID,OBJECT_NAME(HISTORY_TABLE_ID) AS
 [History Tablo Ad�]
 FROM sys.tables
 where OBJECT_NAME (HISTORY_TABLE_ID) IS NOT NULL

 

 --Temporal Tabloyu Pasifize etme

 Alter TABLE dbo.DersKayitlari Set (SYSTEM_VERSIONING=OFF)

 Truncate table DersKayitlari
 Drop Table DersKayitlari
