--DDL 

/* 
DDL(Data Definition Language)
Veritaban� nesneneleri olu�turmam�z� sa�layan ve bu nesneler �zerinde de�i�iklikler yapmam�z� ve silmemizi
sa�layan yap�lar bu ba�l�k alt�nda simgelenmektedir.
Create,Alter,Drop

****Create****
Veritaban� nesnesi yaratmam�z� sa�lar.(database,table,view,storeproc,trigger,vs)
Prototipi
Create [Nesne] [Nesnenin Ad�]
*/

--Create ile database olu�turma 
Create Database OrnekVeriTabani
--Bu �ekilde bir kullan�m varsay�lan ayarlarda veritaban� olu�turacakt�r.


Create Database OrnekVeriTabani
On
(
Name = 'GG',
FileName = 'C:\arda1',
Size = 5,
)

--Name = Olu�turulacak veritaban�n�n fiziksel ismini belirtmi� oluyoruz.
--FileName =Olu�turulacak veritaba�nn�n dosyas�n�n fiziksel dizinini belirtiyoruz.
--Size =Veritaban�n�n ba�lang�� boyutunu mb cinsinden ayarl�yoruz.
--Filegrowth = Veritaban�n�n boyutu iba�lang�� boyutunu ge�ti�i durumda boyutun ne kadar artmas� gerekti�ini mb cinsinden belirtiyoruz.




--Create Komutu �le Database Log Dosyas� Olu�turma
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
--veritabani_adi: Olu�turulacak veritaban�n�n ad�.
--veri_dosyasi_mantik_adi: Veri dosyas�n�n mant�ksal ad�.
--veri_dosyasi_yolu: Veri dosyas�n�n tam dosya yolu.
--baslangic_boyutu: Veri dosyas�n�n ba�lang�� boyutu.
--maksimum_boyut: Veri dosyas�n�n maksimum boyutu.
--buyume_artisi: Veri dosyas�n�n b�y�me oran�.
--log_dosyasi_mantik_adi: Log dosyas�n�n mant�ksal ad�.
--log_dosyasi_yolu: Log dosyas�n�n tam dosya yolu.
--baslangic_log_boyutu: Log dosyas�n�n ba�lang�� boyutu.
--maksimum_log_boyutu: Log dosyas�n�n maksimum boyutu.
--log_buyume_artisi: Log dosyas�n�n b�y�me oran�.



--Create �le Tablo Olu�turma
Create Table OrnekTablo
(
Kolon1 int,
Kolon2 nvarchar(Max)
)

--E�er kolon adlar�nda bo�luk varsa k��eli parantez ile belirtilmelidir.
Create Table OrnekTablo2
(
	[Kolon 1] int,
	[Kolon  2] nvarchar(Max)
)



--Kolona primary key ve Identity �zelli�i kazand�rmak 
Create table Ornektablo3 
(
	Id int Primary key Identity(1,1),
	[Kolon 2] nvarchar(Max)
)



--- ****ALTER ****

--Create ile yarat�lan veritaban� nesnelerinde de�i�iklik yapmam�z� sa�lar.

--Alter ile Database G�ncelleme

--Prototip 
--Alter [Nesne] [Nesnenin Ad�]
--(Yap�ya g�re i�lemler)


--Alter ile Database G�ncelleme
ALter Database OrnekVeriTababi
Modify File 
(
	Name = 'GG',
	Size =20
)
/* 
Bu komut, 'OrnekVeritabani' veritaban�ndaki 'GG' adl� dosyan�n boyutunu 20 MB olarak ayarlayacakt�r.
*/


--Alter ile Olan Bir Tabloya Kolon Ekleme 
Alter Table OrnekTablo
Add Kolon4 nvarchar(Max)

--Alter ile tablodaki kolonu G�ncelleme
Alter Table OrnekTablo
Alter Column Kolon4 int 

--Alter ile Tablodaki Kolonu S�lme
Alter Table OrnekTablo
Drop Column Kolon4



-- K�saca constraint nedir bahsedelim uzunca ilerleyen konularda anlat�lacak.
/*
Constraint (k�s�tlama) ifadeleri, 
veritaban� tablolar�nda veri b�t�nl���n� ve do�rulu�unu sa�lamak i�in kullan�l�r. 
K�s�tlamalar, belirli kurallar� zorunlu k�larak veritaban�nda tutars�z veya hatal� verilerin depolanmas�n� �nler.

Baz� Yayg�n K�s�tlamalar
PRIMARY KEY:
FOREIGN KEY:
UNIQUE:
CHECK:
DEFAULT:
NOT NULL:
Detaylar�na girilecek.
*/

--Alter �le Tablya Constraint Ekleme
Alter Table OrnekTablo
Add Constraint OrnekConstraint Default 'Bo�' for Kolon2 
/* 
bu komutla "OrnekTablo" adl� tabloya "OrnekConstraint" adl� bir k�s�tlama eklenir 
ve
"Kolon2" s�tununun varsay�lan de�eri 'Bo�' olarak ayarlan�r.
Bu, yeni eklenen kay�tlar s�ras�nda "Kolon2" s�tununa bir de�er girilmezse,
bu s�tunun otomatik olarak 'Bo�' de�eri almas�n� sa�lar.
*/


--Alter �le Tablodaki Constrainti Silme
ALter Table OrnekTablo
Drop Constraint OrnekConstraint 



--Sp_Rename Komutu �le Tablo Ad�n� De�i�tirme

SP_RENAME 'OrnekTablo','OrnekTabloYeni'
--bu komutla "OrnekTablo" adl� tablonun ad� "OrnekTabloYeni" olarak de�i�tirilir. 


--Sp_Rename ile kolon G�ncelleme
SP_RENAME 'OrnekTablo.kolon1' ,'Kolon1453', 'Column'
--bu komutla "OrnekTablo" adl� tablodaki "kolon1" s�tununun ad� "Kolon1453" olarak de�i�tirilir.



--Drop Komutu

--Create �le Olu�turulan veritaban� nesnelerini silmemize yarar.

--Prototip
--Drop [Nesne] [Nesne Ad�]


Drop Table OrnekTabloYeni --Tablo Siler
Drop Database OrnekVeritabani --Veritaban� Siler 


