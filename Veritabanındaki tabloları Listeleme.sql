--Veritabanýndaki tablolarý Listeleme
--Ýçerisinde bulundugunuz veri tabanýnýn tablolarýný listeler.
Select * from sys.tables


--Bir tablonun Primary key olup olmadýgýný kontrol etme
--o dönüyorsa yoktur 1 dönüyorsa vardýr.
Select OBJECTPROPERTY(OBJECT_ID('OrnekPersoneller2'),'TableHasPrimaryKey')
