
--View Yap�s�

--Kullan�m Amac�

--Genellikle karma��k sorgular�n tek bir sorgu �zerinden �al��t�r�labilmesidir.
--Bu ama�la raporlama i�lemlerinde kullan�labilirler.
--Ayn� zamanda g�venlik ihtiyac� oldugu durumlarda herhangi bir sorgunun 2. 3. sah�slardan gizlenmesi amac�yla da kullan�l�rlar.


--Genel �zellikleri 
--Herhangi bir sorgunun sonucunu tablo olarak ele al�p ondan sorgu �ekilebilmesini sa�larlar.
--Insert update delete yapabilirler.Bu i�lemleri fiziksel tabloya yans�t�rlar.(�nemli**)
--View yap�lar� fiziksel olarak olu�turulan yap�lard�r.
--View yap�lar� normal sorgulardan daha yava� �al�s�rlar.

--Dikkat!!
--Database elemanlar�n� Create komutuyla olusturuyorduk.View Yap�s�nda bir database yap�s� oldugu i�in Create komutu ile olusturucag�z.

Create View vw_Gotur 
As
Select p.Adi + ' ' +p.soyAdi [Ad�-Soyad�],k.KategoriAdi [Kategori Ad�],Count(s.SatisID) [Toplam Sat��] from Personeller p
Inner Join Satislar s 
on
p.PersonelID=s.PersonelID
Inner join [Satis Detaylari] sd on s.SatisID=sd.SatisID
Inner join Urunler u on sd.UrunID=u.UrunID
Inner join Kategoriler k on k.KategoriID =u.KategoriID
Group by p.Adi + ' ' +p.soyAdi,k.KategoriAdi


Select * from vw_Gotur

Select * from vw_Gotur where [Ad�-Soyad�] Like '%Robert%'

--View olu�turulurken kolonlara verile aliaslar viewdan sorgu �ekilirken kullan�l�r.
--Bir yandan da view�n kulland�g� ger�ek tablolar�n kolon isimleri,view i�inde alias tan�mlanarak gizlenmi� olur.

--View i�inde order by kullan�lamaz.
--Order by view i�inde de�i� ,view cal�st�r�l�rken sorgu esnas�nda kullan�lmal�d�r.
Select * from vw_Gotur order by [Toplam Sat��]



--Insert update delete yapabilirler.Bu i�lemleri fiziksel tabloya yans�t�rlar.(�nemli**)
Create view OrnekViewPersoneller 
as 
Select Adi,SoyAdi,Unvan from Personeller

Insert OrnekViewPersoneller values ('Arda','Deneme','...')


--With Encryption Komutu
/*
bir view'� �ifrelemek i�in WITH ENCRYPTION se�ene�i kullan�labilir. 
Bu se�enek, view'�n tan�m�n� gizlemek ve SQL Server Management Studio (SSMS) veya di�er ara�larla view tan�m�n�n g�r�nt�lenmesini engellemek i�in kullan�l�r. 

E�er yazd�g�m�z view�n kaynak kodlar�n� Onject Exploerer penceresinde "Views" KATEGOR�S�NDE sa� t�klayarak design modda a��p g�r�nt�lenmesini istemiyorsak "With Encryption" komutu ile View� olu�turmal�y�z.

Dikkat!!
With Encryption i�leminden sonra view � olusturan ki�ide dahil kimse komutlar� g�remez.Geri D�n��� yoktur.
Ancak view� olusturan sahs�n komutlar�n yede�ini bulundurmas� gerekmektedir.
 Ya da "With Encryption" olmaks�z�n view yap�s�n� yeniden alterlamal�y�z.

 Dikkat !!
 With Encripyiton ifadesi as keywordunden once yaz�lmal�d�r.
*/
 Create view OrnekViewPersoneller 
With Encryption 
as
Select Adi,SoyAdi,Unvan from Personeller
--Bu i�lemden sonra design modu kapat�lm��t�r.






--With Schemabinding Komutu
/* 
E�er view�n kkulland�g� esas fiziksel tablolar�n kolon isimleri bir �ekilde de�i�tirilir,kolonlar� silinir, yada tablo yap�s� bir �ekilded de�i�ikli�e u�rar ise view�n �al�smas� art�k m�mk�n olmayacakt�r.
View �n kulland�g� tablolar ve kolonlar� bu tarz i�lemler yap�labilmesi ihtimaline kar�� koruma alt�na al�nabilir.(Bu komut ile )

With Schemabinding ile view create ya da alter edilirken view�n kulland�g� tablo ,schema ad�yla birlikte verilmelidir.
�rne�in dbo(database owner) bir �ema ad�d�r. �emalar c#taki namespaceler gibi d���n�lebilir.


*/
Create table OrnekTablo21
(
	Id int primary key identity(1,1),
	kolon1 nvarchar(max)
)

Create view DenemeView
With SchemaBinding
as
Select Id,Kolon1 from dbo.OrnekTablo21




--With Check Option Komutu
--View in i�eriisndeki sorguda bulunan �arta uygun kay�tlar�n Insert edilmesine m�saade edilip uymayan kay�tlar�n m�saade edilmemesini sa�layan bir komuttur.

Create View OrnekView3
As
Select Adi,SoyAdi from Personeller where Adi Like 'a%'
--Ad� a ile ba�yana personelleri getiren view 

Insert OrnekView3 values ('Ahmet','Bilmemne') --viewa veriyi ekledi�imde ad� a ile ba�lad�g� i�in veri g�z�k�r.S�k�nt� Yok.
Insert OrnekView3 values ('Beyaz','Y�ld�z')--Ad� a ile ba�lamad�g� i�in hi� bir zaman view da g�z�kmez.O zaman anlam� ne ? eklemenin bu zamanda vith check option komutu devreye girmeli

Select * from OrnekView3

--With Check Option komutu where �art�ndan sonra belirtilmelidir.
Create View OrnekView4
As
Select Adi,SoyAdi from Personeller where Adi Like 'a%'
With Check Option



