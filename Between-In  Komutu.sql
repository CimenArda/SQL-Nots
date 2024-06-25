--Between Komutu

/*
BETWEEN operatörü, SQL'de belirli bir aralýk içindeki deðerleri seçmek için kullanýlýr.
Bu operatör, iki deðer arasýnda kalan tüm satýrlarý seçer. 

*/
--Where komutunda between kullanýmý

--Doðum Yýlý 1950 ile 1965 yýllarý arasýnda olan personelleri Listeleme 
Select * from Personeller Where Year(DogumTarihi) Between 1950 and 1965 



--In Komutu
/* 
IN operatörü, SQL'de belirli bir dizi deðere sahip satýrlarý seçmek için kullanýlýr.
Bu operatör, bir sütunun belirli bir dizi deðerden
herhangi birine eþit olup olmadýðýný kontrol eder.
IN operatörü,
birden fazla koþulu bir araya getirerek sorgunun okunabilirliðini artýrýr.

*/
--Where komutunda In Kullanýmý

--Yaþadýðý þehir london veya tacoma olan personelleri Listeleme
Select * from Personeller where Sehir In('London','Tacoma')
