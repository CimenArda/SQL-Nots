--Dynamic Data Masking Giri�
--SQL Server'da hassas verilerin korunmas�na yard�mc� olan bir g�venlik �zelli�idir. DDM, yetkisiz kullan�c�lar�n hassas verilere eri�imini s�n�rlamak i�in verileri maskeleyerek veritaban� sorgular�n�n sonu�lar�n� de�i�tirmeden veri g�r�n�rl���n� k�s�tlar. 

--Default: S�tun veri t�r�ne uygun varsay�lan bir maskeleme uygular.
--Email: E-posta adresi format�nda maskeleme yapar.
--Custom String: Belirli karakterlerle �zel bir maskeleme yapar.
--Random: Say�sal de�erler i�in rastgele bir maskeleme uygular.

--Default Parametresi

--Metinsel :XXXX
--Say�sal : 0000
--Tarhisel 01.01.200 00.00.00.0000
--Binary :0 ASCII

--Email parametresi
--ardacimen@gmail.com --> axxx@xxxx.com

--Partial parametresi
--Partial(3,M,2)




----Prototip
----Create Table tablo ad� 
--(
--	kolon ad� kolon tipi masked with (Function ='default()')

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

--Suanda select cekersem verileri g�r�r�m c�nk� yetkili kullan�c�y�m

Create User YetkiliUser without login --yetkiliUser �SM�NDE bir kullan�c� olusturuluyor.
Go
Grant Select on Ogrencile to YetkiliUser --yetkiliUser isimli kullan�c�ya Ogrencile tablosunda select yetkisi veriliyor.

Execute as User ='YetkiliUser' --yetkiliUser isimli kullan�c�dayken 
Select * from Ogrencile



--Alter ile Kolona Dynmic Data Masking Uygulama

Alter table Ogrencile
Add Ekkolon nvarchar(max) masked with (function ='partial(3,"XXX",0)')

Execute as User ='YetkiliUser'
Select * from Ogrencile


--Alter �le Kolunun Maske Format�n� G�ncelleme
ALTER TABLE Ogrencile
ALTER COLUMN Memleketi ADD MASKED WITH (FUNCTION = 'partial(3,"H",2)');



--Dynamic Data Masking �zelli�ini Kolondan Kald�rma
Alter table Ogrencile
Alter Column Email Drop Masked

-- Dynamic Data Masking �zelli�ini Kullan�c�ya �zel Pasifle�tirme
Grant UNMASK to YetkiliUser

Select * from Ogrencile