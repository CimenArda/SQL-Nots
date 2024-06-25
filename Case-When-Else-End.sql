
--Case-When-Else-End

--Personellerimizin isim ve soyisimlerinin yanýnda;UnvanEki 'Mr' ise 'Erkek' 'Ms' ise 'Kadýn' Yazýn.

Select Adi,SoyAdi,UnvanEki from Personeller

Select Adi,SoyAdi,
Case
When UnvanEki ='Mrs.' or UnvanEki = 'Ms.' Then 'Kadýn'
When UnvanEki = 'Mr.' Then 'Erkek'
Else UnvanEki
End
From Personeller

/* 
Eðer ürünün birim fiyatý 0-50 arasý ise 'Çin Malý' 50 -100 arasý ise 'Ucuz' 100-200
arasý ise Normal ve 200 den fazla ise 'Pahalý' yazsýn
*/

Select UrunID,
Case
When BirimFiyati Between 0 and 50 Then 'Çin Malý'
When BirimFiyati Between 50 and 100 Then 'Kalitesiz'
When BirimFiyati Between 150 and 200 Then  'Normal'
When BirimFiyati >50 Then 'Pahalý'
Else 'Belirsiz'
End 
From Urunler
