
-- If - Else Yap�s�

--�f yap�s�

-- = : E��TSE  --> C# DA ==
-- <>: E�it De�ilse --> C# DA !=
-- < : K���kse
-- > :B�y�kse

--Tek Sat�rl�k �al��ma

Declare @Isim nvarchar(MAX)
Set @Isim = 'Arda'

If @Isim = 'Arda'
	print 'evet'
Else
	print 'Hay�r'


--Begin End Yap�s�(Scope)
/* 
Blok Tan�mlama: Birden fazla SQL ifadesini tek bir blok i�inde gruplayarak bu ifadelerin birlikte �al��t�r�lmas�n� sa�lar.

*/
Declare @Sayi1 int =3
Declare @Sayi2 int =5

If @Sayi1 <@Sayi2
	Begin
		print 'Sayi1 sayi2 den k���kt�r'
		Select @Sayi1 [Sayi 1],@Sayi2 [Sayi 2]
	End
Else
	Begin
		print 'Sayi 1 sayi2 den k���k de�ildir.'
		Select @Sayi1 [Sayi 1],@Sayi2 [Sayi 2]
	End



--�rnek1 
--M��teriler tablosunda Amerikal�(USA) m��teri var m� ?

--1
Select * from Musteriler where Ulke = 'USA'

If @@ROWCOUNT >0
	print 'Evet var'
	
Else 
	print 'Hay�r'




--�rnek2 
--Ad� Arda soyad� �imen olan personel var m� ?varsa evet desin yoksa kaydetsin
Select * from Personeller where Adi ='Arda' and SoyAdi ='�imen'

If @@ROWCOUNT >0
	Print 'Var'
Else
	Begin
		print 'Hay�r yok'
		Insert Personeller(Adi,SoyAdi) values ('Arda','�imen')
	End




--If - Else If - Else Yap�s�

Declare @Adi nvarchar(max) ='Ali'
Declare @Yas int =25

If @Adi ='Arda'
	print 'Ad� Arda'
Else If @Adi ='Ali'
	print 'Ad� Ali'
Else
	print 'Ad� bilinmiyor'
	

--Exist Fonksiyonu
/* 
 varl�k kontrol� yapmak i�in etkili bir yoldur.
 Sorgu bir veya daha fazla sat�r d�nerse, EXISTS TRUE d�ner; aksi halde FALSE d�ner.
*/
If Exists(Select * from Personeller)
	print 'Personel var'
Else
	print 'Yok'


