

--Functions - Scalar Function --Inline Function 

--T-SQLDE iki tip fonksiyon vardýr .

--Scalar fonksiyonlar =Geriye istediðimiz bir tipte deðer gönderen fonksiyon
--Inline Function = Geriye tablo gönderen fonksiyon

--Bu her iki fonksiyonda fiziksel olarak veritabanýnda oluþturulmaktadýr.
--Create komutu ile oluþturulmaktadýr.

--Üzerinde calýsýlan database 'in programmabiliry -->functions



--Scalar function 
-->programmabiliry -->functions --> scalar valued functions (olusturulan fonksiyona sað týk modify dersen kaynak kodu görürsün)

Create function Topla(@Sayi1 int ,@Sayi2 int ) Returns int 
as
	Begin 
	return @Sayi1 +@Sayi2 
	End


--Fonksiyon kullanýmý
Select dbo.Topla(2,5)
print dbo.Topla(4,66)


--Örnek Nortwhind veritabanýnda herhangi bir ürünün %18 KDV dAHÝL OLMAK ÜZERE toplam maliyetini getiren fonksiyonu yazalým

Create Function Maliyet(@BirimFiyati int ,@StokMiktari int) Returns nvarchar(Max)
as
	Begin 
		Declare @Sonuc int =@BirimFiyati * @StokMiktari * 1.18
		return @Sonuc
	End


Select dbo.Maliyet(10,20)



--Inline Function
--Geriye bir deðer deðil,tablo gönderen fonksiyonlardýr.
--Geriye tablo göndereceði için bu fonksiyonlar çalýstýrýlýrken sanki bir tablodan sorgu çalýstýrýlýr gibi calýstýrýlýr.Bu yönleriyle viewlara benzerler.View Ýle yapýlan iþlevler Inline functionslarla yapýlabilir.
--Genellikle viewla benzer iþlemlerde view kullanýlmasý önerilir.


--Fonksiyon Tanýmlama 
--Programmability -->Functions --> table valued functions konumundan eriþilir.

--Dikkat!!
--Inline Function oluþturulurken begin end yapýsý kullanýlmaz.

Create Function fc_Gonder(@Ad nvarchar(20),@Soyad nvarchar(20)) Returns Table 
as
	Return Select Adi,Soyadi from Personeller where Adi=@Ad and Soyadi =@Soyad

--Fonksiyon kullanýmý 
--Fonksiyonu þemayla beraber çaðýrmak gereklidir.

Select * from dbo.fc_Gonder('Nancy','Davolio')






--Fonksiyonlarda With Encryption Komutu

/*
Eðer ki yazmýþ oldugumuz fonksiyonlarýn kodlarýna 2.3. sahýslarýn  eriþimini engellemek istiyorsak kullanýrýz.
Bu komutu yazdýktan sonra olusturan kiþi de dahil kimse komutlarý göremez.
Ancak fonksiyonu oluþturan sahýs komutlarýn yedeðini bulundurmasý gerekmektedir.

As keywordünden önce kullanýlmalýdýr.
*/

Create Function OrnekFonksiyon() Returns int 
With Encryption 
As
	Begin 
		return 3 
	End


--Fonksiyonlarla Otomatik Hesaplanabilir Kolonlar(Computed Column)
/* 
veritabanlarýnda belirli bir mantýk veya iþ kuralýna göre hesaplanan ve sonuçlarý otomatik olarak elde edilen sanal kolonlardýr. Bu kolonlar, tabloda fiziksel olarak yer kaplamaz, fakat sorgulandýðýnda diðer kolonlarýn deðerleri kullanýlarak hesaplanýr

*/

--Örnek
--Çýktý olarak "____ kategorisindeki ______ ürünün toplam fiyatý : ____'dýr." þeklinde bir çýktý veren fonksiyonu yazalým

Create function Rapor(@Kategori nvarchar(Max),@UrunAdi nvarchar(max),@BirimFiyati int,@Stok int) Returns nvarchar(Max)
As
	Begin
		Declare @Cikti nvarchar(MAX) =@Kategori + 'kategorisindeki' +@UrunAdi + 'ürününün toplam fiyatý:' +Cast(@BirimFiyati * @Stok As nvarchar(max)) +'dýr.'
		return @Cikti
	End


Select dbo.Rapor(k.KategoriAdi,u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi) from 
Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID


