--[](ya da) Operat�r�

--�sminin ilk harfi n ya da m ya da r olan personelleri getir.
Select * from Personeller where Adi Like '[nmr]%'

--isminin i�erisinde a yada i harfi ge�en personelleri getir.
Select * from Personeller where Adi Like '%[ai]%'