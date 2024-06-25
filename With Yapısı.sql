 --With Yapýsý
 /* 
 yaygýn olarak Common Table Expression (CTE) oluþturmak için kullanýlýr.
 CTE, daha karmaþýk sorgularýn okunabilirliðini ve bakýmýný kolaylaþtýrmak amacýyla 
 geçici sonuç kümeleri oluþturmanýza olanak tanýr
 */

 With PersonelSatis(id,adi,soyadi,satisid)
 as
(
Select p.PersonelID,Adi,SoyAdi,SatisID from Personeller p 
 inner join Satislar s 
 on
 p.PersonelID=s.PersonelID
 )
 Select * from PersonelSatis
