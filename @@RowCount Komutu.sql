
--@@RowCount Komutu
/*
son gerçekleþtirilen SQL ifadesi tarafýndan etkilenen
satýr sayýsýný döndürür. 
Bu komut, 
bir sorgu veya veri deðiþtirme iþlemi 
(INSERT, UPDATE, DELETE) sonrasýnda kaç satýrýn etkilendiðini öðrenmek için kullanýlýr.

*/

Delete from OrnekPersoneller where SoyAdi = 'Çimen'
Select @@ROWCOUNT
--2 tane Çimen soyadýnda veri oldugu için iki deðeri döndürdü.

Select * from Personeller
Select @@ROWCOUNT
