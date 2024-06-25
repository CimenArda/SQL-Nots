 --Alias Atama

 Select 3 as deger

 Select 'Arda' Adý,'Yýldýz' Soyadý

 Select Adi Ýsimler ,SoyAdi Soyadlar from Personeller

/*
SQL'de alias atama, bir sütuna***** veya tabloya******* geçici bir ad vermek için kullanýlýr. Bu, sorgunun okunabilirliðini artýrýr ve sonuç setini daha anlaþýlýr hale getirir.
Alias atama iþlemi AS anahtar kelimesi ile yapýlýr.
*/

Select 1453 Ýstanbulun Fethi 
/*
Bu sorgu, genellikle bir hata verir çünkü 
sütun adlarýnda boþluk karakteri doðrudan kullanýlmaz.
*/
Select 1453 [Ýstanbulun Fethi]

/*
Bu sorgu, 1453 sabit deðerini döndürür ve bu deðere Ýstanbulun Fethi adýný verir.
Kare parantezler ([]) kullanýlarak alias adýnda boþluk karakteri kullanýlmasýna izin verilmiþtir. 
Bu sorgu geçerlidir ve çalýþýr.*/



Select * from Satis Detaylari 
/* 
Bu sorgu genellikle hata verir. 
Çünkü SQL'de tablo adlarý veya sütun adlarý boþluk içeriyorsa, doðrudan kullanýlmaz. 
*/
Select * from [Satis Detaylari]
/* 
Bu sorgu geçerlidir.
Kare parantezler ([]) kullanýlarak tablo adý boþluk karakteri içerecek þekilde belirtilmiþtir.
*/

