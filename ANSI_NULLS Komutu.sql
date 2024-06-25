-- ANSI_NULLS Komutu

--Set ANSI_NULLS [ ON | OFF]

--where þartlarýnda kontrol edilen eþitlik yahut eþit deðillik durumlarýnda null deðerlerin dikkate alýp alýnmayacagýný belirlememizi saðlayan bir özelliktir.

--ON deðeri verilirse null deðerler dikkate alýnmaz.
--OFF deðeri verilirse null deðerler dikkate alýnýr.


Set ANSI_NULLS ON 

Select * from Personeller where UnvanEki = NuLL

Set ANSI_NULLS OFF 
