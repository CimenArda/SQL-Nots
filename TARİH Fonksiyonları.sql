--TARÝH Fonksiyonlarý

--GETDATE: BUGÜNÜN TARÝHÝNÝ VERÝR.
Select GETDATE()

--DATEADD: Verilen tarihe verildiði kadar gün ay yýl ekler
Select DATEADD(DAY,333,Getdate())
Select DATEADD(MONTH,333,Getdate())
Select DATEADD(YEAR,333,Getdate())


--DATEDÝFF:Ýki tarih arasýndaki gün ay yýl farkýný hesaplar
Select DATEDIFF(DAY,'11.08.2004',GETDATE())
Select DATEDIFF(Month,'11.08.2004',GETDATE())
Select DATEDIFF(Year,'11.08.2004',GETDATE())

--DATEPART :VERÝLEN TARÝHÝN HAFTANIN AYIN YAHUT YILIN KAÇINCI GÜNÜ OLDUGUNU HESAPLAR
--HAFTANIN KAÇINCI GÜNÜ BELÝRTLÝR
Select DATEPART(DW,GETDATE())
Select DATEPART(MONTH,GETDATE())
Select DATEPART(DAY,GETDATE())