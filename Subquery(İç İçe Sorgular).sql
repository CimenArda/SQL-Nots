

 --Subquery (i� i�e sorgular)

 Select s.SatisID,s.SatisTarihi from Personeller p
 inner join  Satislar s 
 on
 p.PersonelID=s.PersonelID
 where Adi='Nancy'

--Bu �ekilde inner join mant�g� ile yapmay�p i� i�e sorgu kullan�caksak

Select SatisID,SatisTarihi from Satislar s 
Where PersonelID=(Select PersonelID from Personeller where Adi ='Nancy') 


-- Hatal� Sorgu
Select * from Personeller Where Adi=(Select Adi from Personeller where UnvanEki='Ms.')

