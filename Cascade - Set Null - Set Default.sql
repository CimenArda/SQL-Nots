--Cascade 
--Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde �li�kili kolondaki kar��l���da otomatik olarak silinir ya da g�ncellenir.

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Cascade 
On Update Cascade


--Set Null
--Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde ili�kili kolondaki kar��l���na
--'null' de�er atan�r

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Null 
On Update Set Null


--Set Default 
/*
Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde,ili�kili kolondaki kar��l���na o kolonun default de�eri bas�l�r.bu default de�eri biz olu�turabiliriz.
*/
Alter table Ogrenciler
Add Constraint DefaultOgrenci Default -1 For DersId

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Default 
On Update Set Default 

--Bu ayarlar verilmedi�i takdirde 'no action' �zelli�i ge�erlidir.