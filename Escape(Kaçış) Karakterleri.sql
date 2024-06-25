
--Escape(Kaçýþ) Karakterleri
/* Like sorgularýnda kullandýgýmýz %,_,[] gibi özel ifadeler eðer ki verilerimiz içerisinde
sorgulama esnasýnda hata ile karþýlaþabiliriz.Böyle durumlarda bu ifadelerin özel ifade olmadýgýný
escape karakterleri ile belirleyebiliriz.
*/

--[] operatörü ile 
--Escape komutu ile 

--Örneklerle anlatabilmek içiin personeller tablosuna %arda tarzýnda veriler ekliycem

/*Adi _ ile baslayan personeli getir dedim normal kullaným bu þekilde ama getirmez
escape karakterleri kullanýlmadýgý için
*/
Select * from Personeller where Adi Like '_%' --Yanlýþ kullaným 

Select * from Personeller where Adi Like '[_]%' --Doðru kullaným

Select  * from Personeller where Adi Like '?_%' escape '?' --Doðru kullaným