 --Alias Atama

 Select 3 as deger

 Select 'Arda' Ad�,'Y�ld�z' Soyad�

 Select Adi �simler ,SoyAdi Soyadlar from Personeller

/*
SQL'de alias atama, bir s�tuna***** veya tabloya******* ge�ici bir ad vermek i�in kullan�l�r. Bu, sorgunun okunabilirli�ini art�r�r ve sonu� setini daha anla��l�r hale getirir.
Alias atama i�lemi AS anahtar kelimesi ile yap�l�r.
*/

Select 1453 �stanbulun Fethi 
/*
Bu sorgu, genellikle bir hata verir ��nk� 
s�tun adlar�nda bo�luk karakteri do�rudan kullan�lmaz.
*/
Select 1453 [�stanbulun Fethi]

/*
Bu sorgu, 1453 sabit de�erini d�nd�r�r ve bu de�ere �stanbulun Fethi ad�n� verir.
Kare parantezler ([]) kullan�larak alias ad�nda bo�luk karakteri kullan�lmas�na izin verilmi�tir. 
Bu sorgu ge�erlidir ve �al���r.*/



Select * from Satis Detaylari 
/* 
Bu sorgu genellikle hata verir. 
��nk� SQL'de tablo adlar� veya s�tun adlar� bo�luk i�eriyorsa, do�rudan kullan�lmaz. 
*/
Select * from [Satis Detaylari]
/* 
Bu sorgu ge�erlidir.
Kare parantezler ([]) kullan�larak tablo ad� bo�luk karakteri i�erecek �ekilde belirtilmi�tir.
*/

