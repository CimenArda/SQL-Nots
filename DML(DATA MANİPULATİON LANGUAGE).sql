
--DML (DATA MANÝPULATÝON LANGUAGE)
--Select ,Insert ,Update, Delete 

--Selecti es geçiyoruz

--Insert [Tablo Adý] (kolonlar) Values(Deðerler)

Insert Personeller (Adi,SoyAdi) values ('Arda','Çimen')

Insert Personeller values 
('Çimen','Arda','VeriTabaný Uzmaný','YM','08.08.2008',GetDate(),'Sivas','Sivas','Anadolu','06150','Türkiye','124235436',null,null,null,null,null)


--Dikakt edilmesi gerekenler
--Into komutu ile yazýlabilir
Insert Into Personeller(Adi,SoyAdi) values ('a','b')

--Kolonun kabul ettiði veri tipine uygun ve karakter uzunluguna uygun eklemeler yapýlmalýdýr.
--Not null olan kolonlara boþ býrakalýmayacaklarýndan dolayý mutlaka deðer gönderilmelidir.
--Otomatik artan kolonlara deðer gönderilmez
--Tablodaki seçilen yahut bütün kolonlara deðer gönderileceðini belirtip gönderilmezse hata verir.

--Örnekler
Insert Musteriler (MusteriAdi,Adres) values ('Ahmet','Çorum')
Insert Musteriler (MusteriAdi,Adres) values ('Necati','Çankýrý')
Insert Musteriler (MusteriAdi,Adres) values ('Hilmican','Bursa')

--pratik kullaným
Insert Musteriler (MusteriAdi,Adres) values ('a','v'),('c','d'),('e','f')

--Ýnsert komutu ile Select sorgusu sonucu gelen verileri farklý tabloya kaydetme ***
Insert OrnekPersoneller Select Adi,SoyAdi from Personeller
/*
Burada dikkat edilmesi gereken nokta select sorgusunda dönen kolon sayýsý ile
Insert iþlemi yapýalcak tablonun kolon sayýsý birbirin eþit olmalýdýr.
*/

--Select sorgusu Sonucu gelen verilerin farklý bir tablo oluþturarak kaydetme ***
--Yeni tablo oluþturup sütunlardaki bilgileri de ekledi 
Select Adi,SoyAdi,Ulke into OrnekPersoneller2 from Personeller
--Bu yöntemle primary key ve foreign key oluþturulmaz.


--Update 
--Update [Tablo Adý] Set [Kolon Adý] =Deðer

--Adý kolonu tamamý Mehmet oldu
Update OrnekPersoneller Set Adi ='Mehmet'

--[Update Sorgusuna Where þartý yazmak]
--adý nancy olanýn adýný mehmet yap
Update OrnekPersoneller Set Adi ='Mehmet' where Adi='Nancy'



--Update sorgusunda Join yapýlarýný kullanarak birden fazla tabloda güncelleme yapmak.
Update Urunler Set UrunAdi = k.kategoriAdi from Urunler u 
Inner Join Kategoriler k
on
u.KategoriID =k.KategoriID

/*
Bu sorguda, Urunler tablosundaki UrunAdi sütunundaki deðerler,
Kategoriler tablosundaki kategoriAdi sütunundaki deðerlerle güncellenmek isteniyor.
Daha spesifik olarak,
Urunler tablosu ile Kategoriler tablosu arasýnda KategoriID sütunu üzerinden yapýlan bir iç birleþtirme 
(INNER JOIN) ile eþleþen kayýtlar bulunacak ve eþleþen bu kayýtlar için Urunler tablosundaki
UrunAdi sütunu, Kategoriler tablosundaki kategoriAdi sütununun deðeri ile güncellenecektir.
*/



--Update sorgusunda subquery ile güncelleme yapma
--Personel ýd si 3 olanýn adýný al ve urunlerdeki ürünadý ile güncelle
Update Urunler Set UrunAdi =(Select Adi from Personeller WHERE PersonelID = 3)

--Update sorgusunda top keywordü ile güncelleme yapmak 
Update Top(30) Urunler Set UrunAdi = 'x'



--Delete 
--Delete from [Tablo Adý]
Delete from Urunler

--Delete sorgusuna where þartý yazmak 
Delete from Urunler Where KategoriID<3

--Dikkat edilmesi gerekenler 
/*Delete sorgusuyla tablo içerisindeki tüm verileri silmeniz ýdentity kolonunu sýfýrlamayacaktýr.
Silme iþleminden sonra ilk eklenen veride kalýndýgý yerden id deðeri verilecektir.
*/
