--De�i�kenler

--Declare keywordu ile de�i�ken tan�mlan�r.

--Prototip
--Declare @DegiskenAdi De�iskenTipi


Declare @y nvarchar

Declare @z money 

Declare @yas int = 3 

--Tan�mlanm�� De�i�kene De�er atama 
Declare @x int
Set @x =125 --�kisini de se�ip execute etmeniz laz�m yoksa hata verir.

declare @tarih datetime 

Set @tarih =GetDate()


--De�i�kenin De�eri Okuma 
Declare @x int
Set @x =125
SELECT @x


--Sorgu Sonucu Gelen Verileri De�i�kenle Elde Etme

declare @adi nvarchar(max) ,@soyadi nvarchar(max) 

Select @adi =Adi,@soyadi=SoyAdi from Personeller where PersonelID =1

Select @adi,@soyadi

--1. Sorgu sonucu gelen sat�r say�s� 1 adet olmal�d�r.
--2. Sorgu kolonlardaki verilerin tipleri ne ise o verileri temsil edecek de�i�kenlerin tipleri de ayn� olmal�d�r.


