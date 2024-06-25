-- @@Identity Komutu

/* 
en son eklenen sat�r�n kimlik s�tunu (identity column) de�erini d�nd�rmek i�in kullan�l�r.
Bu, genellikle bir tabloya yeni bir sat�r ekledikten sonra
bu sat�r�n kimlik de�erini almak i�in kullan�l�r.

*/
Insert Personeller(Adi,SoyAdi) Values ('Ela','Elif')
Insert Personeller(Adi,SoyAdi) Values ('Ahmet','y�lmaz')

Select @@IDENTITY


--EKleme i�lemi yapt�ktan sonra en son ekledi�im o de�erin �dentity de�erini verdi.

