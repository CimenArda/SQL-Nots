--Group By 
/*  SQL veritabaný tablosundaki verileri belirli bir kriter (veya kriterler) temelinde gruplama iþlemi yapar. 
Bu iþlem sonucunda, belirli bir kriteri karþýlayan tüm veriler ayný grupta birleþtirilir*/
Select KategoriID,COUNT(*) from Urunler group by KategoriID

--Birden fazla gruplama
Select KategoriID,TedarikciID,COUNT(*) from Urunler group by KategoriID,TedarikciID

--Hangi personel kaç tane satýþ yapmýþ
Select PersonelID,Count(*) from Satislar group by PersonelID


--Hangi Personel toplam ne kadar nakliye ücreti ödedi.
Select PersonelID,Sum(NakliyeUcreti) from Satislar group by PersonelID




--Group by Ýþleminde where þartý yazmak

/*Bu sorgu, Urunler tablosundaki ürünleri KategoriID deðeri 5’ten büyük olan kategorilere göre gruplayarak
her kategoride kaç ürün olduðunu sayar1.
Yani, 5’ten büyük KategoriID deðerine sahip ürünleri gruplar ve her bir grup için ürün sayýsýný hesaplar.
Örneðin, 6, 7 ve 8 gibi KategoriID deðerlerine sahip ürünlerin sayýsýný bu sorgu ile bulabilirsiniz. */
Select KategoriID,Count(*) from Urunler where KategoriID > 5 group by KategoriID
