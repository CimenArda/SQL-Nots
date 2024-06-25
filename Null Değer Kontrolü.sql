--Null Deðer Kontrolü


--Case-When-Then-Else-End Kalýbý Ýle Null Kontrolü
Select MusteriAdi,
Case
When Bolge Is Null Then 'Bölge Bilinmiyor'
Else
Bolge
End 
From Musteriler

--Coalesce Fonksiyonu ile Null Kontrolü
Select MusteriAdi,Coalesce(Bolge,'Bölge Bilinmiyor') From Musteriler


-- IsNull Fonksiyonu ile Null Kontrolü
Select MusteriAdi,IsNull(Bolge,'Bölge Bilinmiyor') From Musteriler


--NullIf Fonksiyonu ile Null Kontrolü
/*
NULLIF fonksiyonu,
SQL'de iki deðeri karþýlaþtýrmak ve bu deðerler eþitse null döndürmek için kullanýlýr. 
Eðer deðerler eþit deðilse, NULLIF ilk deðeri döndürür. 
Bu fonksiyon, özellikle belirli bir deðeri null olarak deðerlendirmek istediðinizde faydalýdýr.
*/
--Fonksiyona verilen kolon,Ýkinci parametre verilen deðere eþit ise 
--O kolonu null olarak getirir.

Select NullIf(0,0)
