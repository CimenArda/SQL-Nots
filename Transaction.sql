--Transaction 
--Birden �ok i�lemin bir arada yap�ld�g� durumlarda e�er par�ay� olusturan i�lemlerden herhangi birinde sorun olursa t�m i�lemi iptal ettirmeye yarar.

/*�rne�in ;kredi kart� ile al��veri� i�lemlerinde transaction i�lemi vard�r.
Siz marketten �r�n al�rken sizin hesab�n�zdan para d���lecek,marketin hesab�na para aktar�lacakt�r.Bu i�lemde hata olmamas� gerekir ve bundan dolay� bu i�lem bir transaction blogunda ger�ekle�tirilmelidir. bu esnada herhangi bir sorun olursa b�t�n i�lemler transaction taraf�ndan iptal edilebilecektir. 
*/
--Begin Tran veya Begin Transaction : Transaction i�lemini ba�lat�r.

--Commit Tran:Transaction i�lemini ba�ar�yla sona erdirir.��lem(ler)i ger�ekle�tirir.
--Rollback Tran: Transaction i�lemini iptal eder.��lem(ler)i geri al�r.

--Commit tran yerine sadee commit yaz�labilir.
--Rollback Tran yerine sadece rollback yaz�labilir.

--Normalde default olarak her�ey begin tran ile ba�lay�p commit tran ile biter.Biz bu yap�lar� kullanmasak bile 



--Prototip 
--Begin Tran transaction Ad�
--��lemler

Insert Bolge Values(5,'�orum')--Varsay�lan olarak Transaction kontrol�nde bir i�lemdir.Netice olarak gene varsay�lan olarak commit tran olarak bitmektedir.


Begin Tran Kontrol
Insert Bolge Values(5,'�orum')
Commit Tran

--Transaction'a isim vermek zorunda de�iliz.

Begin Tran 
Insert Bolge Values(5,'�orum')
Commit Tran


--A�a��daki �rne�i inceleyelim.
Begin Tran Kontrol 
Declare @i int
Delete from Personeller where PersonelID>20
Set @i =@@ROWCOUNT
If @i =1
Begin 
	print 'Kay�t Silindi.'
	Commit
	--yada
	--Commit Tran
End
Else
Begin
	print '��lemler geri al�nd�.'
	Rollback
	--yada 
	--Rollback Tran
End
/*
�zetle, bu kod blo�u Personeller tablosunda PersonelID de�eri 20'den b�y�k olan kay�tlar� siler. Silinen kay�t say�s� 1 ise i�lemler onaylan�r; aksi takdirde i�lemler geri al�n�r.

E�er @i de�eri 1 ise (yani yaln�zca bir sat�r silinmi�se):
print 'Kay�t Silindi.' komutu ile "Kay�t Silindi." mesaj� yazd�r�l�r.
Commit komutu ile transaction onaylan�r ve yap�lan de�i�iklikler kal�c� hale getirilir.

E�er @i de�eri 1 de�ilse (yani birden fazla sat�r silinmi�se veya hi� sat�r silinmemi�se):
print '��lemler geri al�nd�.' komutu ile "��lemler geri al�nd�." mesaj� yazd�r�l�r.
Rollback komutu ile transaction geri al�n�r ve yap�lan de�i�iklikler iptal edilir.
*/

