
--With Rollup Komutu
--Group by ile gruplanm�� veri k�mesinde ***ara toplam*** al�nmas�n� sa�lar.

Select SatisID,UrunID,Sum(Miktar) from [Satis Detaylari]
group by SatisID,UrunID with rollup


Select KategoriID,UrunID, Sum(TedarikciID) from Urunler
Group by KategoriID,UrunID with rollup

--Having �art�yla beraber with rollup
Select SatisID,UrunID,Sum(Miktar) from [Satis Detaylari]
Group by SatisID,UrunID
With Rollup having Sum(Miktar)>50