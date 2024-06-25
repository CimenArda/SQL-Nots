
--AND OPERATÖRÜ 
/* 
AND operatörü, SQL'de birden fazla koþulun ayný anda saðlanmasýný gerektiren 
bir koþul belirleme operatörüdür.
AND operatörü ile birden fazla koþul belirtilerek, 
her iki koþulun da doðru olduðu satýrlar sorgu sonucuna dahil edilir.
*/

--Personeller tablosunda sehiri london ve ülkesi uk olanlarý listeleyelim.
Select * from Personeller Where Sehir='London' and Ulke='UK'



--OR Operatörü
/*
OR operatörü, SQL'de birden fazla koþulun 
herhangi birinin doðru olmasý durumunda satýrlarý seçmek için kullanýlýr. 
OR operatörü ile belirtilen koþullardan en az birinin saðlanmasý yeterlidir.

*/

--Personeller tablosunda unvaný Mr. olanlar ya da Sehiri seatlle olanlarý listeleyelim.
Select * from Personeller where UnvanEki ='Mr.' or Sehir='Seattle'
