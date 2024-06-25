--INNER JOIN 
--Genel Mantýk

--Select * from Tablo1 Inner Join Tablo2 on Tablo1.IlýskiliKolon =Tablo2.IlýskýlýKolon

--Tablolara alias tanýmlanabilir.

--Select * from Tablo1 t1 Inner Join Tablo2 t2 on t1.Ilýskilikolon =t2.IlýskýlýKolon


--Ýki tabloyu Ýliþkisel Birleþtirme

--Hangi personel hangi satýþlarý yapmýþtýr (Personeller,Satislar)
Select * from Personeller p Inner join Satislar s on p.PersonelID =s.PersonelID

--Hangi ürün hangi kategoride (Urunler,Kategoriler)
Select u.UrunAdi,k.KategoriAdi from Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID








--Where komutunun Kullanýmý

--Beverages kategorisindeki ürünlerim(Urunler,kategoriler)
Select u.UrunAdi from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Beverages'

--Beverages kategorisindeki ürünlerimin sayýsý kaçtýr ? (Urunler,Kategoriler)
Select Count(u.UrunAdi) from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Beverages'

--Seafood kategorisindeki ürünlerin listesi (Urunler,Kategoriler)
Select u.UrunAdi from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Seafood'

--Hangi satýþý hangi çalýþan yapmýþ ?(Satislar,Personeller)
Select s.SatisID ,p.Adi + ' ' +p.SoyAdi from Satislar s 
Inner join Personeller p
on
s.PersonelID =p.PersonelID












--Inner joýnde Ýkiden fazla Tabloyu Birleþtirme

/* 
1997 yýlýndan sonra Nancy nin satýþ yaptýgý firmalarýn isimleri(1997 dahil)
(Müsteriler,Satislar,Personeller)
*/
Select * from Personeller p 
Inner join Satislar s
on
p.PersonelID=s.PersonelID
Inner Join 
Musteriler m 
on
s.MusteriID=m.MusteriID 
where p.Adi ='Nancy' and Year(s.SatisTarihi)>1997

/*
Limited olan tedarikçilerden alýnmýþ seafood kategorisindeki ürünlerimin
toplam satýþ tutarý(Urunler,Kategoriler,Tedarikçiler)
*/
Select Sum(u.HedefStokDuzeyi * u.BirimFiyati) from Urunler u
Inner Join Tedarikciler t
on
u.TedarikciID =t.TedarikciID
Inner join  Kategoriler k 
on
u.KategoriID =k.KategoriID
where t.SirketAdi Like'%Ltd.%' and k.KategoriAdi ='Seafood'

















--Ayný Tabloyu Ýliþkisel Olarak Birleþtirme
--Personellerimin baðlý olarak çalýþtýðý kiþileri listele?
--(ayný tablo üzerinde baðlý oldugu kiþiler)
--(Personeller,Personeller)
Select p1.Adi ,p2.Adi from Personeller p1 
Inner join Personeller p2
on p1.BagliCalistigiKisi =p2.PersonelID

















--Inner Join'de Group By Ýþlemi
/*
Hangi personelin(adý ve soyadi ile birlikte), toplam kaç adetlik satýþ yapmýþ
Satýþ adedi 100 den fazla olanlar ve personelin adýnýn baþ harfi M olan kayýtlar gelsin
(Personeller,Satislar)
*/

Select p.Adi + ' ' +p.SoyAdi , Count(s.SatisID) from Personeller p
Inner join Satislar s 
on 
p.PersonelID =s.PersonelID 
where p.Adi Like 'm%'
Group by p.Adi + ' ' +p.SoyAdi having Count(s.SatisID) >100


--Seafood kategorisindeki ürünlerin sayýsý (Urunler,Kategoriler)
Select k.KategoriAdi,Count(*) from Urunler u 
Inner join Kategoriler k 
on 
u.KategoriID =k.KategoriID
where k.KategoriAdi = 'Seafood'
Group by k.KategoriAdi

--En çok satýþ yapan Personel(Personel,Satislar)
Select top 1 p.Adi,Count(s.SatisID) from Personeller p
Inner join Satislar s
on 
p.PersonelID =s.PersonelID
group by p.Adi
order by Count(s.SatisID) desc


--Outer Join (Left,Right,Full) ile tablolarý birleþtirme 

--konusu wordde anlatýlýyor


