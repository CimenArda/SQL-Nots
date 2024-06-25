--DDL 

/* 
DDL(Data Definition Language)
Veritabaný nesneneleri oluþturmamýzý saðlayan ve bu nesneler üzerinde deðiþiklikler yapmamýzý ve silmemizi
saðlayan yapýlar bu baþlýk altýnda simgelenmektedir.
Create,Alter,Drop

****Create****
Veritabaný nesnesi yaratmamýzý saðlar.(database,table,view,storeproc,trigger,vs)
Prototipi
Create [Nesne] [Nesnenin Adý]
*/

--Create ile database oluþturma 
Create Database OrnekVeriTabani
--Bu þekilde bir kullaným varsayýlan ayarlarda veritabaný oluþturacaktýr.


Create Database OrnekVeriTabani
On
(
Name = 'GG',
FileName = 'C:\arda1',
Size = 5,
)

--Name = Oluþturulacak veritabanýnýn fiziksel ismini belirtmiþ oluyoruz.
--FileName =Oluþturulacak veritabaýnnýn dosyasýnýn fiziksel dizinini belirtiyoruz.
--Size =Veritabanýnýn baþlangýç boyutunu mb cinsinden ayarlýyoruz.
--Filegrowth = Veritabanýnýn boyutu ibaþlangýç boyutunu geçtiði durumda boyutun ne kadar artmasý gerektiðini mb cinsinden belirtiyoruz.




--Create Komutu Ýle Database Log Dosyasý Oluþturma
CREATE DATABASE veritabani_adi
ON 
(
    NAME = veri_dosyasi_mantik_adi,
    FILENAME = 'veri_dosyasi_yolu',
    SIZE = baslangic_boyutu,
    MAXSIZE = maksimum_boyut,
    FILEGROWTH = buyume_artisi
)
LOG ON
(
    NAME = log_dosyasi_mantik_adi,
    FILENAME = 'log_dosyasi_yolu',
    SIZE = baslangic_log_boyutu,
    MAXSIZE = maksimum_log_boyutu,
    FILEGROWTH = log_buyume_artisi
);
--veritabani_adi: Oluþturulacak veritabanýnýn adý.
--veri_dosyasi_mantik_adi: Veri dosyasýnýn mantýksal adý.
--veri_dosyasi_yolu: Veri dosyasýnýn tam dosya yolu.
--baslangic_boyutu: Veri dosyasýnýn baþlangýç boyutu.
--maksimum_boyut: Veri dosyasýnýn maksimum boyutu.
--buyume_artisi: Veri dosyasýnýn büyüme oraný.
--log_dosyasi_mantik_adi: Log dosyasýnýn mantýksal adý.
--log_dosyasi_yolu: Log dosyasýnýn tam dosya yolu.
--baslangic_log_boyutu: Log dosyasýnýn baþlangýç boyutu.
--maksimum_log_boyutu: Log dosyasýnýn maksimum boyutu.
--log_buyume_artisi: Log dosyasýnýn büyüme oraný.



--Create Ýle Tablo Oluþturma
Create Table OrnekTablo
(
Kolon1 int,
Kolon2 nvarchar(Max)
)

--Eðer kolon adlarýnda boþluk varsa köþeli parantez ile belirtilmelidir.
Create Table OrnekTablo2
(
	[Kolon 1] int,
	[Kolon  2] nvarchar(Max)
)



--Kolona primary key ve Identity özelliði kazandýrmak 
Create table Ornektablo3 
(
	Id int Primary key Identity(1,1),
	[Kolon 2] nvarchar(Max)
)



--- ****ALTER ****

--Create ile yaratýlan veritabaný nesnelerinde deðiþiklik yapmamýzý saðlar.

--Alter ile Database Güncelleme

--Prototip 
--Alter [Nesne] [Nesnenin Adý]
--(Yapýya göre iþlemler)


--Alter ile Database Güncelleme
ALter Database OrnekVeriTababi
Modify File 
(
	Name = 'GG',
	Size =20
)
/* 
Bu komut, 'OrnekVeritabani' veritabanýndaki 'GG' adlý dosyanýn boyutunu 20 MB olarak ayarlayacaktýr.
*/


--Alter ile Olan Bir Tabloya Kolon Ekleme 
Alter Table OrnekTablo
Add Kolon4 nvarchar(Max)

--Alter ile tablodaki kolonu Güncelleme
Alter Table OrnekTablo
Alter Column Kolon4 int 

--Alter ile Tablodaki Kolonu SÝlme
Alter Table OrnekTablo
Drop Column Kolon4



-- Kýsaca constraint nedir bahsedelim uzunca ilerleyen konularda anlatýlacak.
/*
Constraint (kýsýtlama) ifadeleri, 
veritabaný tablolarýnda veri bütünlüðünü ve doðruluðunu saðlamak için kullanýlýr. 
Kýsýtlamalar, belirli kurallarý zorunlu kýlarak veritabanýnda tutarsýz veya hatalý verilerin depolanmasýný önler.

Bazý Yaygýn Kýsýtlamalar
PRIMARY KEY:
FOREIGN KEY:
UNIQUE:
CHECK:
DEFAULT:
NOT NULL:
Detaylarýna girilecek.
*/

--Alter Ýle Tablya Constraint Ekleme
Alter Table OrnekTablo
Add Constraint OrnekConstraint Default 'Boþ' for Kolon2 
/* 
bu komutla "OrnekTablo" adlý tabloya "OrnekConstraint" adlý bir kýsýtlama eklenir 
ve
"Kolon2" sütununun varsayýlan deðeri 'Boþ' olarak ayarlanýr.
Bu, yeni eklenen kayýtlar sýrasýnda "Kolon2" sütununa bir deðer girilmezse,
bu sütunun otomatik olarak 'Boþ' deðeri almasýný saðlar.
*/


--Alter Ýle Tablodaki Constrainti Silme
ALter Table OrnekTablo
Drop Constraint OrnekConstraint 



--Sp_Rename Komutu Ýle Tablo Adýný Deðiþtirme

SP_RENAME 'OrnekTablo','OrnekTabloYeni'
--bu komutla "OrnekTablo" adlý tablonun adý "OrnekTabloYeni" olarak deðiþtirilir. 


--Sp_Rename ile kolon Güncelleme
SP_RENAME 'OrnekTablo.kolon1' ,'Kolon1453', 'Column'
--bu komutla "OrnekTablo" adlý tablodaki "kolon1" sütununun adý "Kolon1453" olarak deðiþtirilir.



--Drop Komutu

--Create Ýle Oluþturulan veritabaný nesnelerini silmemize yarar.

--Prototip
--Drop [Nesne] [Nesne Adý]


Drop Table OrnekTabloYeni --Tablo Siler
Drop Database OrnekVeritabani --Veritabaný Siler 


