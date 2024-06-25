--  _ Operatörü
/* 
SQL'de LIKE operatörü ile birlikte kullanýlan _ karakteri,
herhangi bir tek karakteri temsil eder. Bu joker karakter, 
desen eþleþtirme sorgularýnda kullanýlýr 
ve belirli bir konumda tek bir karakterin yerine geçer.
*/

--Ýsminin Ýlk harfi a ikinci harfi farketmez ve üçüncü harfi d olan personeli getir.
Select * from Personeller where Adi Like 'a_d%'
