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
	

if object_id('AspNetUserClaims') is not null
	drop table AspNetUserClaims
if object_id('AspNetUserLogins') is not null
	drop table AspNetUserLogins
if object_id('AspNetUserRoles') is not null
	drop table AspNetUserRoles
if object_id('AspNetUsers') is not null
	drop table AspNetUsers
if object_id('AspNetRoles') is not null
	drop table AspNetRoles
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
	[IdUser][nvarchar](128) NULL,
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/26/2015 1:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/26/2015 1:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/26/2015 1:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/26/2015 1:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/26/2015 1:55:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'65e2fafa-96fd-4b64-a8b5-5c268fce2920', N'matthieu@gmail.com', 0, N'AKhCMfSv2ojt2bOeh0RgpYPMTLU4nM39z5rf2x75jJ3pwSSduWaFDXv6iUK2F018fg==', N'271e85c1-c52b-46bc-b9d8-614ed3a79382', NULL, 0, 0, NULL, 1, 0, N'matthieu@gmail.com')
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Identites]  WITH CHECK ADD  CONSTRAINT [Fk_Identites_AspNetUsers] FOREIGN KEY([IdUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Identites] CHECK CONSTRAINT [Fk_Identites_AspNetUsers]

GO
ALTER TABLE [dbo].[Utilisateurs]  WITH CHECK ADD  CONSTRAINT [fk_utilisateurs_adresse] FOREIGN KEY([IdAdresse])
REFERENCES [dbo].[Adresses] ([IdAdresse])
GO
ALTER TABLE [dbo].[Utilisateurs] CHECK CONSTRAINT [fk_utilisateurs_adresse]
GO
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

-- INSERT [dbo].[Identites] ([IdIdentite], [Nom], [Prenom], [Identifiant], [Password], [Email]) 

SET IDENTITY_INSERT [dbo].[Identites] OFF
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([IdAdresse], [Ligne1], [Ligne2], [CodePostal], [Ville]) VALUES (1, N'2 rue tralala', NULL, N'75012', N'Paris')
SET IDENTITY_INSERT [dbo].[Adresses] OFF