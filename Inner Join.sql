--INNER JOIN 
--Genel Mant�k

--Select * from Tablo1 Inner Join Tablo2 on Tablo1.Il�skiliKolon =Tablo2.Il�sk�l�Kolon

--Tablolara alias tan�mlanabilir.

--Select * from Tablo1 t1 Inner Join Tablo2 t2 on t1.Il�skilikolon =t2.Il�sk�l�Kolon


--�ki tabloyu �li�kisel Birle�tirme

--Hangi personel hangi sat��lar� yapm��t�r (Personeller,Satislar)
Select * from Personeller p Inner join Satislar s on p.PersonelID =s.PersonelID

--Hangi �r�n hangi kategoride (Urunler,Kategoriler)
Select u.UrunAdi,k.KategoriAdi from Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID








--Where komutunun Kullan�m�

--Beverages kategorisindeki �r�nlerim(Urunler,kategoriler)
Select u.UrunAdi from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Beverages'

--Beverages kategorisindeki �r�nlerimin say�s� ka�t�r ? (Urunler,Kategoriler)
Select Count(u.UrunAdi) from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Beverages'

--Seafood kategorisindeki �r�nlerin listesi (Urunler,Kategoriler)
Select u.UrunAdi from Kategoriler k 
Inner join Urunler u 
on
k.KategoriID =u.KategoriID
Where K.KategoriAdi='Seafood'

--Hangi sat��� hangi �al��an yapm�� ?(Satislar,Personeller)
Select s.SatisID ,p.Adi + ' ' +p.SoyAdi from Satislar s 
Inner join Personeller p
on
s.PersonelID =p.PersonelID












--Inner jo�nde �kiden fazla Tabloyu Birle�tirme

/* 
1997 y�l�ndan sonra Nancy nin sat�� yapt�g� firmalar�n isimleri(1997 dahil)
(M�steriler,Satislar,Personeller)
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
Limited olan tedarik�ilerden al�nm�� seafood kategorisindeki �r�nlerimin
toplam sat�� tutar�(Urunler,Kategoriler,Tedarik�iler)
*/
Select Sum(u.HedefStokDuzeyi * u.BirimFiyati) from Urunler u
Inner Join Tedarikciler t
on
u.TedarikciID =t.TedarikciID
Inner join  Kategoriler k 
on
u.KategoriID =k.KategoriID
where t.SirketAdi Like'%Ltd.%' and k.KategoriAdi ='Seafood'

















--Ayn� Tabloyu �li�kisel Olarak Birle�tirme
--Personellerimin ba�l� olarak �al��t��� ki�ileri listele?
--(ayn� tablo �zerinde ba�l� oldugu ki�iler)
--(Personeller,Personeller)
Select p1.Adi ,p2.Adi from Personeller p1 
Inner join Personeller p2
on p1.BagliCalistigiKisi =p2.PersonelID

















--Inner Join'de Group By ��lemi
/*
Hangi personelin(ad� ve soyadi ile birlikte), toplam ka� adetlik sat�� yapm��
Sat�� adedi 100 den fazla olanlar ve personelin ad�n�n ba� harfi M olan kay�tlar gelsin
(Personeller,Satislar)
*/

Select p.Adi + ' ' +p.SoyAdi , Count(s.SatisID) from Personeller p
Inner join Satislar s 
on 
p.PersonelID =s.PersonelID 
where p.Adi Like 'm%'
Group by p.Adi + ' ' +p.SoyAdi having Count(s.SatisID) >100


--Seafood kategorisindeki �r�nlerin say�s� (Urunler,Kategoriler)
Select k.KategoriAdi,Count(*) from Urunler u 
Inner join Kategoriler k 
on 
u.KategoriID =k.KategoriID
where k.KategoriAdi = 'Seafood'
Group by k.KategoriAdi

--En �ok sat�� yapan Personel(Personel,Satislar)
Select top 1 p.Adi,Count(s.SatisID) from Personeller p
Inner join Satislar s
on 
p.PersonelID =s.PersonelID
group by p.Adi
order by Count(s.SatisID) desc


--Outer Join (Left,Right,Full) ile tablolar� birle�tirme 

--konusu wordde anlat�l�yor


