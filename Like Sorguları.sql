--Like Sorgular�

--% operat�r� 

--�sminin Ba� harfi j olan personellerin ad� ve soyad�n� getir.
Select Adi,SoyAdi from Personeller where Adi Like 'j%'


--�sminin Son harfi y olan personellerin ad� ve soyad�n� getir.
Select Adi,SoyAdi from Personeller where Adi Like '%y'


--�sminin son 3 harfi ert olan personeli/personelleri getir.
Select Adi,SoyAdi from Personeller where Adi Like '%ert'



--�sminin �lk harfi r son harfi t olan personelleri getir.
Select * from Personeller where Adi like 'r%t' 


--�sminde an ge�en personelin ad�n� yazd�r
Select * from Personeller where Adi like '%an%'


--�sminin Ba�� n ile ba�layan ve i�erisinde an ge�en personeli getir.
Select * from Personeller where Adi Like 'n%an%'