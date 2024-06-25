-- Row Level Security Özelliði Giriþ
--RLS, bir tabloya yapýlan sorgularýn sonuçlarýný kullanýcýnýn kimliðine veya oturum baðlamýna göre filtreleyerek satýr düzeyinde eriþim denetimi saðlar. Bu, her kullanýcýnýn yalnýzca kendilerine izin verilen verileri görmesini saðlar.



Create Database Ornek
go 
use Ornek
go
Create Table Satislar
(
	SatisID int primary key identity,
	Urun nvarchar(max),
	adet int ,
	Kullanýcý nvarchar(max)
)
go 
Insert Satislar values ('AURUN',3,'ARDA'),
						('BURUN',2,'AHMET'), ('CURUN',4,'ALÝ'), ('ZURUN',5,'AYÞE')


--Kullancýlarý oluþturalým
Create User Gencay without login
Create User Arda without login
Create User Ali without login

--BU KULLANICILARA SATÝSLAR TABLOSUNDA SELECT YETKÝSÝ VERELÝM
GRANT SELECT ON Satislar to Gencay
GRANT SELECT ON Satislar to Arda
GRANT SELECT ON Satislar to Ali

--ROW LEVEL SECURÝTY ÖZELLÝÐÝNÝ KULLANABÝLMEK ÝCÝN INLÝNE TABLE VALUE FUNCTÝON OLUÞTURMALIYIZ.
Create function ROWLEVELFUNCTÝON (@kullaniciAdi as sysname)
returns table
with SCHEMABINDING
AS
Return select 1 rowlevelResult
where @kullaniciAdi =USER_NAME()

--Þimdi bu fonksiyonu,birazdan olusturacaðýmýz security policy(güvenlik politikasý) için filter predicate olarak ekliyoruz.Yani uzun lafýn kýsasý filtre olarak ayarlýyoruz.
Create Security policy GuvenlikFiltresi
add filter predicate dbo.ROWLEVELFUNCTÝON(Kullanýcý)
on dbo.Satislar
with(State=On)

--Dikkat
--Kullanýlan tüm yapýda þema adlarýný(.dbo) unutma
Exec as User ='Ali'
Select * from Satislar