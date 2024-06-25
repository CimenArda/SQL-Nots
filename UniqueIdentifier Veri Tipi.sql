--Uniqueidentifier Veri Tipi
/* 
 veri tipi, SQL Server'da benzersiz kimlikler (UUID veya GUID - Global Unique Identifier) depolamak için kullanýlan bir veri tipidir. uniqueidentifier, genellikle veritabanýndaki her satýrýn benzersiz bir kimlik ile tanýmlanmasýný saðlamak için kullanýlýr.
*/
--int ,varchar vs gibi bir veri tipidir.
--Aldýgý deðer,rakamlar ve harflerden oluþan çok büyük bir sayýdýr.
--Bundan dolayý bu kolona ayný deðerin birden fazla gelmesi neredeyse imkansýzdýr.
--O yüzden tekil bir veri oluþturmak için kullanýlýr



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




