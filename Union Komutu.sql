
--Union Komutu
/* 
iki veya daha fazla SELECT ifadesinin sonu�lar�n� birle�tirir.
UNION komutu, tekrarlayan sat�rlar� kald�r�r ve sadece benzersiz sat�rlar� d�nd�r�r
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


/*Joinler yan yana Union alt alta tablolar� birle�tirir.
Joinlerde belirli(ili�kisel) bir kolon �zerinde birle�tirme yap�l�rken,
Unionda b�yle bir durum yoktur.*/

--Dikkat edilmesi Gerekenler

/*
Union sorgusunun sonucunda olu�an tablonun kolon isimleri,�stteki sorgunun kolon isimlerinden olu�turulur.
�stteki sorgudan ka� kolon �ekilmi�se alttaki sorgudan da o kadar �ekilmek zorundad�r.
�stteki sorgudan �ekilen kolonlar�n tipleriyle,alttaki sorgudan �ekilen kolonlar�n tipleri uyumlu olmal�d�r.
Union tekrarl� kay�tlar� getirmez.
*/
Select Adi,SoyAdi, 'Personel' from Personeller
Union 
Select MusteriAdi,MusteriUnvani,'M��teri' from Musteriler

--Union All
--Union Tekrarl� kay�tlar� geitrmez.Tekrarl� kay�tlar� da getirmek i�in Union all komutu kullan�lmald��r.

Select Adi,SoyAdi from Personeller
Union All
Select MusteriAdi,MusteriUnvani from Musteriler
