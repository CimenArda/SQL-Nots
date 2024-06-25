
--Union Komutu
/* 
iki veya daha fazla SELECT ifadesinin sonuçlarýný birleþtirir.
UNION komutu, tekrarlayan satýrlarý kaldýrýr ve sadece benzersiz satýrlarý döndürür
*/
Select Adi,SoyAdi from Personeller

Select MusteriAdi,MusteriUnvani from Musteriler

Select Adi,SoyAdi from Personeller
Union
Select MusteriAdi,MusteriUnvani from Musteriler

--2den fazla
Select Adi,SoyAdi from Personeller
Union
Select MusteriAdi,MusteriUnvani from Musteriler
Union
Select SevkAdi,SevkAdresi from Satislar


/*Joinler yan yana Union alt alta tablolarý birleþtirir.
Joinlerde belirli(iliþkisel) bir kolon üzerinde birleþtirme yapýlýrken,
Unionda böyle bir durum yoktur.*/

--Dikkat edilmesi Gerekenler

/*
Union sorgusunun sonucunda oluþan tablonun kolon isimleri,üstteki sorgunun kolon isimlerinden oluþturulur.
Üstteki sorgudan kaç kolon çekilmiþse alttaki sorgudan da o kadar çekilmek zorundadýr.
Üstteki sorgudan çekilen kolonlarýn tipleriyle,alttaki sorgudan çekilen kolonlarýn tipleri uyumlu olmalýdýr.
Union tekrarlý kayýtlarý getirmez.
*/
Select Adi,SoyAdi, 'Personel' from Personeller
Union 
Select MusteriAdi,MusteriUnvani,'Müþteri' from Musteriler

--Union All
--Union Tekrarlý kayýtlarý geitrmez.Tekrarlý kayýtlarý da getirmek için Union all komutu kullanýlmaldýýr.

Select Adi,SoyAdi from Personeller
Union All
Select MusteriAdi,MusteriUnvani from Musteriler
