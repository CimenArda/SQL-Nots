--Batch Kavramý --GO
/* 
Batch (toplu iþlem), bir dizi SQL komutunun bir arada çalýþtýrýlmasýdýr. Bir batch içinde yer alan tüm komutlar, tek bir iþlem olarak deðerlendirilir ve yürütülür. Batch'ler, bir veritabanýnda bir dizi iþlemi atomik bir þekilde gerçekleþtirmek ve yönetmek için kullanýlýr.
*/
--GO komutu, SQL Server'ýn batch'leri ayýrmasýný ve her bir batch'in baðýmsýz olarak yürütülmesini saðlar.

cREATE Database OrnekVeritabani
Go
Use OrnekVeriTabani
Go
Create Table OrnekTablo
(
	Id int primary key identity(1,1),
	Kolon1 nvarchar(max),
	Kolon2 nvarchar(max)
)


