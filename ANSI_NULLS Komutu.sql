-- ANSI_NULLS Komutu

--Set ANSI_NULLS [ ON | OFF]

--where �artlar�nda kontrol edilen e�itlik yahut e�it de�illik durumlar�nda null de�erlerin dikkate al�p al�nmayacag�n� belirlememizi sa�layan bir �zelliktir.

--ON de�eri verilirse null de�erler dikkate al�nmaz.
--OFF de�eri verilirse null de�erler dikkate al�n�r.


Set ANSI_NULLS ON 

Select * from Personeller where UnvanEki = NuLL

Set ANSI_NULLS OFF 
