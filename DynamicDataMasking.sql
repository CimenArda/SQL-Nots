--Dynamic Data Masking Giriþ
--SQL Server'da hassas verilerin korunmasýna yardýmcý olan bir güvenlik özelliðidir. DDM, yetkisiz kullanýcýlarýn hassas verilere eriþimini sýnýrlamak için verileri maskeleyerek veritabaný sorgularýnýn sonuçlarýný deðiþtirmeden veri görünürlüðünü kýsýtlar. 

--Default: Sütun veri türüne uygun varsayýlan bir maskeleme uygular.
--Email: E-posta adresi formatýnda maskeleme yapar.
--Custom String: Belirli karakterlerle özel bir maskeleme yapar.
--Random: Sayýsal deðerler için rastgele bir maskeleme uygular.

--Default Parametresi

--Metinsel :XXXX
--Sayýsal : 0000
--Tarhisel 01.01.200 00.00.00.0000
--Binary :0 ASCII

--Email parametresi
--ardacimen@gmail.com --> axxx@xxxx.com

--Partial parametresi
--Partial(3,M,2)




----Prototip
----Create Table tablo adý 
--(
--	kolon adý kolon tipi masked with (Function ='default()')

--)


Create Table Ogrencile
(
	ID int primary key identity(1,1),
	Adi nvarchar(20) masked with (function ='default()') Null,
	SoyAdi nvarchar(20) masked with (function ='default()') Null,
	Memleketi nvarchar(20) masked with (function ='default()') Null,
	Email nvarchar(max) masked with (function='email()')null,
	Hakkinda nvarchar(max) masked with (function='partial(3,"H",2)') null,
	DogumTarihi datetime masked with (function ='default()')

)
Insert Ogrencile values ('elif','cimen','mus','ardacimn@gmail.com','deneme123','1999-09-08')

--Suanda select cekersem verileri görürüm cünkü yetkili kullanýcýyým

Create User YetkiliUser without login --yetkiliUser ÝSMÝNDE bir kullanýcý olusturuluyor.
Go
Grant Select on Ogrencile to YetkiliUser --yetkiliUser isimli kullanýcýya Ogrencile tablosunda select yetkisi veriliyor.

Execute as User ='YetkiliUser' --yetkiliUser isimli kullanýcýdayken 
Select * from Ogrencile



--Alter ile Kolona Dynmic Data Masking Uygulama

Alter table Ogrencile
Add Ekkolon nvarchar(max) masked with (function ='partial(3,"XXX",0)')

Execute as User ='YetkiliUser'
Select * from Ogrencile


--Alter Ýle Kolunun Maske Formatýný Güncelleme
ALTER TABLE Ogrencile
ALTER COLUMN Memleketi ADD MASKED WITH (FUNCTION = 'partial(3,"H",2)');



--Dynamic Data Masking Özelliðini Kolondan Kaldýrma
Alter table Ogrencile
Alter Column Email Drop Masked

-- Dynamic Data Masking Özelliðini Kullanýcýya Özel Pasifleþtirme
Grant UNMASK to YetkiliUser

Select * from Ogrencile