--Cascade 
--Ana tablodaki kayıt silindiğinde ya da güncellendiğinde İlişkili kolondaki karşılığıda otomatik olarak silinir ya da güncellenir.

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Cascade 
On Update Cascade


--Set Null
--Ana tablodaki kayıt silindiğinde ya da güncellendiğinde ilişkili kolondaki karşılığına
--'null' değer atanır

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Null 
On Update Set Null


--Set Default 
/*
Ana tablodaki kayıt silindiğinde ya da güncellendiğinde,ilişkili kolondaki karşılığına o kolonun default değeri basılır.bu default değeri biz oluşturabiliriz.
*/
Alter table Ogrenciler
Add Constraint DefaultOgrenci Default -1 For DersId

Alter table Ogrenciler
Add Constraint Foreignkeyogrenciders foreign key (DersId) References Dersler(DersID)
on delete  Set Default 
On Update Set Default 

--Bu ayarlar verilmediği takdirde 'no action' özelliği geçerlidir.