--With Ties
/* 
 TOP ifadesiyle birlikte kullan�l�r ve belirtilen s�radaki son sat�rla ayn� de�eri payla�an
 ek sat�rlar�n da sonu� k�mesine dahil edilmesini sa�lar. 

*/

Select top  6 With TIES * from [Satis Detaylari]
order by SatisID
 