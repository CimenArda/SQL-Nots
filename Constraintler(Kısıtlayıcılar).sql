
--Constraintler (Kýsýtlayýcýlar)

--Constraintler Sayesinde tablolar üzerinde istediðimiz þartlar ve duruma göre kýsýtlamalar yapabiliyoruz.

--Default Constraint
--Check Constraint
--Primary Key Constraint
--Unýque Constraint
--Foreign Key Constraint



-- Default Constraint 
/* 
Default Constraint Sayesinde kolona bir deðer girilmediði takdirde varsayýlan olarak ne girilmesi gerektiði belirtilir.
*/
--Genel Yapý
--Add Constraint [Constraint Adý] Default 'Varsayýlan Deðer' For [Kolon Adý]

Create Table OrnekTablo55
(
Id int primary key Identity(1,1),
Kolon1 nvarchar(max),
Kolon2 int
)

Alter table OrnekTablo55
Add Constraint Kolon1Constraint Default 'Boþ' For Kolon1


Alter table OrnekTablo55
Add Constraint Kolon2Constraint Default -1 For Kolon2

/* 
Kolon1 sütunu için varsayýlan deðer 'Boþ'.
Kolon2 sütunu için varsayýlan deðer -1.

*/



--CHECK CONSTRAINT 
--Bir kolona girilecek olan verinin belirli bir þarta uymasýný zorunlu kýlar.

--Yapý
--Add Constraint [Constraint Adý] Check (Þart)


Alter Table OrnekTablo55
Add Constraint kolon2kontrol Check ((Kolon2 * 5)%2 =0)

--Dikkat !!
/* 
Check constraint oluþturulmadan önce  ilgili tabloda þarta aykýrý deðerler varsa eðer constraint oluþturulmaz.
Ancak önceki kayýtlarý görmezden gelip genede check constraint uygulamak istiyorsak 
'With NoCheck' komutu ile kullanmalýyýz.
*/

--With NoCheck Komutu
--Þuana kadar olan kayýtlarý görmezden gel,check constraint uygula

Alter Table OrnekTablo55
With NoCheck Add Constraint Kolon2Kontrol Check ((Kolon2 * 5)%2 =0)




--Primary Key Constraint 
/* 
Primary key constraint ile 
o kolona eklenen primary key ile baþka tablolarda foreign key oluþturarak iliþki kurmamýz mümkün olur.
Bunun yanýnda o kolonun taþýdýðý verinin tekil olacaðý da garanti edilmiþ olur.
Primary key constraint ile ayrýca CLUSTERED index oluþturulmuþ da olur.

*/
--Yapý 
--Add Constraint [Constraint Adý] Primary key (Kolon Adý)

--Dikkat 
--Primary key constraint kullanýlan kolon primary key özelliðine sahip olmalýdýr.

Alter Table OrnekTablo55
Add Constraint PrimaryId Primary key (Id)






--Unýque Constraýnt 
--Amacý belirttiðimiz deðerlerin tekil olmasýný saðlamaktýr.
--Add Constraint [Constraint Adý] UNIQUE (Kolon Adý)

Alter Table OrnekTablo
Add Constraint OrnekTabloUnique Unique (Kolon2)

--Kolon2 kolonuna unýque constraint uygulanmýþtýr .Bundan sonra iki tane ayný veriden kayýt yapýlamamaktadýr.








--fOREÝGN KEY Constraint
/*
bir tablodaki sütunun baþka bir tablodaki bir sütuna referans vermesini saðlar.
Bu, iliþkisel veritabanlarýnda tablo iliþkilerini kurmak ve veri bütünlüðünü korumak için kullanýlýr.

Tablolarýn kolonlarý arasýnda iliþki kurmamýzý saðlar.Bu iliþki neticesinde foreign key olan kolondaki karþýlýðýnýn 
boþa düþmemesi için primary key kolonu olan tablodan veri silimmesini,güncellenmesini engeller.
*/

--Genel Yapý
--Add Constraint [Constraint Adý] Foreign key (Kolon Adý) References [2.Tablo Adý] (2.Tablodaki kolon Adý)

Create Table Ogrenciler
(
	OgrenciID int primary key identity(1,1),
	DersId int,
	Adi nvarchar(max),
	SoyAdi nvarchar(max)
)
Create table Dersler 
(
	DersId int primary key identity (1,1),
	DersAdi nvarchar(max)
)

Alter Table Ogrenciler
Add Constraint ForeignKeyOgrenciDers Foreign Key (DersId) References Dersler(DersId)

--Þu durumda delete ve update iþlemlerinden iliþkili kolondaki veriler etkilenmez.
--Davranýþý deðiþtirmek için aþaðýdaki komutlar kullanýlýr.
--Cascade
--SetNull
--Set Default

