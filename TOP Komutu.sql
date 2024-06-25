--TOP Komutu
--Ýlk 3 personeli getirir.
Select Top 3 * from Personeller

--Disticnt Komutu
--Benzer olan verileri teke indirmemizi saðlayan komuttur

--Bütün personellerin sehirini tek tek yazar ayný olanlar vardýr
Select sehir from Personeller

--Bütün personellerin sehirlerini yazar ama tekrarsýz getirir.yani ayný sehirden 5 tane varsa 1 tane yazar
Select DISTINCT sehir from Personeller
