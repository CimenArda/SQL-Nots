--TOP Komutu
--�lk 3 personeli getirir.
Select Top 3 * from Personeller

--Disticnt Komutu
--Benzer olan verileri teke indirmemizi sa�layan komuttur

--B�t�n personellerin sehirini tek tek yazar ayn� olanlar vard�r
Select sehir from Personeller

--B�t�n personellerin sehirlerini yazar ama tekrars�z getirir.yani ayn� sehirden 5 tane varsa 1 tane yazar
Select DISTINCT sehir from Personeller
