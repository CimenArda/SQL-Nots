--With Ties
/* 
 TOP ifadesiyle birlikte kullanýlýr ve belirtilen sýradaki son satýrla ayný deðeri paylaþan
 ek satýrlarýn da sonuç kümesine dahil edilmesini saðlar. 

*/

Select top  6 With TIES * from [Satis Detaylari]
order by SatisID
 