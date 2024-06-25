

--TABLOLARI YAN YANA BÝRLEÞTÝRME

--iki tabloadaki veri sayýsý farklý olabilir. dolayýsýyla nasýl geliyor veriler.
--Bir yere kadar veriler birbirlerine karþýlýk gelecek o durumdan sonra null deðeri atanacaktýr 

Select * from Personeller,Satislar


--Ýki tabloda da ayný sütun varsa ve sen bunu getirmek istiyorsan bu þekilde yaparsan hata verir.
Select PersonelID from Personeller,Satislar

--Doðrusu ise 
Select Personeller.PersonelID,Satislar.PersonelID from Personeller,Satislar