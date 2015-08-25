use Form114

if object_id('Photos') is not null
	drop table Photos
if object_id('Prix') is not null
	drop table Prix
if object_id('Produits') is not null
	drop table Produits
if object_id('Administrateurs') is not null
	drop table Administrateurs

if object_id('Acheteurs') is not null
	drop table Acheteurs
if object_id('Vendeurs') is not null
	drop table Vendeurs
if object_id('Utilisateurs') is not null
	drop table Utilisateurs
if object_id('Identites') is not null
	drop table Identites
if object_id('Adresses') is not null
	drop table Adresses
GO

CREATE TABLE Produits
(
	IdProduit int identity PRIMARY KEY,
	IdVille int references Villes not null,
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

GO
/****** Object:  Table [dbo].[Acheteurs]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acheteurs](
	[IdAcheteur] [int] NOT NULL,
 CONSTRAINT [Pk_Acheteur] PRIMARY KEY CLUSTERED 
(
	[IdAcheteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Administrateurs]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrateurs](
	[IdAdministrateur] [int] NOT NULL,
 CONSTRAINT [Pk_Administrateurs] PRIMARY KEY CLUSTERED 
(
	[IdAdministrateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Identites]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Identites](
	[IdIdentite] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NULL,
	[Prenom] [varchar](30) NULL,
	[Identifiant] [char](10) NULL,
	[Password] [char](10) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [Pk_Utilisateur_0] PRIMARY KEY CLUSTERED 
(
	[IdIdentite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateurs](
	[IdUtilisateur] [int] NOT NULL,
	[IdAdresse] [int] NOT NULL,
	[DateInscription] [datetime2](7) NOT NULL,
	[LastConnection] [datetime2](7) NULL,
 CONSTRAINT [Pk_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendeurs]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendeurs](
	[IdVendeur] [int] NOT NULL,
 CONSTRAINT [Pk_Vendeurs] PRIMARY KEY CLUSTERED 
(
	[IdVendeur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 10/08/2015 06:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adresses](
	[IdAdresse] [int] IDENTITY(1,1) NOT NULL,
	[Ligne1] [varchar](36) NOT NULL,
	[Ligne2] [varchar](36) NULL,	
	[CodePostal] [char](5) NOT NULL,
	[Ville] [varchar](36) NULL,
 CONSTRAINT [Pk_Adresse] PRIMARY KEY CLUSTERED 
(
	[IdAdresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Idx_Adresse_0]    Script Date: 10/08/2015 06:52:24 ******/
ALTER TABLE [dbo].[Adresses] ADD  CONSTRAINT [Idx_Adresse_0] UNIQUE NONCLUSTERED 
(
	[Ligne1] ASC,
	[Ligne2] ASC,	
	[CodePostal] ASC,
	[Ville] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Utilisateurs]  WITH CHECK ADD  CONSTRAINT [fk_utilisateurs_adresse] FOREIGN KEY([IdAdresse])
REFERENCES [dbo].[Adresses] ([IdAdresse])
GO
ALTER TABLE [dbo].[Utilisateurs] CHECK CONSTRAINT [fk_utilisateurs_adresse]

ALTER TABLE [dbo].[Acheteurs]  WITH CHECK ADD  CONSTRAINT [Fk_Acheteurs_Utilisateurs] FOREIGN KEY([IdAcheteur])
REFERENCES [dbo].[Utilisateurs] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[Acheteurs] CHECK CONSTRAINT [Fk_Acheteurs_Utilisateurs]
GO
ALTER TABLE [dbo].[Administrateurs]  WITH CHECK ADD  CONSTRAINT [fk_administrateurs_identites] FOREIGN KEY([IdAdministrateur])
REFERENCES [dbo].[Identites] ([IdIdentite])
GO
ALTER TABLE [dbo].[Administrateurs] CHECK CONSTRAINT [fk_administrateurs_identites]
GO
ALTER TABLE [dbo].[Utilisateurs]  WITH CHECK ADD  CONSTRAINT [fk_utilisateurs_identites] FOREIGN KEY([IdUtilisateur])
REFERENCES [dbo].[Identites] ([IdIdentite])
GO
ALTER TABLE [dbo].[Utilisateurs] CHECK CONSTRAINT [fk_utilisateurs_identites]
GO
ALTER TABLE [dbo].[Vendeurs]  WITH CHECK ADD  CONSTRAINT [Fk_Vendeurs_Utilisateurs] FOREIGN KEY([IdVendeur])
REFERENCES [dbo].[Utilisateurs] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[Vendeurs] CHECK CONSTRAINT [Fk_Vendeurs_Utilisateurs]


INSERT INTO Produits (IdVille, NbPlaces,Adresse, Description) VALUES
(1, 1, '12 avenue de machin', ''),
(1, 1, '24 rue de truc', ''),
(2, 10, '2 chemin à louest', '')

INSERT INTO Prix (IdProduit, DateDebut,	DateFin, Montant) 
VALUES
(1, GETDATE(), DATEADD(DAY, 20, GETDATE()), 160),
(2, GETDATE(), DATEADD(DAY, 20, GETDATE()), 60),
(1, DATEADD(MONTH, 6, GETDATE()), DATEADD(MONTH, 7, GETDATE()), 60)


SET IDENTITY_INSERT [dbo].[Identites] ON 

INSERT [dbo].[Identites] ([IdIdentite], [Nom], [Prenom], [Identifiant], [Password], [Email]) VALUES (1, N'Durant', N'Pedro', N'Lamule    ', N'password  ', N'email')
SET IDENTITY_INSERT [dbo].[Identites] OFF
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([IdAdresse], [Ligne1], [Ligne2], [CodePostal], [Ville]) VALUES (1, N'2 rue tralala', NULL, N'75012', N'Paris')
SET IDENTITY_INSERT [dbo].[Adresses] OFF