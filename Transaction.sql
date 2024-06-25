--Transaction 
--Birden çok iþlemin bir arada yapýldýgý durumlarda eðer parçayý olusturan iþlemlerden herhangi birinde sorun olursa tüm iþlemi iptal ettirmeye yarar.

/*Örneðin ;kredi kartý ile alýþveriþ iþlemlerinde transaction iþlemi vardýr.
Siz marketten ürün alýrken sizin hesabýnýzdan para düþülecek,marketin hesabýna para aktarýlacaktýr.Bu iþlemde hata olmamasý gerekir ve bundan dolayý bu iþlem bir transaction blogunda gerçekleþtirilmelidir. bu esnada herhangi bir sorun olursa bütün iþlemler transaction tarafýndan iptal edilebilecektir. 
*/
--Begin Tran veya Begin Transaction : Transaction iþlemini baþlatýr.

--Commit Tran:Transaction iþlemini baþarýyla sona erdirir.Ýþlem(ler)i gerçekleþtirir.
--Rollback Tran: Transaction iþlemini iptal eder.Ýþlem(ler)i geri alýr.

--Commit tran yerine sadee commit yazýlabilir.
--Rollback Tran yerine sadece rollback yazýlabilir.

--Normalde default olarak herþey begin tran ile baþlayýp commit tran ile biter.Biz bu yapýlarý kullanmasak bile 



--Prototip 
--Begin Tran transaction Adý
--Ýþlemler

Insert Bolge Values(5,'Çorum')--Varsayýlan olarak Transaction kontrolünde bir iþlemdir.Netice olarak gene varsayýlan olarak commit tran olarak bitmektedir.


Begin Tran Kontrol
Insert Bolge Values(5,'Çorum')
Commit Tran

--Transaction'a isim vermek zorunda deðiliz.

Begin Tran 
Insert Bolge Values(5,'Çorum')
Commit Tran


--Aþaðýdaki örneði inceleyelim.
Begin Tran Kontrol 
Declare @i int
Delete from Personeller where PersonelID>20
Set @i =@@ROWCOUNT
If @i =1
Begin 
	print 'Kayýt Silindi.'
	Commit
	--yada
	--Commit Tran
End
Else
Begin
	print 'Ýþlemler geri alýndý.'
	Rollback
	--yada 
	--Rollback Tran
End
/*
Özetle, bu kod bloðu Personeller tablosunda PersonelID deðeri 20'den büyük olan kayýtlarý siler. Silinen kayýt sayýsý 1 ise iþlemler onaylanýr; aksi takdirde iþlemler geri alýnýr.

Eðer @i deðeri 1 ise (yani yalnýzca bir satýr silinmiþse):
print 'Kayýt Silindi.' komutu ile "Kayýt Silindi." mesajý yazdýrýlýr.
Commit komutu ile transaction onaylanýr ve yapýlan deðiþiklikler kalýcý hale getirilir.

Eðer @i deðeri 1 deðilse (yani birden fazla satýr silinmiþse veya hiç satýr silinmemiþse):
print 'Ýþlemler geri alýndý.' komutu ile "Ýþlemler geri alýndý." mesajý yazdýrýlýr.
Rollback komutu ile transaction geri alýnýr ve yapýlan deðiþiklikler iptal edilir.
*/

