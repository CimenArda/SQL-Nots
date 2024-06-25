--Kolonlarý Birleþtirme

Select Adi +' ' + SoyAdi [Personel Bilgileri] from Personeller
/* 
Bu sorgu, Personeller tablosundaki Adi ve SoyAdi sütunlarýný birleþtirir ve 
birleþtirilmiþ deðeri Personel Bilgileri adýyla bir sütun olarak döndürür
*/


-- Farklý tipte Kolonlarý Birleþtirme



Select Adi + ' ' + IseBaslamaTarihi FROM Personeller
/* 
Bu sorgu, Adi sütununu ve IseBaslamaTarihi sütununu birleþtirmeye çalýþýr.
Ancak, IseBaslamaTarihi sütunu muhtemelen bir tarih veya zaman veri tipi olduðundan, 
bu sorgu genellikle hata verir 
çünkü farklý veri tiplerini doðrudan birleþtirmek SQL standartlarýna aykýrýdýr.
*/
Select Adi + ' ' + CONVERT(nvarchar,IseBaslamaTarihi)  from Personeller
/* 
Bu sorgu, Adi sütununu ve IseBaslamaTarihi sütununu birleþtirir.
Ancak burada IseBaslamaTarihi sütunu 
CONVERT fonksiyonu kullanýlarak nvarchar (yani metin) veri tipine dönüþtürülür.
Bu þekilde, farklý veri tipleri uyumlu hale getirilir ve birleþtirme iþlemi baþarýlý olur.

*/


Select Adi + ' ' + CAST(IseBaslamaTarihi as nvarchar) from Personeller
/*
Bu sorgu, SQL'de Personeller tablosundaki Adi sütununu ve IseBaslamaTarihi sütununu birleþtirir.
CAST fonksiyonu kullanýlarak IseBaslamaTarihi sütunu nvarchar veri tipine dönüþtürülür.
Ýþlem baþarýlý.
*/


