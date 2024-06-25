--Deðiþkenler

--Declare keywordu ile deðiþken tanýmlanýr.

--Prototip
--Declare @DegiskenAdi DeðiskenTipi


Declare @y nvarchar

Declare @z money 

Declare @yas int = 3 

--Tanýmlanmýþ Deðiþkene Deðer atama 
Declare @x int
Set @x =125 --Ýkisini de seçip execute etmeniz lazým yoksa hata verir.

declare @tarih datetime 

Set @tarih =GetDate()


--Deðiþkenin Deðeri Okuma 
Declare @x int
Set @x =125
SELECT @x


--Sorgu Sonucu Gelen Verileri Deðiþkenle Elde Etme

declare @adi nvarchar(max) ,@soyadi nvarchar(max) 

Select @adi =Adi,@soyadi=SoyAdi from Personeller where PersonelID =1

Select @adi,@soyadi

--1. Sorgu sonucu gelen satýr sayýsý 1 adet olmalýdýr.
--2. Sorgu kolonlardaki verilerin tipleri ne ise o verileri temsil edecek deðiþkenlerin tipleri de ayný olmalýdýr.


