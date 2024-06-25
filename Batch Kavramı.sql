--Batch Kavram� --GO
/* 
Batch (toplu i�lem), bir dizi SQL komutunun bir arada �al��t�r�lmas�d�r. Bir batch i�inde yer alan t�m komutlar, tek bir i�lem olarak de�erlendirilir ve y�r�t�l�r. Batch'ler, bir veritaban�nda bir dizi i�lemi atomik bir �ekilde ger�ekle�tirmek ve y�netmek i�in kullan�l�r.
*/
--GO komutu, SQL Server'�n batch'leri ay�rmas�n� ve her bir batch'in ba��ms�z olarak y�r�t�lmesini sa�lar.

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


