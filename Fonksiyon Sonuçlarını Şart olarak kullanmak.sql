
--Fonksiyon Sonuçlarýný Þart olarak kullanmak 



--1993 yýlýnda iþe baþlayanlarý Listele
Select * from Personeller where Year(IseBaslamaTarihi) =1993


--Doðum günü ayýn 29 u olmayan personeller listeleme
Select * from Personeller where DAY(IseBaslamaTarihi) <> 29


--Doðum Yýlý 1950 ile 1965 yýllarý arasýnda olan personelleri Listeleme 
Select * from Personeller where 1950 >Year(DogumTarihi) and YEAR(DogumTarihi) < 1965


--Yaþadýðý þehir london veya tacoma olan personelleri Listeleme
Select * from Personeller where Sehir ='Tacoma' or Sehir ='London'