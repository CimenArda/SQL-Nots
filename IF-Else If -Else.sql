
-- If - Else Yapýsý

--ýf yapýsý

-- = : EÞÝTSE  --> C# DA ==
-- <>: Eþit Deðilse --> C# DA !=
-- < : Küçükse
-- > :Büyükse

--Tek Satýrlýk Çalýþma

Declare @Isim nvarchar(MAX)
Set @Isim = 'Arda'

If @Isim = 'Arda'
	print 'evet'
Else
	print 'Hayýr'


--Begin End Yapýsý(Scope)
/* 
Blok Tanýmlama: Birden fazla SQL ifadesini tek bir blok içinde gruplayarak bu ifadelerin birlikte çalýþtýrýlmasýný saðlar.

*/
Declare @Sayi1 int =3
Declare @Sayi2 int =5

If @Sayi1 <@Sayi2
	Begin
		print 'Sayi1 sayi2 den küçüktür'
		Select @Sayi1 [Sayi 1],@Sayi2 [Sayi 2]
	End
Else
	Begin
		print 'Sayi 1 sayi2 den küçük deðildir.'
		Select @Sayi1 [Sayi 1],@Sayi2 [Sayi 2]
	End



--Örnek1 
--Müþteriler tablosunda Amerikalý(USA) müþteri var mý ?

--1
Select * from Musteriler where Ulke = 'USA'

If @@ROWCOUNT >0
	print 'Evet var'
	
Else 
	print 'Hayýr'




--Örnek2 
--Adý Arda soyadý Çimen olan personel var mý ?varsa evet desin yoksa kaydetsin
Select * from Personeller where Adi ='Arda' and SoyAdi ='Çimen'

If @@ROWCOUNT >0
	Print 'Var'
Else
	Begin
		print 'Hayýr yok'
		Insert Personeller(Adi,SoyAdi) values ('Arda','Çimen')
	End




--If - Else If - Else Yapýsý

Declare @Adi nvarchar(max) ='Ali'
Declare @Yas int =25

If @Adi ='Arda'
	print 'Adý Arda'
Else If @Adi ='Ali'
	print 'Adý Ali'
Else
	print 'Adý bilinmiyor'
	

--Exist Fonksiyonu
/* 
 varlýk kontrolü yapmak için etkili bir yoldur.
 Sorgu bir veya daha fazla satýr dönerse, EXISTS TRUE döner; aksi halde FALSE döner.
*/
If Exists(Select * from Personeller)
	print 'Personel var'
Else
	print 'Yok'


