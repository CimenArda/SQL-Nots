--Having komutu
--Aggregete fonksiyonlar� �zerinde bir �art yazmak istiyorsan where de�il having  kullanmal�s�n.
Select KategoriID,Count(*) from Urunler where KategoriID > 5 group by KategoriID Having Count(*)>6 