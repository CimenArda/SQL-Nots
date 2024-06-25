--[](ya da) Operatörü

--Ýsminin ilk harfi n ya da m ya da r olan personelleri getir.
Select * from Personeller where Adi Like '[nmr]%'

--isminin içerisinde a yada i harfi geçen personelleri getir.
Select * from Personeller where Adi Like '%[ai]%'