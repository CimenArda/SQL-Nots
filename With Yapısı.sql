 --With Yap�s�
 /* 
 yayg�n olarak Common Table Expression (CTE) olu�turmak i�in kullan�l�r.
 CTE, daha karma��k sorgular�n okunabilirli�ini ve bak�m�n� kolayla�t�rmak amac�yla 
 ge�ici sonu� k�meleri olu�turman�za olanak tan�r
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
