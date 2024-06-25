--Null De�er Kontrol�


--Case-When-Then-Else-End Kal�b� �le Null Kontrol�
Select MusteriAdi,
Case
When Bolge Is Null Then 'B�lge Bilinmiyor'
Else
Bolge
End 
From Musteriler

--Coalesce Fonksiyonu ile Null Kontrol�
Select MusteriAdi,Coalesce(Bolge,'B�lge Bilinmiyor') From Musteriler


-- IsNull Fonksiyonu ile Null Kontrol�
Select MusteriAdi,IsNull(Bolge,'B�lge Bilinmiyor') From Musteriler


--NullIf Fonksiyonu ile Null Kontrol�
/*
NULLIF fonksiyonu,
SQL'de iki de�eri kar��la�t�rmak ve bu de�erler e�itse null d�nd�rmek i�in kullan�l�r. 
E�er de�erler e�it de�ilse, NULLIF ilk de�eri d�nd�r�r. 
Bu fonksiyon, �zellikle belirli bir de�eri null olarak de�erlendirmek istedi�inizde faydal�d�r.
*/
--Fonksiyona verilen kolon,�kinci parametre verilen de�ere e�it ise 
--O kolonu null olarak getirir.

Select NullIf(0,0)
