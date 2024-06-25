
--DML (DATA MAN�PULAT�ON LANGUAGE)
--Select ,Insert ,Update, Delete 

--Selecti es ge�iyoruz

--Insert [Tablo Ad�] (kolonlar) Values(De�erler)

Insert Personeller (Adi,SoyAdi) values ('Arda','�imen')

Insert Personeller values 
('�imen','Arda','VeriTaban� Uzman�','YM','08.08.2008',GetDate(),'Sivas','Sivas','Anadolu','06150','T�rkiye','124235436',null,null,null,null,null)


--Dikakt edilmesi gerekenler
--Into komutu ile yaz�labilir
Insert Into Personeller(Adi,SoyAdi) values ('a','b')

--Kolonun kabul etti�i veri tipine uygun ve karakter uzunluguna uygun eklemeler yap�lmal�d�r.
--Not null olan kolonlara bo� b�rakal�mayacaklar�ndan dolay� mutlaka de�er g�nderilmelidir.
--Otomatik artan kolonlara de�er g�nderilmez
--Tablodaki se�ilen yahut b�t�n kolonlara de�er g�nderilece�ini belirtip g�nderilmezse hata verir.

--�rnekler
Insert Musteriler (MusteriAdi,Adres) values ('Ahmet','�orum')
Insert Musteriler (MusteriAdi,Adres) values ('Necati','�ank�r�')
Insert Musteriler (MusteriAdi,Adres) values ('Hilmican','Bursa')

--pratik kullan�m
Insert Musteriler (MusteriAdi,Adres) values ('a','v'),('c','d'),('e','f')

--�nsert komutu ile Select sorgusu sonucu gelen verileri farkl� tabloya kaydetme ***
Insert OrnekPersoneller Select Adi,SoyAdi from Personeller
/*
Burada dikkat edilmesi gereken nokta select sorgusunda d�nen kolon say�s� ile
Insert i�lemi yap�alcak tablonun kolon say�s� birbirin e�it olmal�d�r.
*/

--Select sorgusu Sonucu gelen verilerin farkl� bir tablo olu�turarak kaydetme ***
--Yeni tablo olu�turup s�tunlardaki bilgileri de ekledi 
Select Adi,SoyAdi,Ulke into OrnekPersoneller2 from Personeller
--Bu y�ntemle primary key ve foreign key olu�turulmaz.


--Update 
--Update [Tablo Ad�] Set [Kolon Ad�] =De�er

--Ad� kolonu tamam� Mehmet oldu
Update OrnekPersoneller Set Adi ='Mehmet'

--[Update Sorgusuna Where �art� yazmak]
--ad� nancy olan�n ad�n� mehmet yap
Update OrnekPersoneller Set Adi ='Mehmet' where Adi='Nancy'



--Update sorgusunda Join yap�lar�n� kullanarak birden fazla tabloda g�ncelleme yapmak.
Update Urunler Set UrunAdi = k.kategoriAdi from Urunler u 
Inner Join Kategoriler k
on
u.KategoriID =k.KategoriID

/*
Bu sorguda, Urunler tablosundaki UrunAdi s�tunundaki de�erler,
Kategoriler tablosundaki kategoriAdi s�tunundaki de�erlerle g�ncellenmek isteniyor.
Daha spesifik olarak,
Urunler tablosu ile Kategoriler tablosu aras�nda KategoriID s�tunu �zerinden yap�lan bir i� birle�tirme 
(INNER JOIN) ile e�le�en kay�tlar bulunacak ve e�le�en bu kay�tlar i�in Urunler tablosundaki
UrunAdi s�tunu, Kategoriler tablosundaki kategoriAdi s�tununun de�eri ile g�ncellenecektir.
*/



--Update sorgusunda subquery ile g�ncelleme yapma
--Personel �d si 3 olan�n ad�n� al ve urunlerdeki �r�nad� ile g�ncelle
Update Urunler Set UrunAdi =(Select Adi from Personeller WHERE PersonelID = 3)

--Update sorgusunda top keyword� ile g�ncelleme yapmak 
Update Top(30) Urunler Set UrunAdi = 'x'



--Delete 
--Delete from [Tablo Ad�]
Delete from Urunler

--Delete sorgusuna where �art� yazmak 
Delete from Urunler Where KategoriID<3

--Dikkat edilmesi gerekenler 
/*Delete sorgusuyla tablo i�erisindeki t�m verileri silmeniz �dentity kolonunu s�f�rlamayacakt�r.
Silme i�leminden sonra ilk eklenen veride kal�nd�g� yerden id de�eri verilecektir.
*/
