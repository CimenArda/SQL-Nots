--While D�ng�s�
--While �art Komut

Declare @Sayac int =0
While @Sayac < 100
	Begin
		print @Sayac
		Set @Sayac =@Sayac + 1
	End



--Break Komutu
/* 
 D�ng�leri sonland�rmak i�in kullan�l�r. Genellikle WHILE d�ng�leri i�inde kullan�l�r ve belirli bir ko�ulun sa�lanmas� durumunda d�ng�n�n tamamlanmadan sona erdirilmesini sa�lar
*/
Declare @Sayac1 int =0
While @Sayac1 < 1000
	Begin
		print @Sayac1
		Set @Sayac1 =@Sayac1 + 1
			If @Sayac1 = 465 
				Break
	End


