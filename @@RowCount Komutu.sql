
--@@RowCount Komutu
/*
son ger�ekle�tirilen SQL ifadesi taraf�ndan etkilenen
sat�r say�s�n� d�nd�r�r. 
Bu komut, 
bir sorgu veya veri de�i�tirme i�lemi 
(INSERT, UPDATE, DELETE) sonras�nda ka� sat�r�n etkilendi�ini ��renmek i�in kullan�l�r.

*/

Delete from OrnekPersoneller where SoyAdi = '�imen'
Select @@ROWCOUNT
--2 tane �imen soyad�nda veri oldugu i�in iki de�eri d�nd�rd�.

Select * from Personeller
Select @@ROWCOUNT
