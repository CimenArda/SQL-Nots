

 --Subquery (iç içe sorgular)

 Select s.SatisID,s.SatisTarihi from Personeller p
 inner join  Satislar s 
 on
 p.PersonelID=s.PersonelID
 where Adi='Nancy'

--Bu þekilde inner join mantýgý ile yapmayýp iç içe sorgu kullanýcaksak

Select SatisID,SatisTarihi from Satislar s 
Where PersonelID=(Select PersonelID from Personeller where Adi ='Nancy') 


-- Hatalý Sorgu
Select * from Personeller Where Adi=(Select Adi from Personeller where UnvanEki='Ms.')

