use Form114

if object_id('Photos') is not null
	drop table Photos
if object_id('Prix') is not null
	drop table Prix
if object_id('Produits') is not null
	drop table Produits

GO

CREATE TABLE Produits
(
	IdProduit int identity PRIMARY KEY,
	IdVille int references Villes,
	NbPlaces int,
	Adresse varchar(100),
	Description varchar(100)
)

CREATE TABLE Photos
(
	IdPhoto int identity PRIMARY KEY,
	IdProduit int references Produits,
	Path varchar(100)
)

CREATE TABLE Prix
(
	IdPrix int identity PRIMARY KEY,
	IdProduit int references Produits,
	DateDebut Date,
	DateFin Date,
	Montant int
)

INSERT INTO Produits (IdVille, NbPlaces,Adresse, Description) VALUES
(1, 1, '12 avenue de machin', ''),
(1, 1, '24 rue de truc', ''),
(2, 10, '2 chemin à louest', '')

INSERT INTO Prix (IdProduit, DateDebut,	DateFin, Montant) 
VALUES
(1, GETDATE(), DATEADD(DAY, 20, GETDATE()), 160),
(2, GETDATE(), DATEADD(DAY, 20, GETDATE()), 60),
(1, DATEADD(MONTH, 6, GETDATE()), DATEADD(MONTH, 7, GETDATE()), 60)