
--Fonksiyon Sonu�lar�n� �art olarak kullanmak 



--1993 y�l�nda i�e ba�layanlar� Listele
Select * from Personeller where Year(IseBaslamaTarihi) =1993


--Do�um g�n� ay�n 29 u olmayan personeller listeleme
Select * from Personeller where DAY(IseBaslamaTarihi) <> 29


--Do�um Y�l� 1950 ile 1965 y�llar� aras�nda olan personelleri Listeleme 
Select * from Personeller where 1950 >Year(DogumTarihi) and YEAR(DogumTarihi) < 1965


--Ya�ad��� �ehir london veya tacoma olan personelleri Listeleme
Select * from Personeller where Sehir ='Tacoma' or Sehir ='London'