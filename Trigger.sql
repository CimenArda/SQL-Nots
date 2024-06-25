
--DML Trigger

--INSERTED TABLE

--E�er bir tabloda Insert i�lemi yap�l�yorsa arka planda i�lemler ilk �nce RAMde olu�turulan inserted isimli bir tablo �zerinde yap�l�r.E�er i�lemde bir problem yoksa inserted tablosundaki veriler fiziksel tabloya insert edilir.��lem bitti�inde RAMde olu�turulan bu inserted tablosu silinir.


--DELETED TABLE
--E�er bir tabloda delete i�lemi yap�l�yors arka planda i�lemler ilk �nce ramde olu�turulan deleted isimli bir tablo �zerinde yap�l�r.E�er i�lemlerde bir problem yoksa deleted tablosundaki veriler fiziksel tablodan silinir.��lem bitti�inde Ramden bu deleted tablosuda silinecektir.

--E�er bir tabloda update i�lemi yap�l�yorsa Ramde updated isimli bir tablo OLU�TURULAMAZ!!.

--SQL Server da ki update mant�g� �nce silme(delete),sonra eklemedir.(insert)

--E�er bir tabloda update i�lemi yap�l�yorsa arka planda RAMde hem deleted hem de inserted tablolar� olusturulur.��lemler bunlar �zerinde yap�l�r.

--Not:Update yaparken g�ncellenen kayd�n orjinali deleted tablosunda,g�ncellendikten sonraki hali ise inserted tablosunda bulunmaktad�r.��nk� g�ncelleme demek kayd� �nce silmek sonra eklemek demektir.



--Trigger TANIMLAMA
--Create Trigger [Trigger Ad�]
--on 
--after --veya for delete update insert
--as
--Kodlar


--Dikkat!!
--Tan�mlanan triggerlarla ilgili tablonun i�erisindeki triggers sekmesi alt�ndan eri�ilebilir.


Create Trigger OrnekTrigger
on Personeller
after insert 
as
Select * from Personeller

Insert Personeller(Adi,SoyAdi) values ('Arda','�imen')


--�rnek 1 
--Tedarikciler tablosunda bir veri silindi�inde t�m �r�nlerin fiyat� otomatik olarak 10 arts�n 

Create Trigger triggerTedarikciler
on Tedarikciler
after delete 
as
Update Urunler set BirimFiyati =BirimFiyati +10

Delete from Tedarikciler where TedarikciID=30

Select * from Urunler



--�rnek 2
--Tedarikciler tablosunda bir veri g�ncellendi�inde,kategoriler tablosunda "meyve kokteyli" ad�nda bir kategori olu�sun:))))))))))


Create trigger triggerTedarikcilermeyve
on Tedarikciler
after update 
as
Insert Kategoriler(KategoriAdi) values ('Meyve Kokteyli')


--�rnek 3
--Personeller tablosundan bir kay�t silindi�inde kayd�n ad� soyad� kim taraf�ndan ve hangi tarihte silindi�i ba�ka bir tabloya kay�t edilsin.Bir nevi log tablosu gibi..

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
Insert LogTablosu values ('Ad� ve Soyad�'+@Adi+ ' ' +@SoyAdi + 'Olan Personel' +SUSER_SNAME() + 'TARAFIDAN' +CAST(GetDate()as nvarchar(max)) + 'tarihinde silinmi�tir')

Delete from Personeller where PersonelID=16


--Multiple Actions Trigger
-- bir veritaban�nda belirli bir olay ger�ekle�ti�inde birden fazla i�lemi ayn� anda tetiklemek i�in kullan�lan bir y�ntemdir. 

Create Trigger MultiTrigger
on Personeller
after delete,insert 
as
print ('Merhaba')

Insert Personeller(Adi,SoyAdi) values ('arda','cimen55')
Delete from Personeller where PersonelID =16



--Instead Of Triggerlar
--�uana kadar �nsert update ve delete i�lemleri yap�l�rken �u �u i�lemleri yap mant�g�yla cal�st�k 

--bu triggerlar ise �nsert update ve delete i�lemleri yerine** �u �u i�lemleri yap mant�g�yla �al�st�rmaktad�rlar(yerine �unu yap)

--Prototip
--Create trigger trigggeradi
--on tabload�
--Instead of delete �nsert update 
--as
--komutlar

--�rnek 5 
--Personeller tablosunda update ger�ekle�ti�i anda yap�lacak g�nclle�tirme yerine bir log tablosunda "Ad� ... olan personel ... yeni ad�yla de�i�tirilerek ... kullan�c� taraf�ndan ..... tarihinde g�ncellenmek istendi" kal�b�yla rapor yazan triggeri yazal�m


Create trigger trgRaporInsteadPersoneller
on Personeller
Instead of Update 
as
Declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
Select @EskiAdi =Adi from deleted
Select @YeniAdi =Adi from inserted

Insert logTablosu values ('Ad�' +@EskiAdi + 'olan personel' +@YeniAdi + 'yeni ad�yla de�i�tirilerek' +SUSER_SNAME() + 'kullan�c�s� taraf�ndan' + CAST(GETDATE() as nvarchar(max)) + 'tarihinde de�i�tirilmek istendi.')


Update Personeller set Adi ='Arda' where PersonelID = 9



--�rnek 6
--Personeller tablosunda ad� 'andrew' olan kayd�n silinmesini engelleyen ama di�erlerine izin veren trigger� yazal�m
Create trigger AndrewTrigger
on Personeller
after delete 
as
Declare @Adi nvarchar(max)
Select @Adi =Adi from deleted
If @Adi ='Andrew'
	Begin
		print('Bu kay�t silinemez')
		rollback --Yap�lan t�m i�lemleri geri al�r.Transaction konsuunda detayl� i�lenecek
	End



--Dml Triggerler

--Create alter ve drop i�lemleri sonucunda veya s�recinde devreye giricek olan yap�lard�r.

Create trigger DDLTrigger
on Database
For drop_table,alter_Table,create_function,create_procedure--vs.vs
as
print ('bu i�lemler ger�ekle�tirilemez')
Rollback



--Trigger Disable --Enable

--Disable --devre d��� b�rakma
Disable Trigger OrnekTrigger on Personeller

--Enable --aktifle�tirme
Enable trigger OrnekTrigger on Personeller