--Group By 
/*  SQL veritaban� tablosundaki verileri belirli bir kriter (veya kriterler) temelinde gruplama i�lemi yapar. 
Bu i�lem sonucunda, belirli bir kriteri kar��layan t�m veriler ayn� grupta birle�tirilir*/
Select KategoriID,COUNT(*) from Urunler group by KategoriID

--Birden fazla gruplama
Select KategoriID,TedarikciID,COUNT(*) from Urunler group by KategoriID,TedarikciID

--Hangi personel ka� tane sat�� yapm��
Select PersonelID,Count(*) from Satislar group by PersonelID


--Hangi Personel toplam ne kadar nakliye �creti �dedi.
Select PersonelID,Sum(NakliyeUcreti) from Satislar group by PersonelID




--Group by ��leminde where �art� yazmak

/*Bu sorgu, Urunler tablosundaki �r�nleri KategoriID de�eri 5�ten b�y�k olan kategorilere g�re gruplayarak
her kategoride ka� �r�n oldu�unu sayar1.
Yani, 5�ten b�y�k KategoriID de�erine sahip �r�nleri gruplar ve her bir grup i�in �r�n say�s�n� hesaplar.
�rne�in, 6, 7 ve 8 gibi KategoriID de�erlerine sahip �r�nlerin say�s�n� bu sorgu ile bulabilirsiniz. */
Select KategoriID,Count(*) from Urunler where KategoriID > 5 group by KategoriID
