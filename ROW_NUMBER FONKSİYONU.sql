--ROW_NUMBER Fonksiyonu
--SQL Server'da satýrlara benzersiz sýra numaralarý atamak için kullanýlýr. Bu fonksiyon özellikle sýralama ve sayfalama iþlemlerinde kullanýþlýdýr.
--büyük veri setlerinde sayfalama iþlemi yapmak için de kullanýþlýdýr.

Select ROW_NUMBER() Over(order by Adi ) SýraNo , * from Personeller

--Partition By Komutu Ýle Gruplama
--veri setini belirli bir sütuna göre gruplara ayýrýr ve bu gruplar içinde sýralama veya numaralandýrma iþlemleri yapar.

--Prototip 
--Select Row_Number() Over(partition by Kolon1 order by kolon2) vericeðin isim,* from Tablo


Select ROW_NUMBER() OVER(partition by MusteriID order by OdemeTarihi) indexer, * from Satislar
