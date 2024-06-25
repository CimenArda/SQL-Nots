--String Fonksiyonlarý


--LEFT : Soldan(Baþtan) belirtilen sayýda karakteri getirir.
Select Left(Adi,3) from Personeller

--RÝGHT :Saðdan(sondan) belirtilen sayýda karakteri getirir.
Select RIGHT(Adi,3) from Personeller

--Upper:Büyük harfe çevirir
Select Upper(Adi) from Personeller

--Lower:Küçük Harfe çevirir.
Select Lower(Adi) from Personeller

--Substring: Belirtilen indexten itibaren belirtilen sayýda karakter getirir.
Select Substring(Adi,0,3) from Personeller

--LTRÝM:Soldan boþluklarý keser
Select LTRIM('            Arda')

--RTRÝM:Saðdan boþluklarý keser
Select RTRIM('Arda            ')

--REVERSE :Tersine Çevirir.
Select REVERSE(Adi) from Personeller

--Replace: Belirtilen ifadeyi,belirtilen ifadeye çevirir.
Select Replace('Benim adým arda','arda','ahmet')

--CharIndex :Belirtilen karakterin veri içinde sýra numarasýný verir.
Select CHARINDEX('R',Adi) from Personeller
