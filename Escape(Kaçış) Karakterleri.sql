
--Escape(Ka���) Karakterleri
/* Like sorgular�nda kulland�g�m�z %,_,[] gibi �zel ifadeler e�er ki verilerimiz i�erisinde
sorgulama esnas�nda hata ile kar��la�abiliriz.B�yle durumlarda bu ifadelerin �zel ifade olmad�g�n�
escape karakterleri ile belirleyebiliriz.
*/

--[] operat�r� ile 
--Escape komutu ile 

--�rneklerle anlatabilmek i�iin personeller tablosuna %arda tarz�nda veriler ekliycem

/*Adi _ ile baslayan personeli getir dedim normal kullan�m bu �ekilde ama getirmez
escape karakterleri kullan�lmad�g� i�in
*/
Select * from Personeller where Adi Like '_%' --Yanl�� kullan�m 

Select * from Personeller where Adi Like '[_]%' --Do�ru kullan�m

Select  * from Personeller where Adi Like '?_%' escape '?' --Do�ru kullan�m