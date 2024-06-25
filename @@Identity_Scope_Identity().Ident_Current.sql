--@@Identity ,Scope_Identity() ve Ident_Current Komutlar�

--@@Identity
--A��lm�� olan ba�lant�da(connection) tablo yahut sorgunun �al�st�g� scope a bakmaks�z�n son �retilen identity de�erini vermektedir.

--Trigger kullan�lan sorgularda yanl�� sonuc verme ihtimalinden dolay� kullan�lmas� tavsiye edilmez

Insert Personeller (Adi,SoyAdi) values ('Arda','Cimen')
Select @@IDENTITY



--Scope_Identity()
--A��lm�� olan ba�lant�da(connection) ve sorgunun �al�st�g� scope ta son �retilen identity de�erini d�nd�r�r.

--Trigger kullan�lan sorgularda @@Identity yerine bu fonksiyonun kullan�lmas� tavs�ye edilir.
Insert Personeller (Adi,SoyAdi) values ('Arda','Cimen')
Select SCOPE_IDENTITY()



--Ident_Current('TabloAdi')
--Ba�lant� ve sorgunun �al�st�r�ld�g� scope'a bakmaks�z�n parametre olarak verilen tabloda �retilen sonuncu identity de�erini d�nd�r�r.



