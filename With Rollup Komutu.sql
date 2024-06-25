
--With Rollup Komutu
--Group by ile gruplanmýþ veri kümesinde ***ara toplam*** alýnmasýný saðlar.

Select SatisID,UrunID,Sum(Miktar) from [Satis Detaylari]
group by SatisID,UrunID with rollup


Select KategoriID,UrunID, Sum(TedarikciID) from Urunler
Group by KategoriID,UrunID with rollup

--Having þartýyla beraber with rollup
Select SatisID,UrunID,Sum(Miktar) from [Satis Detaylari]
Group by SatisID,UrunID
With Rollup having Sum(Miktar)>50