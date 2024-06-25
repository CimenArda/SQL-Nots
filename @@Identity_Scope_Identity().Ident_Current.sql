--@@Identity ,Scope_Identity() ve Ident_Current Komutlarý

--@@Identity
--Açýlmýþ olan baðlantýda(connection) tablo yahut sorgunun çalýstýgý scope a bakmaksýzýn son üretilen identity deðerini vermektedir.

--Trigger kullanýlan sorgularda yanlýþ sonuc verme ihtimalinden dolayý kullanýlmasý tavsiye edilmez

Insert Personeller (Adi,SoyAdi) values ('Arda','Cimen')
Select @@IDENTITY



--Scope_Identity()
--Açýlmýþ olan baðlantýda(connection) ve sorgunun çalýstýgý scope ta son üretilen identity deðerini döndürür.

--Trigger kullanýlan sorgularda @@Identity yerine bu fonksiyonun kullanýlmasý tavsýye edilir.
Insert Personeller (Adi,SoyAdi) values ('Arda','Cimen')
Select SCOPE_IDENTITY()



--Ident_Current('TabloAdi')
--Baðlantý ve sorgunun çalýstýrýldýgý scope'a bakmaksýzýn parametre olarak verilen tabloda üretilen sonuncu identity deðerini döndürür.



