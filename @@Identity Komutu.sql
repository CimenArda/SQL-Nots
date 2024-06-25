-- @@Identity Komutu

/* 
en son eklenen satýrýn kimlik sütunu (identity column) deðerini döndürmek için kullanýlýr.
Bu, genellikle bir tabloya yeni bir satýr ekledikten sonra
bu satýrýn kimlik deðerini almak için kullanýlýr.

*/
Insert Personeller(Adi,SoyAdi) Values ('Ela','Elif')
Insert Personeller(Adi,SoyAdi) Values ('Ahmet','yýlmaz')

Select @@IDENTITY


--EKleme iþlemi yaptýktan sonra en son eklediðim o deðerin ýdentity deðerini verdi.

