

--Functions - Scalar Function --Inline Function 

--T-SQLDE iki tip fonksiyon vard�r .

--Scalar fonksiyonlar =Geriye istedi�imiz bir tipte de�er g�nderen fonksiyon
--Inline Function = Geriye tablo g�nderen fonksiyon

--Bu her iki fonksiyonda fiziksel olarak veritaban�nda olu�turulmaktad�r.
--Create komutu ile olu�turulmaktad�r.

--�zerinde cal�s�lan database 'in programmabiliry -->functions



--Scalar function 
-->programmabiliry -->functions --> scalar valued functions (olusturulan fonksiyona sa� t�k modify dersen kaynak kodu g�r�rs�n)

Create function Topla(@Sayi1 int ,@Sayi2 int ) Returns int 
as
	Begin 
	return @Sayi1 +@Sayi2 
	End


--Fonksiyon kullan�m�
Select dbo.Topla(2,5)
print dbo.Topla(4,66)


--�rnek Nortwhind veritaban�nda herhangi bir �r�n�n %18 KDV dAH�L OLMAK �ZERE toplam maliyetini getiren fonksiyonu yazal�m

Create Function Maliyet(@BirimFiyati int ,@StokMiktari int) Returns nvarchar(Max)
as
	Begin 
		Declare @Sonuc int =@BirimFiyati * @StokMiktari * 1.18
		return @Sonuc
	End


Select dbo.Maliyet(10,20)



--Inline Function
--Geriye bir de�er de�il,tablo g�nderen fonksiyonlard�r.
--Geriye tablo g�nderece�i i�in bu fonksiyonlar �al�st�r�l�rken sanki bir tablodan sorgu �al�st�r�l�r gibi cal�st�r�l�r.Bu y�nleriyle viewlara benzerler.View �le yap�lan i�levler Inline functionslarla yap�labilir.
--Genellikle viewla benzer i�lemlerde view kullan�lmas� �nerilir.


--Fonksiyon Tan�mlama 
--Programmability -->Functions --> table valued functions konumundan eri�ilir.

--Dikkat!!
--Inline Function olu�turulurken begin end yap�s� kullan�lmaz.

Create Function fc_Gonder(@Ad nvarchar(20),@Soyad nvarchar(20)) Returns Table 
as
	Return Select Adi,Soyadi from Personeller where Adi=@Ad and Soyadi =@Soyad

--Fonksiyon kullan�m� 
--Fonksiyonu �emayla beraber �a��rmak gereklidir.

Select * from dbo.fc_Gonder('Nancy','Davolio')






--Fonksiyonlarda With Encryption Komutu

/*
E�er ki yazm�� oldugumuz fonksiyonlar�n kodlar�na 2.3. sah�slar�n  eri�imini engellemek istiyorsak kullan�r�z.
Bu komutu yazd�ktan sonra olusturan ki�i de dahil kimse komutlar� g�remez.
Ancak fonksiyonu olu�turan sah�s komutlar�n yede�ini bulundurmas� gerekmektedir.

As keyword�nden �nce kullan�lmal�d�r.
*/

Create Function OrnekFonksiyon() Returns int 
With Encryption 
As
	Begin 
		return 3 
	End


--Fonksiyonlarla Otomatik Hesaplanabilir Kolonlar(Computed Column)
/* 
veritabanlar�nda belirli bir mant�k veya i� kural�na g�re hesaplanan ve sonu�lar� otomatik olarak elde edilen sanal kolonlard�r. Bu kolonlar, tabloda fiziksel olarak yer kaplamaz, fakat sorguland���nda di�er kolonlar�n de�erleri kullan�larak hesaplan�r

*/

--�rnek
--��kt� olarak "____ kategorisindeki ______ �r�n�n toplam fiyat� : ____'d�r." �eklinde bir ��kt� veren fonksiyonu yazal�m

Create function Rapor(@Kategori nvarchar(Max),@UrunAdi nvarchar(max),@BirimFiyati int,@Stok int) Returns nvarchar(Max)
As
	Begin
		Declare @Cikti nvarchar(MAX) =@Kategori + 'kategorisindeki' +@UrunAdi + '�r�n�n�n toplam fiyat�:' +Cast(@BirimFiyati * @Stok As nvarchar(max)) +'d�r.'
		return @Cikti
	End


Select dbo.Rapor(k.KategoriAdi,u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi) from 
Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID


