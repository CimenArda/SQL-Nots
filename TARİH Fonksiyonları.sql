--TAR�H Fonksiyonlar�

--GETDATE: BUG�N�N TAR�H�N� VER�R.
Select GETDATE()

--DATEADD: Verilen tarihe verildi�i kadar g�n ay y�l ekler
Select DATEADD(DAY,333,Getdate())
Select DATEADD(MONTH,333,Getdate())
Select DATEADD(YEAR,333,Getdate())


--DATED�FF:�ki tarih aras�ndaki g�n ay y�l fark�n� hesaplar
Select DATEDIFF(DAY,'11.08.2004',GETDATE())
Select DATEDIFF(Month,'11.08.2004',GETDATE())
Select DATEDIFF(Year,'11.08.2004',GETDATE())

--DATEPART :VER�LEN TAR�H�N HAFTANIN AYIN YAHUT YILIN KA�INCI G�N� OLDUGUNU HESAPLAR
--HAFTANIN KA�INCI G�N� BEL�RTL�R
Select DATEPART(DW,GETDATE())
Select DATEPART(MONTH,GETDATE())
Select DATEPART(DAY,GETDATE())