
--AND OPERAT�R� 
/* 
AND operat�r�, SQL'de birden fazla ko�ulun ayn� anda sa�lanmas�n� gerektiren 
bir ko�ul belirleme operat�r�d�r.
AND operat�r� ile birden fazla ko�ul belirtilerek, 
her iki ko�ulun da do�ru oldu�u sat�rlar sorgu sonucuna dahil edilir.
*/

--Personeller tablosunda sehiri london ve �lkesi uk olanlar� listeleyelim.
Select * from Personeller Where Sehir='London' and Ulke='UK'



--OR Operat�r�
/*
OR operat�r�, SQL'de birden fazla ko�ulun 
herhangi birinin do�ru olmas� durumunda sat�rlar� se�mek i�in kullan�l�r. 
OR operat�r� ile belirtilen ko�ullardan en az birinin sa�lanmas� yeterlidir.

*/

--Personeller tablosunda unvan� Mr. olanlar ya da Sehiri seatlle olanlar� listeleyelim.
Select * from Personeller where UnvanEki ='Mr.' or Sehir='Seattle'
