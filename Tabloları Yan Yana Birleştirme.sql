

--TABLOLARI YAN YANA B�RLE�T�RME

--iki tabloadaki veri say�s� farkl� olabilir. dolay�s�yla nas�l geliyor veriler.
--Bir yere kadar veriler birbirlerine kar��l�k gelecek o durumdan sonra null de�eri atanacakt�r 

Select * from Personeller,Satislar


--�ki tabloda da ayn� s�tun varsa ve sen bunu getirmek istiyorsan bu �ekilde yaparsan hata verir.
Select PersonelID from Personeller,Satislar

--Do�rusu ise 
Select Personeller.PersonelID,Satislar.PersonelID from Personeller,Satislar