--Veritaban�ndaki tablolar� Listeleme
--��erisinde bulundugunuz veri taban�n�n tablolar�n� listeler.
Select * from sys.tables


--Bir tablonun Primary key olup olmad�g�n� kontrol etme
--o d�n�yorsa yoktur 1 d�n�yorsa vard�r.
Select OBJECTPROPERTY(OBJECT_ID('OrnekPersoneller2'),'TableHasPrimaryKey')
