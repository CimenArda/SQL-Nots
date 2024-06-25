--Cascade 
--Ana tablodaki kayýt silindiðinde ya da güncellendiðinde Ýliþkili kolondaki karþýlýðýda otomatik olarak silinir ya da güncellenir.

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Cascade 
On Update Cascade


--Set Null
--Ana tablodaki kayýt silindiðinde ya da güncellendiðinde iliþkili kolondaki karþýlýðýna
--'null' deðer atanýr

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Null 
On Update Set Null


--Set Default 
/*
Ana tablodaki kayýt silindiðinde ya da güncellendiðinde,iliþkili kolondaki karþýlýðýna o kolonun default deðeri basýlýr.bu default deðeri biz oluþturabiliriz.
*/
Alter table Ogrenciler
Add Constraint DefaultOgrenci Default -1 For DersId

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Default 
On Update Set Default 

--Bu ayarlar verilmediði takdirde 'no action' özelliði geçerlidir.