--Like Sorgularý

--% operatörü 

--Ýsminin Baþ harfi j olan personellerin adý ve soyadýný getir.
Select Adi,SoyAdi from Personeller where Adi Like 'j%'


--Ýsminin Son harfi y olan personellerin adý ve soyadýný getir.
Select Adi,SoyAdi from Personeller where Adi Like '%y'


--Ýsminin son 3 harfi ert olan personeli/personelleri getir.
Select Adi,SoyAdi from Personeller where Adi Like '%ert'



--Ýsminin Ýlk harfi r son harfi t olan personelleri getir.
Select * from Personeller where Adi like 'r%t' 


--Ýsminde an geçen personelin adýný yazdýr
Select * from Personeller where Adi like '%an%'


--Ýsminin Baþý n ile baþlayan ve içerisinde an geçen personeli getir.
Select * from Personeller where Adi Like 'n%an%'