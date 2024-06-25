--Ge�ici Tablolar --Temporary Tables

/* 
Genellikle Bir sql Server �zerinde farkl� lokasyonlarda birden fazla ki�inin �al��t�g� durumlarda ya da verilerin test ama�l� ge�ici bir yerde tutulmas� 
i�lenmesi amacay�la kullan�lan yap�lard�r.


Bilinen tablo yap�s�n�n ayn�s�n� sa�lar.Tek farklar� fiziksel olarak olu�mazlar.Bellekte ge�ici olarak olu�urlar.


Selecet Insert update delete i�lemleri yap�labilir.�li�ki kurulabilir.

Sunucu kapat�ld�g�nda ya da oturum sahibi oturumu kapatt�g�nda bellekten silinir.
*/



--Bir tabloyu fiziksel****** olarak kopyalama
Select * Into GeciciPersoneller from Personeller
--Bu �ekilde bir kullan�mda primary key ve foreign key constraintler olu�turulmaz Geri kalan her �ey birebir fiziksel olarak olu�turulur.




--Bir tabloyu # ifadesi ile bellege ge�ici olarak kopyalama

/*
Sadece olu�turulduklar� oturumda (session) veya ba�lant�da (connection) g�r�n�rler. Oturum sona erdi�inde veya ba�lant� kapand���nda otomatik olarak silinirler.

*/
Select * Into #GeciciPersoneller from Personeller


Select * from #GeciciPersoneller


--Ge�ici tablo �zerinde her t�rl� i�lemi yapabiliriz.
--# ile olu�turulan tablo o an sql serverda oturum a�m�� ki�inin sunucu belle�inde olu�ur.
--Sadece oturum a�an sah�s kullanabilir.
--E�er oturum a�an sah�s sql serverdan disconnect olursa bu tablo bellekten silinir.


--Bir tabloyu ## ifadesi ile bellege ge�ici olarak kopyalama
/* 
K�resel Kapsam: T�m oturumlar (sessions) ve ba�lant�lar (connections) taraf�ndan eri�ilebilirler.
Ya�am S�resi: Tablo, son kullan�ld��� oturum sona erdi�inde veya ba�lant� kapand���nda otomatik olarak silinir.

*/
Select * Into ##GeciciPersoneller2 from Personeller






