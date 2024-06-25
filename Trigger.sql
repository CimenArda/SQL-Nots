
--DML Trigger

--INSERTED TABLE

--Eðer bir tabloda Insert iþlemi yapýlýyorsa arka planda iþlemler ilk önce RAMde oluþturulan inserted isimli bir tablo üzerinde yapýlýr.Eðer iþlemde bir problem yoksa inserted tablosundaki veriler fiziksel tabloya insert edilir.Ýþlem bittiðinde RAMde oluþturulan bu inserted tablosu silinir.


--DELETED TABLE
--Eðer bir tabloda delete iþlemi yapýlýyors arka planda iþlemler ilk önce ramde oluþturulan deleted isimli bir tablo üzerinde yapýlýr.Eðer iþlemlerde bir problem yoksa deleted tablosundaki veriler fiziksel tablodan silinir.Ýþlem bittiðinde Ramden bu deleted tablosuda silinecektir.

--Eðer bir tabloda update iþlemi yapýlýyorsa Ramde updated isimli bir tablo OLUÞTURULAMAZ!!.

--SQL Server da ki update mantýgý önce silme(delete),sonra eklemedir.(insert)

--Eðer bir tabloda update iþlemi yapýlýyorsa arka planda RAMde hem deleted hem de inserted tablolarý olusturulur.Ýþlemler bunlar üzerinde yapýlýr.

--Not:Update yaparken güncellenen kaydýn orjinali deleted tablosunda,güncellendikten sonraki hali ise inserted tablosunda bulunmaktadýr.Çünkü güncelleme demek kaydý önce silmek sonra eklemek demektir.



--Trigger TANIMLAMA
--Create Trigger [Trigger Adý]
--on 
--after --veya for delete update insert
--as
--Kodlar


--Dikkat!!
--Tanýmlanan triggerlarla ilgili tablonun içerisindeki triggers sekmesi altýndan eriþilebilir.


Create Trigger OrnekTrigger
on Personeller
after insert 
as
Select * from Personeller

Insert Personeller(Adi,SoyAdi) values ('Arda','Çimen')


--Örnek 1 
--Tedarikciler tablosunda bir veri silindiðinde tüm ürünlerin fiyatý otomatik olarak 10 artsýn 

Create Trigger triggerTedarikciler
on Tedarikciler
after delete 
as
Update Urunler set BirimFiyati =BirimFiyati +10

Delete from Tedarikciler where TedarikciID=30

Select * from Urunler



--Örnek 2
--Tedarikciler tablosunda bir veri güncellendiðinde,kategoriler tablosunda "meyve kokteyli" adýnda bir kategori oluþsun:))))))))))


Create trigger triggerTedarikcilermeyve
on Tedarikciler
after update 
as
Insert Kategoriler(KategoriAdi) values ('Meyve Kokteyli')


--Örnek 3
--Personeller tablosundan bir kayýt silindiðinde kaydýn adý soyadý kim tarafýndan ve hangi tarihte silindiði baþka bir tabloya kayýt edilsin.Bir nevi log tablosu gibi..

Create table logTablosu
(

	Id int primary key identity(1,1),
	Rapor nvarchar(Max)
)

Create trigger TriggerPersoneller
on Personeller
after delete 
as
Declare @Adi nvarchar(max),@SoyAdi nvarchar(max)
Select @Adi=Adi,@SoyAdi=SoyAdi from deleted 
Insert LogTablosu values ('Adý ve Soyadý'+@Adi+ ' ' +@SoyAdi + 'Olan Personel' +SUSER_SNAME() + 'TARAFIDAN' +CAST(GetDate()as nvarchar(max)) + 'tarihinde silinmiþtir')

Delete from Personeller where PersonelID=16


--Multiple Actions Trigger
-- bir veritabanýnda belirli bir olay gerçekleþtiðinde birden fazla iþlemi ayný anda tetiklemek için kullanýlan bir yöntemdir. 

Create Trigger MultiTrigger
on Personeller
after delete,insert 
as
print ('Merhaba')

Insert Personeller(Adi,SoyAdi) values ('arda','cimen55')
Delete from Personeller where PersonelID =16



--Instead Of Triggerlar
--Þuana kadar ýnsert update ve delete iþlemleri yapýlýrken þu þu iþlemleri yap mantýgýyla calýstýk 

--bu triggerlar ise ýnsert update ve delete iþlemleri yerine** þu þu iþlemleri yap mantýgýyla çalýstýrmaktadýrlar(yerine þunu yap)

--Prototip
--Create trigger trigggeradi
--on tabloadý
--Instead of delete ýnsert update 
--as
--komutlar

--Örnek 5 
--Personeller tablosunda update gerçekleþtiði anda yapýlacak günclleþtirme yerine bir log tablosunda "Adý ... olan personel ... yeni adýyla deðiþtirilerek ... kullanýcý tarafýndan ..... tarihinde güncellenmek istendi" kalýbýyla rapor yazan triggeri yazalým


Create trigger trgRaporInsteadPersoneller
on Personeller
Instead of Update 
as
Declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
Select @EskiAdi =Adi from deleted
Select @YeniAdi =Adi from inserted

Insert logTablosu values ('Adý' +@EskiAdi + 'olan personel' +@YeniAdi + 'yeni adýyla deðiþtirilerek' +SUSER_SNAME() + 'kullanýcýsý tarafýndan' + CAST(GETDATE() as nvarchar(max)) + 'tarihinde deðiþtirilmek istendi.')


Update Personeller set Adi ='Arda' where PersonelID = 9



--Örnek 6
--Personeller tablosunda adý 'andrew' olan kaydýn silinmesini engelleyen ama diðerlerine izin veren triggerý yazalým
Create trigger AndrewTrigger
on Personeller
after delete 
as
Declare @Adi nvarchar(max)
Select @Adi =Adi from deleted
If @Adi ='Andrew'
	Begin
		print('Bu kayýt silinemez')
		rollback --Yapýlan tüm iþlemleri geri alýr.Transaction konsuunda detaylý iþlenecek
	End



--Dml Triggerler

--Create alter ve drop iþlemleri sonucunda veya sürecinde devreye giricek olan yapýlardýr.

Create trigger DDLTrigger
on Database
For drop_table,alter_Table,create_function,create_procedure--vs.vs
as
print ('bu iþlemler gerçekleþtirilemez')
Rollback



--Trigger Disable --Enable

--Disable --devre dýþý býrakma
Disable Trigger OrnekTrigger on Personeller

--Enable --aktifleþtirme
Enable trigger OrnekTrigger on Personeller