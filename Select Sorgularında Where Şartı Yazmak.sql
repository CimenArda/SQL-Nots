--Select Sorgular�nda Where �art� Yazmak 

/* 
SQL'de WHERE komutu, sorgulanan veriler �zerinde ko�ul belirlemek i�in kullan�l�r. 
Bu komut, belirli bir ko�ulu kar��layan sat�rlar� se�mek i�in kullan�l�r
ve sorgunun sonucunu filtrelemeye yarar.

*/

--Personeller tablosunda �ehri london olanlar� listelemi� oluyoruz.
Select * from Personeller where Sehir='London' 


--Personeller tablosunda ba�l� �al��t��� ki�i say�s� 5 den az olanlar� listeleyelim
Select * from Personeller Where BagliCalistigiKisi < 5


