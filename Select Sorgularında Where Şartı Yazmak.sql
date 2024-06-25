--Select Sorgularýnda Where Þartý Yazmak 

/* 
SQL'de WHERE komutu, sorgulanan veriler üzerinde koþul belirlemek için kullanýlýr. 
Bu komut, belirli bir koþulu karþýlayan satýrlarý seçmek için kullanýlýr
ve sorgunun sonucunu filtrelemeye yarar.

*/

--Personeller tablosunda þehri london olanlarý listelemiþ oluyoruz.
Select * from Personeller where Sehir='London' 


--Personeller tablosunda baðlý çalýþtýðý kiþi sayýsý 5 den az olanlarý listeleyelim
Select * from Personeller Where BagliCalistigiKisi < 5


