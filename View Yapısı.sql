
--View Yapýsý

--Kullaným Amacý

--Genellikle karmaþýk sorgularýn tek bir sorgu üzerinden çalýþtýrýlabilmesidir.
--Bu amaçla raporlama iþlemlerinde kullanýlabilirler.
--Ayný zamanda güvenlik ihtiyacý oldugu durumlarda herhangi bir sorgunun 2. 3. sahýslardan gizlenmesi amacýyla da kullanýlýrlar.


--Genel Özellikleri 
--Herhangi bir sorgunun sonucunu tablo olarak ele alýp ondan sorgu çekilebilmesini saðlarlar.
--Insert update delete yapabilirler.Bu iþlemleri fiziksel tabloya yansýtýrlar.(Önemli**)
--View yapýlarý fiziksel olarak oluþturulan yapýlardýr.
--View yapýlarý normal sorgulardan daha yavaþ çalýsýrlar.

--Dikkat!!
--Database elemanlarýný Create komutuyla olusturuyorduk.View Yapýsýnda bir database yapýsý oldugu için Create komutu ile olusturucagýz.

Create View vw_Gotur 
As
Select p.Adi + ' ' +p.soyAdi [Adý-Soyadý],k.KategoriAdi [Kategori Adý],Count(s.SatisID) [Toplam Satýþ] from Personeller p
Inner Join Satislar s 
on
p.PersonelID=s.PersonelID
Inner join [Satis Detaylari] sd on s.SatisID=sd.SatisID
Inner join Urunler u on sd.UrunID=u.UrunID
Inner join Kategoriler k on k.KategoriID =u.KategoriID
Group by p.Adi + ' ' +p.soyAdi,k.KategoriAdi


Select * from vw_Gotur

Select * from vw_Gotur where [Adý-Soyadý] Like '%Robert%'

--View oluþturulurken kolonlara verile aliaslar viewdan sorgu çekilirken kullanýlýr.
--Bir yandan da viewýn kullandýgý gerçek tablolarýn kolon isimleri,view içinde alias tanýmlanarak gizlenmiþ olur.

--View içinde order by kullanýlamaz.
--Order by view içinde deðiþ ,view calýstýrýlýrken sorgu esnasýnda kullanýlmalýdýr.
Select * from vw_Gotur order by [Toplam Satýþ]



--Insert update delete yapabilirler.Bu iþlemleri fiziksel tabloya yansýtýrlar.(Önemli**)
Create view OrnekViewPersoneller 
as 
Select Adi,SoyAdi,Unvan from Personeller

Insert OrnekViewPersoneller values ('Arda','Deneme','...')


--With Encryption Komutu
/*
bir view'ý þifrelemek için WITH ENCRYPTION seçeneði kullanýlabilir. 
Bu seçenek, view'ýn tanýmýný gizlemek ve SQL Server Management Studio (SSMS) veya diðer araçlarla view tanýmýnýn görüntülenmesini engellemek için kullanýlýr. 

Eðer yazdýgýmýz viewýn kaynak kodlarýný Onject Exploerer penceresinde "Views" KATEGORÝSÝNDE sað týklayarak design modda açýp görüntülenmesini istemiyorsak "With Encryption" komutu ile Viewý oluþturmalýyýz.

Dikkat!!
With Encryption iþleminden sonra view ý olusturan kiþide dahil kimse komutlarý göremez.Geri Dönüþü yoktur.
Ancak viewý olusturan sahsýn komutlarýn yedeðini bulundurmasý gerekmektedir.
 Ya da "With Encryption" olmaksýzýn view yapýsýný yeniden alterlamalýyýz.

 Dikkat !!
 With Encripyiton ifadesi as keywordunden once yazýlmalýdýr.
*/
 Create view OrnekViewPersoneller 
With Encryption 
as
Select Adi,SoyAdi,Unvan from Personeller
--Bu iþlemden sonra design modu kapatýlmýþtýr.






--With Schemabinding Komutu
/* 
Eðer viewýn kkullandýgý esas fiziksel tablolarýn kolon isimleri bir þekilde deðiþtirilir,kolonlarý silinir, yada tablo yapýsý bir þekilded deðiþikliðe uðrar ise viewýn çalýsmasý artýk mümkün olmayacaktýr.
View ýn kullandýgý tablolar ve kolonlarý bu tarz iþlemler yapýlabilmesi ihtimaline karþý koruma altýna alýnabilir.(Bu komut ile )

With Schemabinding ile view create ya da alter edilirken viewýn kullandýgý tablo ,schema adýyla birlikte verilmelidir.
örneðin dbo(database owner) bir þema adýdýr. Þemalar c#taki namespaceler gibi düþünülebilir.


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
--View in içeriisndeki sorguda bulunan þarta uygun kayýtlarýn Insert edilmesine müsaade edilip uymayan kayýtlarýn müsaade edilmemesini saðlayan bir komuttur.

Create View OrnekView3
As
Select Adi,SoyAdi from Personeller where Adi Like 'a%'
--Adý a ile baþyana personelleri getiren view 

Insert OrnekView3 values ('Ahmet','Bilmemne') --viewa veriyi eklediðimde adý a ile baþladýgý için veri gözükür.Sýkýntý Yok.
Insert OrnekView3 values ('Beyaz','Yýldýz')--Adý a ile baþlamadýgý için hiç bir zaman view da gözükmez.O zaman anlamý ne ? eklemenin bu zamanda vith check option komutu devreye girmeli

Select * from OrnekView3

--With Check Option komutu where þartýndan sonra belirtilmelidir.
Create View OrnekView4
As
Select Adi,SoyAdi from Personeller where Adi Like 'a%'
With Check Option



