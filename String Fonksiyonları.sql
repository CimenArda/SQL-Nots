--String Fonksiyonlar�


--LEFT : Soldan(Ba�tan) belirtilen say�da karakteri getirir.
Select Left(Adi,3) from Personeller

--R�GHT :Sa�dan(sondan) belirtilen say�da karakteri getirir.
Select RIGHT(Adi,3) from Personeller

--Upper:B�y�k harfe �evirir
Select Upper(Adi) from Personeller

--Lower:K���k Harfe �evirir.
Select Lower(Adi) from Personeller

--Substring: Belirtilen indexten itibaren belirtilen say�da karakter getirir.
Select Substring(Adi,0,3) from Personeller

--LTR�M:Soldan bo�luklar� keser
Select LTRIM('            Arda')

--RTR�M:Sa�dan bo�luklar� keser
Select RTRIM('Arda            ')

--REVERSE :Tersine �evirir.
Select REVERSE(Adi) from Personeller

--Replace: Belirtilen ifadeyi,belirtilen ifadeye �evirir.
Select Replace('Benim ad�m arda','arda','ahmet')

--CharIndex :Belirtilen karakterin veri i�inde s�ra numaras�n� verir.
Select CHARINDEX('R',Adi) from Personeller
