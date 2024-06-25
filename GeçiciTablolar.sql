--Geçici Tablolar --Temporary Tables

/* 
Genellikle Bir sql Server üzerinde farklý lokasyonlarda birden fazla kiþinin çalýþtýgý durumlarda ya da verilerin test amaçlý geçici bir yerde tutulmasý 
iþlenmesi amacayýla kullanýlan yapýlardýr.


Bilinen tablo yapýsýnýn aynýsýný saðlar.Tek farklarý fiziksel olarak oluþmazlar.Bellekte geçici olarak oluþurlar.


Selecet Insert update delete iþlemleri yapýlabilir.Ýliþki kurulabilir.

Sunucu kapatýldýgýnda ya da oturum sahibi oturumu kapattýgýnda bellekten silinir.
*/



--Bir tabloyu fiziksel****** olarak kopyalama
Select * Into GeciciPersoneller from Personeller
--Bu þekilde bir kullanýmda primary key ve foreign key constraintler oluþturulmaz Geri kalan her þey birebir fiziksel olarak oluþturulur.




--Bir tabloyu # ifadesi ile bellege geçici olarak kopyalama

/*
Sadece oluþturulduklarý oturumda (session) veya baðlantýda (connection) görünürler. Oturum sona erdiðinde veya baðlantý kapandýðýnda otomatik olarak silinirler.

*/
Select * Into #GeciciPersoneller from Personeller


Select * from #GeciciPersoneller


--Geçici tablo üzerinde her türlü iþlemi yapabiliriz.
--# ile oluþturulan tablo o an sql serverda oturum açmýþ kiþinin sunucu belleðinde oluþur.
--Sadece oturum açan sahýs kullanabilir.
--Eðer oturum açan sahýs sql serverdan disconnect olursa bu tablo bellekten silinir.


--Bir tabloyu ## ifadesi ile bellege geçici olarak kopyalama
/* 
Küresel Kapsam: Tüm oturumlar (sessions) ve baðlantýlar (connections) tarafýndan eriþilebilirler.
Yaþam Süresi: Tablo, son kullanýldýðý oturum sona erdiðinde veya baðlantý kapandýðýnda otomatik olarak silinir.

*/
Select * Into ##GeciciPersoneller2 from Personeller






