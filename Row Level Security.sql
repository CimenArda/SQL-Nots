-- Row Level Security �zelli�i Giri�
--RLS, bir tabloya yap�lan sorgular�n sonu�lar�n� kullan�c�n�n kimli�ine veya oturum ba�lam�na g�re filtreleyerek sat�r d�zeyinde eri�im denetimi sa�lar. Bu, her kullan�c�n�n yaln�zca kendilerine izin verilen verileri g�rmesini sa�lar.



Create Database Ornek
go 
use Ornek
go
Create Table Satislar
(
	SatisID int primary key identity,
	Urun nvarchar(max),
	adet int ,
	Kullan�c� nvarchar(max)
)
go 
Insert Satislar values ('AURUN',3,'ARDA'),
						('BURUN',2,'AHMET'), ('CURUN',4,'AL�'), ('ZURUN',5,'AY�E')


--Kullanc�lar� olu�tural�m
Create User Gencay without login
Create User Arda without login
Create User Ali without login

--BU KULLANICILARA SAT�SLAR TABLOSUNDA SELECT YETK�S� VEREL�M
GRANT SELECT ON Satislar to Gencay
GRANT SELECT ON Satislar to Arda
GRANT SELECT ON Satislar to Ali

--ROW LEVEL SECUR�TY �ZELL���N� KULLANAB�LMEK �C�N INL�NE TABLE VALUE FUNCT�ON OLU�TURMALIYIZ.
Create function ROWLEVELFUNCT�ON (@kullaniciAdi as sysname)
returns table
with SCHEMABINDING
AS
Return select 1 rowlevelResult
where @kullaniciAdi =USER_NAME()

--�imdi bu fonksiyonu,birazdan olusturaca��m�z security policy(g�venlik politikas�) i�in filter predicate olarak ekliyoruz.Yani uzun laf�n k�sas� filtre olarak ayarl�yoruz.
Create Security policy GuvenlikFiltresi
add filter predicate dbo.ROWLEVELFUNCT�ON(Kullan�c�)
on dbo.Satislar
with(State=On)

--Dikkat
--Kullan�lan t�m yap�da �ema adlar�n�(.dbo) unutma
Exec as User ='Ali'
Select * from Satislar