--Between Komutu

/*
BETWEEN operat�r�, SQL'de belirli bir aral�k i�indeki de�erleri se�mek i�in kullan�l�r.
Bu operat�r, iki de�er aras�nda kalan t�m sat�rlar� se�er. 

*/
--Where komutunda between kullan�m�

--Do�um Y�l� 1950 ile 1965 y�llar� aras�nda olan personelleri Listeleme 
Select * from Personeller Where Year(DogumTarihi) Between 1950 and 1965 



--In Komutu
/* 
IN operat�r�, SQL'de belirli bir dizi de�ere sahip sat�rlar� se�mek i�in kullan�l�r.
Bu operat�r, bir s�tunun belirli bir dizi de�erden
herhangi birine e�it olup olmad���n� kontrol eder.
IN operat�r�,
birden fazla ko�ulu bir araya getirerek sorgunun okunabilirli�ini art�r�r.

*/
--Where komutunda In Kullan�m�

--Ya�ad��� �ehir london veya tacoma olan personelleri Listeleme
Select * from Personeller where Sehir In('London','Tacoma')
