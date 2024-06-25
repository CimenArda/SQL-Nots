--While Döngüsü
--While þart Komut

Declare @Sayac int =0
While @Sayac < 100
	Begin
		print @Sayac
		Set @Sayac =@Sayac + 1
	End



--Break Komutu
/* 
 Döngüleri sonlandýrmak için kullanýlýr. Genellikle WHILE döngüleri içinde kullanýlýr ve belirli bir koþulun saðlanmasý durumunda döngünün tamamlanmadan sona erdirilmesini saðlar
*/
Declare @Sayac1 int =0
While @Sayac1 < 1000
	Begin
		print @Sayac1
		Set @Sayac1 =@Sayac1 + 1
			If @Sayac1 = 465 
				Break
	End


