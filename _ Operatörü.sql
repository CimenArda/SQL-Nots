--  _ Operat�r�
/* 
SQL'de LIKE operat�r� ile birlikte kullan�lan _ karakteri,
herhangi bir tek karakteri temsil eder. Bu joker karakter, 
desen e�le�tirme sorgular�nda kullan�l�r 
ve belirli bir konumda tek bir karakterin yerine ge�er.
*/

--�sminin �lk harfi a ikinci harfi farketmez ve ���nc� harfi d olan personeli getir.
Select * from Personeller where Adi Like 'a_d%'
