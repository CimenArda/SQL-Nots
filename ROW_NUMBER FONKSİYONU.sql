--ROW_NUMBER Fonksiyonu
--SQL Server'da sat�rlara benzersiz s�ra numaralar� atamak i�in kullan�l�r. Bu fonksiyon �zellikle s�ralama ve sayfalama i�lemlerinde kullan��l�d�r.
--b�y�k veri setlerinde sayfalama i�lemi yapmak i�in de kullan��l�d�r.

Select ROW_NUMBER() Over(order by Adi ) S�raNo , * from Personeller

--Partition By Komutu �le Gruplama
--veri setini belirli bir s�tuna g�re gruplara ay�r�r ve bu gruplar i�inde s�ralama veya numaraland�rma i�lemleri yapar.

--Prototip 
--Select Row_Number() Over(partition by Kolon1 order by kolon2) verice�in isim,* from Tablo


Select ROW_NUMBER() OVER(partition by MusteriID order by OdemeTarihi) indexer, * from Satislar
