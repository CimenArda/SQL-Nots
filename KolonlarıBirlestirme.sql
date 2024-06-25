--Kolonlar� Birle�tirme

Select Adi +' ' + SoyAdi [Personel Bilgileri] from Personeller
/* 
Bu sorgu, Personeller tablosundaki Adi ve SoyAdi s�tunlar�n� birle�tirir ve 
birle�tirilmi� de�eri Personel Bilgileri ad�yla bir s�tun olarak d�nd�r�r
*/


-- Farkl� tipte Kolonlar� Birle�tirme



Select Adi + ' ' + IseBaslamaTarihi FROM Personeller
/* 
Bu sorgu, Adi s�tununu ve IseBaslamaTarihi s�tununu birle�tirmeye �al���r.
Ancak, IseBaslamaTarihi s�tunu muhtemelen bir tarih veya zaman veri tipi oldu�undan, 
bu sorgu genellikle hata verir 
��nk� farkl� veri tiplerini do�rudan birle�tirmek SQL standartlar�na ayk�r�d�r.
*/
Select Adi + ' ' + CONVERT(nvarchar,IseBaslamaTarihi)  from Personeller
/* 
Bu sorgu, Adi s�tununu ve IseBaslamaTarihi s�tununu birle�tirir.
Ancak burada IseBaslamaTarihi s�tunu 
CONVERT fonksiyonu kullan�larak nvarchar (yani metin) veri tipine d�n��t�r�l�r.
Bu �ekilde, farkl� veri tipleri uyumlu hale getirilir ve birle�tirme i�lemi ba�ar�l� olur.

*/


Select Adi + ' ' + CAST(IseBaslamaTarihi as nvarchar) from Personeller
/*
Bu sorgu, SQL'de Personeller tablosundaki Adi s�tununu ve IseBaslamaTarihi s�tununu birle�tirir.
CAST fonksiyonu kullan�larak IseBaslamaTarihi s�tunu nvarchar veri tipine d�n��t�r�l�r.
��lem ba�ar�l�.
*/


