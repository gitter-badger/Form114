-- Création BDD
if db_id('Form114') is not null
   --code mine :)
   DROP DATABASE Form114

CREATE DATABASE Form114

use Form114

CREATE TABLE Pays
(
	IdPays int identity PRIMARY KEY,
	Libelle varchar(50)
)

CREATE TABLE Region
(
	IdRegion int identity PRIMARY KEY,
	IdPays int references Pays,
	Libelle varchar(50)
)

CREATE TABLE Ville
(
	IdVille int identity PRIMARY KEY,
	IdRegion int references Region,
	Libelle varchar(50)
)

CREATE TABLE Produit
(
	IdProduit int identity PRIMARY KEY,
	IdVille int references Ville,
	NbPlaces int,
	Adresse varchar(100),
	Description varchar(100)
)

CREATE TABLE Photo
(
	IdPhoto int identity PRIMARY KEY,
	IdProduit int references Produit,
	Path varchar(100)
)

CREATE TABLE Prix
(
	IdPrix int identity PRIMARY KEY,
	DateDebut Date,
	DateFin Date,
	Montant int
)

