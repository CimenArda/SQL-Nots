
--Constraintler (K�s�tlay�c�lar)

--Constraintler Sayesinde tablolar �zerinde istedi�imiz �artlar ve duruma g�re k�s�tlamalar yapabiliyoruz.

--Default Constraint
--Check Constraint
--Primary Key Constraint
--Un�que Constraint
--Foreign Key Constraint



-- Default Constraint 
/* 
Default Constraint Sayesinde kolona bir de�er girilmedi�i takdirde varsay�lan olarak ne girilmesi gerekti�i belirtilir.
*/
--Genel Yap�
--Add Constraint [Constraint Ad�] Default 'Varsay�lan De�er' For [Kolon Ad�]

Create Table OrnekTablo55
(
Id int primary key Identity(1,1),
Kolon1 nvarchar(max),
Kolon2 int
)

Alter table OrnekTablo55
Add Constraint Kolon1Constraint Default 'Bo�' For Kolon1


Alter table OrnekTablo55
Add Constraint Kolon2Constraint Default -1 For Kolon2

/* 
Kolon1 s�tunu i�in varsay�lan de�er 'Bo�'.
Kolon2 s�tunu i�in varsay�lan de�er -1.

*/



--CHECK CONSTRAINT 
--Bir kolona girilecek olan verinin belirli bir �arta uymas�n� zorunlu k�lar.

--Yap�
--Add Constraint [Constraint Ad�] Check (�art)


Alter Table OrnekTablo55
Add Constraint kolon2kontrol Check ((Kolon2 * 5)%2 =0)

--Dikkat !!
/* 
Check constraint olu�turulmadan �nce  ilgili tabloda �arta ayk�r� de�erler varsa e�er constraint olu�turulmaz.
Ancak �nceki kay�tlar� g�rmezden gelip genede check constraint uygulamak istiyorsak 
'With NoCheck' komutu ile kullanmal�y�z.
*/

--With NoCheck Komutu
--�uana kadar olan kay�tlar� g�rmezden gel,check constraint uygula

Alter Table OrnekTablo55
With NoCheck Add Constraint Kolon2Kontrol Check ((Kolon2 * 5)%2 =0)




--Primary Key Constraint 
/* 
Primary key constraint ile 
o kolona eklenen primary key ile ba�ka tablolarda foreign key olu�turarak ili�ki kurmam�z m�mk�n olur.
Bunun yan�nda o kolonun ta��d��� verinin tekil olaca�� da garanti edilmi� olur.
Primary key constraint ile ayr�ca CLUSTERED index olu�turulmu� da olur.

*/
--Yap� 
--Add Constraint [Constraint Ad�] Primary key (Kolon Ad�)

--Dikkat 
--Primary key constraint kullan�lan kolon primary key �zelli�ine sahip olmal�d�r.

Alter Table OrnekTablo55
Add Constraint PrimaryId Primary key (Id)






--Un�que Constra�nt 
--Amac� belirtti�imiz de�erlerin tekil olmas�n� sa�lamakt�r.
--Add Constraint [Constraint Ad�] UNIQUE (Kolon Ad�)

Alter Table OrnekTablo
Add Constraint OrnekTabloUnique Unique (Kolon2)

--Kolon2 kolonuna un�que constraint uygulanm��t�r .Bundan sonra iki tane ayn� veriden kay�t yap�lamamaktad�r.








--fORE�GN KEY Constraint
/*
bir tablodaki s�tunun ba�ka bir tablodaki bir s�tuna referans vermesini sa�lar.
Bu, ili�kisel veritabanlar�nda tablo ili�kilerini kurmak ve veri b�t�nl���n� korumak i�in kullan�l�r.

Tablolar�n kolonlar� aras�nda ili�ki kurmam�z� sa�lar.Bu ili�ki neticesinde foreign key olan kolondaki kar��l���n�n 
bo�a d��memesi i�in primary key kolonu olan tablodan veri silimmesini,g�ncellenmesini engeller.
*/

--Genel Yap�
--Add Constraint [Constraint Ad�] Foreign key (Kolon Ad�) References [2.Tablo Ad�] (2.Tablodaki kolon Ad�)

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

--�u durumda delete ve update i�lemlerinden ili�kili kolondaki veriler etkilenmez.
--Davran��� de�i�tirmek i�in a�a��daki komutlar kullan�l�r.
--Cascade
--SetNull
--Set Default

