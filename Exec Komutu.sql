--Exec Komutu
Exec ('Select * from Personeller')

--Yanlýþ kullaným 
Exec('Declare @Sayac int =0')
Exec('print @Sayac')

--Doðru kullaným
Exec('Declare @Sayac int =0 print @Sayac')