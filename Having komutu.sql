--Having komutu
--Aggregete fonksiyonlarý üzerinde bir þart yazmak istiyorsan where deðil having  kullanmalýsýn.
Select KategoriID,Count(*) from Urunler where KategoriID > 5 group by KategoriID Having Count(*)>6 