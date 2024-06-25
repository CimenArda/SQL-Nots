--Uniqueidentifier Veri Tipi
/* 
 veri tipi, SQL Server'da benzersiz kimlikler (UUID veya GUID - Global Unique Identifier) depolamak i�in kullan�lan bir veri tipidir. uniqueidentifier, genellikle veritaban�ndaki her sat�r�n benzersiz bir kimlik ile tan�mlanmas�n� sa�lamak i�in kullan�l�r.
*/
--int ,varchar vs gibi bir veri tipidir.
--Ald�g� de�er,rakamlar ve harflerden olu�an �ok b�y�k bir say�d�r.
--Bundan dolay� bu kolona ayn� de�erin birden fazla gelmesi neredeyse imkans�zd�r.
--O y�zden tekil bir veri olu�turmak i�in kullan�l�r



Create table OrnekTablo123
(
	Id int primary key identity(1,1),
	Kolon1 nvarchar(Max),
	Kolon2 nvarchar(Max),
	Kolon3 uniqueidentifier
)
--NewID Fonksiyonu
Insert OrnekTablo123 Values('x','q',NewID())
Select * from OrnekTablo123




