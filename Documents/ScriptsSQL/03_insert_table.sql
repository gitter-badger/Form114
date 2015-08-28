use Form114

if object_id('Promos') is not null
	drop table Promos
if object_id('ProduitTracking') is not null
	drop table ProduitTracking
if object_id('Reservations') is not null
	drop table Reservations
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
	IdProduit int references Produits NOT NULL,
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
CREATE TABLE Reservations
(
	IdReservation int identity PRIMARY KEY,
	IdProduit int not null references Produits,
	IdClient nvarchar(128) not null references AspNetUsers,
	DateDebut Date not null,
	DateFin Date not null,
	NbPersonnes int not null,
	Prix int not null
)

GO 
CREATE TABLE Promos
(
	IdPromo int identity PRIMARY KEY,
	IdProduit int references Produits,
	Promo int not null,
	DateDeb DATE not null,
	DateFin DATE not null,
)
GO
/****** Object:  Table [dbo].[ProduitTracking]    Script Date: 8/27/2015 4:45:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProduitTracking](
	[IdPT] [int] IDENTITY(1,1) NOT NULL,
	[DatePT] [datetime2](7) not NULL,
	[IdProduit] int not NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
IF OBJECT_ID('Fk_Identites_AspNetUsers', 'F') IS NOT NULL
ALTER TABLE [dbo].[Identites]  DROP CONSTRAINT [Fk_Identites_AspNetUsers];

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
GO
ALTER TABLE [dbo].[ProduitTracking]  WITH CHECK ADD  CONSTRAINT [Fk_ProduitTracking_Produits] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produits] ([IdProduit])
GO
ALTER TABLE [dbo].[ProduitTracking] CHECK CONSTRAINT [Fk_ProduitTracking_Produits]

SET IDENTITY_INSERT [dbo].[Produits] ON 
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (1, 1, 1, N'12 avenue de machin', N'')
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (2, 4, 1, N'24 rue de truc', N'')
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (3, 2, 10, N'2 chemin à louest', N'')
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (4, 3, 2, N'45 avenue du truc', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (5, 130, 19, N'5884 Vitae, Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (6, 130, 7, N'P.O. Box 737, 1441 Morbi Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (7, 130, 5, N'Ap #261-7400 Est. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (8, 130, 2, N'P.O. Box 118, 1866 Massa. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (9, 130, 16, N'P.O. Box 784, 3742 At, Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (10, 130, 7, N'2386 Mauris St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (11, 130, 2, N'3970 Sollicitudin Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (12, 130, 18, N'Ap #967-1280 Mauris St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (13, 130, 20, N'P.O. Box 868, 9476 Justo Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (14, 130, 9, N'7287 Donec Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (15, 130, 11, N'Ap #772-7447 Non Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (16, 2447, 16, N'P.O. Box 322, 4142 Nascetur Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (17, 2447, 8, N'9772 Cras St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (18, 2447, 8, N'9679 Adipiscing Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (19, 2447, 16, N'3396 Nec Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (20, 2447, 15, N'6414 Id Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (21, 2447, 4, N'Ap #883-8043 Lacus. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (22, 2447, 2, N'376 Duis Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (23, 2447, 8, N'2054 In Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (24, 2447, 9, N'7992 Neque. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (25, 2447, 9, N'P.O. Box 649, 4976 Lacinia St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (26, 458, 3, N'P.O. Box 899, 7609 Eget Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (27, 458, 2, N'Ap #989-4168 Metus. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (28, 458, 18, N'945-6042 A St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (29, 458, 1, N'546-6759 Aliquam Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (30, 458, 11, N'Ap #858-5718 Metus. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (31, 458, 13, N'9523 Elementum, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (32, 458, 14, N'795-5179 Eget, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (33, 458, 1, N'Ap #459-3464 Vel St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (34, 458, 18, N'Ap #598-7075 Natoque Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (35, 458, 17, N'Ap #265-5029 Ac Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (36, 3700, 15, N'9521 Mi Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (37, 3959, 3, N'8065 Vestibulum Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (38, 4036, 4, N'Ap #310-1689 Nullam Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (39, 3890, 1, N'530-2652 Tempus Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (40, 387, 4, N'9410 Nec, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (41, 3278, 12, N'Ap #303-2802 Faucibus Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (42, 3091, 3, N'P.O. Box 385, 6733 Nec, Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (43, 453, 11, N'P.O. Box 779, 8024 Massa. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (44, 1263, 8, N'Ap #442-4763 Phasellus St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (45, 3676, 15, N'P.O. Box 180, 6640 Enim. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (46, 3152, 10, N'P.O. Box 285, 1455 Mi St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (47, 1153, 1, N'P.O. Box 447, 5171 Auctor St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (48, 3371, 2, N'P.O. Box 354, 8932 Sit St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (49, 2339, 17, N'302-7834 Pharetra Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (50, 709, 16, N'8617 Proin Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (51, 2609, 18, N'P.O. Box 321, 5472 Aliquam Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (52, 3627, 2, N'Ap #776-1188 Lacinia Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (53, 1211, 9, N'P.O. Box 176, 6926 Sit St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (54, 2516, 6, N'P.O. Box 424, 5650 Risus. Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (55, 2888, 18, N'991-9501 Cubilia St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (56, 1427, 9, N'Ap #237-5281 Lacus. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (57, 79, 19, N'820-2668 Venenatis Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (58, 3029, 3, N'Ap #334-2946 Convallis Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (59, 1331, 8, N'Ap #650-2984 Ipsum. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (60, 1942, 6, N'546-2910 Nunc Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (61, 289, 7, N'P.O. Box 263, 3258 Lacus. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (62, 283, 17, N'2518 Consectetuer St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (63, 3762, 16, N'P.O. Box 246, 4096 Lorem Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (64, 937, 13, N'6723 Vulputate, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (65, 1038, 18, N'P.O. Box 444, 4088 Dolor Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (66, 1071, 8, N'8543 Sem Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (67, 3337, 10, N'1716 Etiam Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (68, 917, 2, N'Ap #938-9426 Interdum. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (69, 1247, 13, N'507 Amet, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (70, 2187, 17, N'Ap #834-2861 Non, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (71, 1005, 11, N'Ap #260-451 Curabitur Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (72, 1644, 18, N'579-3852 Interdum St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (73, 3040, 11, N'6952 Lorem Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (74, 622, 19, N'6960 Donec Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (75, 2377, 10, N'286-1696 Volutpat. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (76, 2146, 14, N'935-2450 Ultrices Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (77, 1739, 17, N'529-9312 Per St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (78, 224, 9, N'8415 Aliquet Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (79, 3783, 1, N'4717 Pharetra. Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (80, 992, 11, N'P.O. Box 193, 373 At St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (81, 141, 19, N'P.O. Box 789, 5132 Enim Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (82, 3837, 9, N'Ap #811-5752 Ac St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (83, 586, 13, N'P.O. Box 555, 5887 Vitae Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (84, 2194, 10, N'P.O. Box 184, 8395 Sem St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (85, 2577, 13, N'Ap #421-1291 Nisi St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (86, 239, 8, N'7651 Eu Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (87, 4004, 17, N'8522 Mi. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (88, 3959, 3, N'1320 Eu Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (89, 3008, 18, N'453-406 Ultrices Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (90, 3710, 5, N'P.O. Box 734, 5575 Maecenas Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (91, 435, 17, N'Ap #838-271 Amet St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (92, 1685, 18, N'P.O. Box 985, 7598 Donec Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (93, 1882, 19, N'418-5369 Justo Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (94, 1129, 16, N'P.O. Box 289, 687 Cum Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (95, 3342, 19, N'2693 Ante Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (96, 3093, 8, N'6091 Faucibus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (97, 3552, 11, N'2643 In Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (98, 1770, 11, N'1011 Vel, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (99, 2264, 13, N'4131 Magna Rd.', NULL)
GO
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (100, 2395, 4, N'P.O. Box 299, 6781 Amet Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (101, 3727, 19, N'8635 Eros. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (102, 3107, 18, N'Ap #105-1953 Porttitor Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (103, 1534, 19, N'P.O. Box 442, 2234 In Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (104, 885, 9, N'867-2547 Fusce Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (105, 560, 9, N'762-4066 Tincidunt. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (106, 3244, 20, N'Ap #814-7174 Cras Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (107, 257, 10, N'P.O. Box 121, 3061 Augue Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (108, 679, 15, N'P.O. Box 565, 7415 Ipsum. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (109, 4007, 10, N'P.O. Box 261, 203 Nunc Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (110, 1523, 1, N'Ap #503-1963 Justo Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (111, 533, 4, N'399-4203 Adipiscing Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (112, 1458, 6, N'P.O. Box 801, 1654 In Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (113, 2272, 18, N'6611 Ac Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (114, 2105, 17, N'8166 Arcu. Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (115, 2881, 9, N'P.O. Box 936, 8523 Amet Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (116, 1581, 17, N'P.O. Box 248, 4393 Netus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (117, 2273, 2, N'P.O. Box 490, 2306 Amet Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (118, 1738, 14, N'Ap #669-6695 Mi. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (119, 1550, 3, N'P.O. Box 354, 5133 Metus Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (120, 1381, 6, N'7269 Tristique Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (121, 3265, 20, N'339-3871 Accumsan St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (122, 1099, 18, N'P.O. Box 343, 4495 In Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (123, 2148, 5, N'9090 Risus. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (124, 1620, 19, N'Ap #243-5933 A, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (125, 3175, 17, N'481-5456 Eu Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (126, 2030, 6, N'395 Ac St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (127, 2957, 6, N'4680 Diam Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (128, 3644, 4, N'Ap #869-3495 Dapibus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (129, 237, 5, N'721-2382 Felis. Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (130, 680, 12, N'Ap #835-5095 Eu Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (131, 2829, 19, N'2605 Tortor Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (132, 843, 7, N'Ap #535-3231 Commodo Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (133, 614, 5, N'137 Neque Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (134, 1180, 19, N'7305 Interdum. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (135, 566, 17, N'854-6010 Felis Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (136, 3338, 12, N'Ap #566-1071 Viverra. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (137, 1243, 9, N'P.O. Box 520, 3424 Sodales Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (138, 3344, 2, N'889-9855 Nec, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (139, 2727, 3, N'1023 Convallis Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (140, 30, 7, N'P.O. Box 350, 906 Nec Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (141, 2164, 16, N'P.O. Box 558, 5628 Urna, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (142, 3568, 11, N'P.O. Box 652, 9783 Enim, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (143, 470, 4, N'5126 Metus. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (144, 2735, 20, N'910-593 Tincidunt Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (145, 3329, 18, N'Ap #814-7717 Feugiat Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (146, 1230, 20, N'7358 Ipsum. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (147, 2600, 2, N'805-9734 Luctus St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (148, 260, 13, N'Ap #642-5628 Nisl Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (149, 776, 6, N'5615 Auctor Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (150, 3318, 16, N'P.O. Box 306, 2141 Enim. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (151, 2291, 1, N'1169 Magna Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (152, 3602, 5, N'P.O. Box 792, 226 Mollis. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (153, 1868, 6, N'815-173 Posuere Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (154, 101, 10, N'7383 Semper Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (155, 3340, 1, N'425-420 In, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (156, 2274, 19, N'Ap #164-8803 At Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (157, 2011, 11, N'P.O. Box 167, 8489 Fusce St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (158, 3121, 5, N'P.O. Box 240, 6645 Aliquam Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (159, 3605, 18, N'3671 Proin Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (160, 2819, 9, N'Ap #690-3043 Nisi Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (161, 3081, 5, N'4269 Donec St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (162, 3614, 9, N'189-8219 Aliquet, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (163, 2317, 19, N'Ap #566-2241 Praesent St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (164, 2348, 7, N'5955 Faucibus Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (165, 1030, 4, N'P.O. Box 882, 4703 Odio Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (166, 1105, 18, N'821-1955 Sapien St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (167, 2219, 6, N'Ap #343-9490 Nulla Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (168, 3344, 3, N'776-1113 Mus. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (169, 1970, 8, N'394-4359 Nunc St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (170, 2568, 12, N'423-3934 Ut St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (171, 2283, 19, N'524-7428 Fringilla, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (172, 3928, 16, N'Ap #452-7191 Tellus. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (173, 992, 15, N'Ap #647-5174 Leo, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (174, 3589, 8, N'Ap #556-7249 Urna. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (175, 739, 14, N'703-7330 Euismod Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (176, 3849, 17, N'455-6141 Fusce Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (177, 1946, 11, N'2361 Phasellus Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (178, 2994, 20, N'160-4550 Ac Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (179, 794, 19, N'Ap #813-2847 Semper Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (180, 1374, 2, N'8721 Dis Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (181, 1731, 1, N'Ap #307-9122 Imperdiet Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (182, 2325, 14, N'967-6004 Ante St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (183, 3476, 5, N'9176 Non, Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (184, 980, 11, N'9442 Nisl. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (185, 1415, 15, N'211-6977 A, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (186, 1129, 14, N'3846 Eu Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (187, 235, 2, N'7720 Arcu. Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (188, 3033, 5, N'883-1950 Eu Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (189, 2509, 19, N'P.O. Box 208, 9564 Arcu. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (190, 3428, 18, N'5805 Donec St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (191, 3293, 4, N'9631 Aliquam Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (192, 3377, 15, N'Ap #775-8075 Nisi St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (193, 2661, 4, N'2145 Neque Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (194, 3905, 9, N'Ap #527-9309 Nibh. Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (195, 2184, 8, N'Ap #422-2380 Sed, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (196, 745, 17, N'6154 Mollis St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (197, 2805, 12, N'8667 Eget Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (198, 1501, 17, N'Ap #609-6411 Et St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (199, 1274, 15, N'6784 Lorem, Ave', NULL)
GO
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (200, 2419, 2, N'8558 Lobortis Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (201, 2075, 7, N'P.O. Box 335, 4497 Cursus Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (202, 2383, 17, N'Ap #602-3838 Faucibus Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (203, 2880, 8, N'Ap #723-8478 Torquent Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (204, 1422, 16, N'P.O. Box 179, 1698 Amet Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (205, 615, 14, N'Ap #600-4995 Nunc Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (206, 3899, 13, N'P.O. Box 558, 9314 Donec Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (207, 3184, 18, N'302-6779 Luctus Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (208, 2858, 4, N'2628 Faucibus St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (209, 1821, 4, N'594-1426 Magna St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (210, 1127, 4, N'P.O. Box 491, 4291 Ante Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (211, 804, 2, N'Ap #942-7014 Odio St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (212, 368, 4, N'Ap #592-9407 Metus. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (213, 1963, 3, N'P.O. Box 265, 342 Elementum Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (214, 1250, 8, N'P.O. Box 411, 4817 Nam Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (215, 2857, 3, N'8045 Vel, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (216, 2277, 6, N'120-5031 Et, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (217, 2146, 17, N'Ap #270-3736 Ipsum. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (218, 2396, 10, N'984-9018 Non, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (219, 4026, 19, N'P.O. Box 705, 2196 Eros St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (220, 2482, 6, N'P.O. Box 408, 5691 Magna. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (221, 909, 5, N'469-468 Nibh. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (222, 3079, 20, N'Ap #875-1985 Penatibus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (223, 281, 7, N'Ap #903-351 Quam St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (224, 1658, 11, N'P.O. Box 544, 550 Ac St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (225, 2036, 8, N'275-3801 Aliquet Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (226, 3465, 20, N'P.O. Box 650, 3600 Orci St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (227, 3012, 11, N'2330 Sed Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (228, 893, 11, N'Ap #165-414 Mi Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (229, 2778, 10, N'P.O. Box 158, 8420 Sit Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (230, 2576, 1, N'Ap #365-7335 Nibh. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (231, 3356, 13, N'Ap #590-7452 Proin St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (232, 2454, 11, N'Ap #643-7280 Penatibus St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (233, 1030, 12, N'4741 Consequat, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (234, 3769, 9, N'Ap #162-4401 Molestie Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (235, 1390, 17, N'2499 Sed Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (236, 3729, 4, N'Ap #945-6370 Lacus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (237, 706, 12, N'3263 Eu Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (238, 3615, 2, N'Ap #200-422 Eget Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (239, 1914, 3, N'7554 Suscipit, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (240, 1695, 3, N'1805 Volutpat Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (241, 172, 8, N'6142 Commodo St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (242, 1480, 18, N'Ap #668-5649 Sed Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (243, 645, 9, N'Ap #838-4879 Tristique Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (244, 1230, 17, N'445-5400 Lacus Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (245, 3438, 2, N'P.O. Box 605, 1752 Dolor. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (246, 1350, 1, N'324-3290 Neque Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (247, 2079, 18, N'Ap #977-2891 Mi Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (248, 2885, 12, N'P.O. Box 362, 8651 Vitae Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (249, 382, 11, N'972-927 Tincidunt Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (250, 2037, 1, N'P.O. Box 933, 3491 Quam, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (251, 2745, 5, N'800-325 Donec Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (252, 2207, 18, N'P.O. Box 335, 2407 Nec Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (253, 2147, 19, N'P.O. Box 512, 7866 Sagittis St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (254, 2492, 5, N'767-7538 Mauris Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (255, 2105, 6, N'948-233 Maecenas Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (256, 701, 9, N'233-3015 Lacus. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (257, 2231, 16, N'Ap #230-8954 At Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (258, 656, 9, N'Ap #229-1497 Nec, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (259, 160, 9, N'Ap #954-4324 Nulla Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (260, 2911, 16, N'850-4569 Dolor St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (261, 1055, 3, N'825-4189 Vel Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (262, 3421, 1, N'571-6107 Ornare Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (263, 275, 16, N'6341 Curabitur Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (264, 1475, 4, N'952-1640 Elit Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (265, 2305, 3, N'856-7329 Fringilla Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (266, 2545, 4, N'P.O. Box 925, 3219 Nec Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (267, 1092, 19, N'2727 Cras Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (268, 1662, 19, N'P.O. Box 143, 3912 Semper Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (269, 311, 12, N'172-5315 Nulla Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (270, 2474, 7, N'5858 Amet Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (271, 1842, 13, N'Ap #749-119 Pharetra. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (272, 769, 9, N'Ap #319-3193 Sed Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (273, 1448, 3, N'P.O. Box 291, 8673 Ipsum Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (274, 1902, 1, N'288-6608 Odio St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (275, 4, 18, N'2438 Vitae, Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (276, 1184, 15, N'417-5733 Pellentesque Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (277, 555, 1, N'3300 Turpis St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (278, 319, 14, N'Ap #999-8466 Sapien. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (279, 2653, 20, N'P.O. Box 286, 3033 Dui Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (280, 2338, 20, N'4198 Ligula. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (281, 285, 6, N'701-6158 Eu St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (282, 3557, 1, N'4870 Est Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (283, 2295, 16, N'191 In Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (284, 2123, 13, N'P.O. Box 758, 906 Orci Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (285, 3489, 5, N'1841 Mauris Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (286, 3173, 9, N'5816 Arcu. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (287, 2387, 8, N'Ap #284-4103 Egestas. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (288, 414, 19, N'P.O. Box 607, 9073 Cursus Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (289, 4038, 20, N'7065 Donec Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (290, 463, 5, N'491 In St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (291, 2204, 1, N'483-8413 Cras Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (292, 1967, 18, N'568-1124 Turpis. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (293, 74, 10, N'6815 Sed St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (294, 365, 2, N'6174 Velit. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (295, 3190, 16, N'Ap #424-735 A Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (296, 962, 1, N'P.O. Box 450, 1854 Praesent Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (297, 1639, 20, N'P.O. Box 516, 3355 Vulputate Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (298, 2950, 3, N'7431 Ut Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (299, 36, 8, N'Ap #241-8552 Amet Av.', NULL)
GO
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (300, 2139, 4, N'P.O. Box 933, 9566 Libero. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (301, 803, 3, N'4117 Fermentum Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (302, 510, 7, N'228-1632 Tincidunt Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (303, 1430, 10, N'6963 Ullamcorper. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (304, 2236, 18, N'4033 Cubilia Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (305, 1201, 4, N'Ap #998-6027 Urna. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (306, 3999, 20, N'323 Sed St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (307, 3093, 5, N'Ap #121-7601 Amet Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (308, 2468, 11, N'187-6467 Sed Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (309, 3164, 10, N'249-2565 Ac Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (310, 2394, 17, N'7904 Mus. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (311, 2856, 4, N'Ap #877-8751 A, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (312, 1595, 4, N'Ap #444-9405 Risus Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (313, 2792, 13, N'P.O. Box 911, 5796 Nec, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (314, 1983, 14, N'P.O. Box 851, 3184 Urna Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (315, 3613, 20, N'Ap #781-825 Fermentum Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (316, 2823, 14, N'Ap #163-1805 Donec Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (317, 3140, 3, N'526-4250 Ut St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (318, 3400, 20, N'2685 Duis Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (319, 3699, 12, N'9760 Ac, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (320, 751, 14, N'P.O. Box 700, 6334 Lorem Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (321, 1282, 1, N'4018 Tellus. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (322, 404, 9, N'7429 Ultricies Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (323, 2611, 10, N'P.O. Box 580, 8610 Nec, Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (324, 3447, 12, N'Ap #871-6650 Luctus Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (325, 3826, 13, N'8689 Lobortis Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (326, 926, 8, N'944-6976 Auctor Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (327, 3682, 8, N'756-7575 Blandit Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (328, 2970, 16, N'471-5473 Vestibulum St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (329, 3936, 10, N'8513 Consequat Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (330, 3722, 17, N'Ap #382-2065 Donec St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (331, 3562, 7, N'P.O. Box 344, 4616 Eget Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (332, 2174, 17, N'1038 Et St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (333, 3853, 20, N'P.O. Box 974, 5362 Sapien. Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (334, 3029, 17, N'6387 Ultrices Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (335, 3992, 8, N'Ap #971-6149 Ornare St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (336, 705, 6, N'633-7900 Tristique Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (337, 1514, 18, N'1129 Eget, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (338, 555, 8, N'6675 Quisque Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (339, 3516, 15, N'296-3560 Fringilla St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (340, 2134, 4, N'997-9248 Tellus Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (341, 1442, 6, N'Ap #599-9012 Mauris Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (342, 3758, 5, N'6227 Lacinia. Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (343, 3089, 19, N'Ap #738-439 Imperdiet Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (344, 1981, 3, N'Ap #784-1010 Consequat Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (345, 1071, 12, N'5489 Eu Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (346, 1972, 3, N'Ap #553-3808 Sapien Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (347, 2417, 5, N'6535 Orci Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (348, 1451, 1, N'P.O. Box 520, 3984 Praesent Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (349, 3822, 14, N'P.O. Box 123, 658 Placerat, Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (350, 241, 18, N'Ap #608-480 Eget, St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (351, 2840, 11, N'9969 Sem Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (352, 4002, 3, N'616-4330 Erat Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (353, 2200, 6, N'P.O. Box 985, 4901 Dapibus Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (354, 2774, 7, N'P.O. Box 384, 5749 Dignissim St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (355, 3216, 14, N'P.O. Box 203, 6858 A, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (356, 360, 1, N'764-3689 Imperdiet, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (357, 1300, 16, N'2065 Mauris Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (358, 2080, 13, N'5677 Placerat Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (359, 2661, 12, N'890-7355 Aliquam, Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (360, 1484, 20, N'P.O. Box 602, 1288 Non Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (361, 2289, 16, N'3942 Penatibus Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (362, 2278, 15, N'Ap #239-1299 Vitae Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (363, 2469, 10, N'1289 Dis Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (364, 3374, 12, N'Ap #173-144 Tempus Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (365, 1839, 11, N'673-3483 Primis Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (366, 1391, 20, N'P.O. Box 148, 1197 Phasellus Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (367, 2252, 1, N'7765 Donec Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (368, 464, 3, N'2994 Consectetuer Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (369, 1123, 10, N'Ap #439-2271 Non, Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (370, 1414, 7, N'P.O. Box 161, 8851 Proin Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (371, 468, 13, N'Ap #574-548 Dolor Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (372, 1824, 17, N'254-4031 Cras Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (373, 2289, 6, N'Ap #467-8627 Ut Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (374, 3644, 20, N'3311 Ultricies Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (375, 334, 4, N'1441 Arcu Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (376, 3435, 6, N'Ap #675-1598 Quis Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (377, 2874, 1, N'2050 Arcu. Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (378, 1416, 11, N'Ap #500-9853 Erat. Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (379, 193, 17, N'Ap #635-7887 Vel Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (380, 3764, 15, N'P.O. Box 993, 9272 Vitae, Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (381, 1707, 5, N'1447 Imperdiet Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (382, 3693, 13, N'P.O. Box 327, 424 Ligula. Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (383, 2410, 9, N'P.O. Box 820, 6513 Ac Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (384, 3172, 7, N'483-412 Nunc Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (385, 2607, 15, N'Ap #206-588 Leo Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (386, 2733, 3, N'P.O. Box 324, 396 Eu Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (387, 1914, 11, N'Ap #143-5387 Diam St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (388, 2774, 6, N'P.O. Box 931, 7023 Nunc Road', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (389, 1731, 14, N'P.O. Box 278, 9957 Eros Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (390, 2071, 17, N'671-6571 Elit. Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (391, 2783, 18, N'9824 Semper St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (392, 1751, 6, N'Ap #258-877 Sollicitudin Street', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (393, 2007, 13, N'2905 Augue Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (394, 2520, 4, N'P.O. Box 263, 1982 Est Av.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (395, 2073, 6, N'Ap #603-467 Magna. Avenue', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (396, 2030, 3, N'Ap #333-5230 Consectetuer Ave', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (397, 1792, 9, N'5746 Convallis Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (398, 829, 16, N'6550 Enim. St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (399, 1763, 15, N'Ap #980-571 Ac Rd.', NULL)
GO
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (400, 3505, 5, N'P.O. Box 127, 6960 Magna St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (401, 2864, 17, N'617-9576 In St.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (402, 3776, 16, N'3978 Sed Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (403, 1137, 11, N'9442 Dolor Rd.', NULL)
INSERT [dbo].[Produits] ([IdProduit], [IdVille], [NbPlaces], [Adresse], [Description]) VALUES (404, 837, 4, N'P.O. Box 543, 528 Dolor Rd.', NULL)
SET IDENTITY_INSERT [dbo].[Produits] OFF

INSERT INTO Photos (IdProduit, Path)
VALUES
(1, 'photo11.jpg'), (1, 'photo12.jpg'), (2, 'photo21.jpg'), (2, 'photo22.jpg')

GO
SET ANSI_PADDING OFF
GO
--SET IDENTITY_INSERT [dbo].[Prix] ON 

INSERT INTO Prix([IdProduit],[DateDebut],[DateFin],[Montant]) VALUES(1,'09-16-15','07-16-16',777),(2,'10-27-15','01-03-16',780),(3,'09-14-15','07-09-16',892),(4,'09-27-15','01-12-16',165),(5,'09-27-15','05-17-16',48),(6,'09-15-15','05-17-16',552),(7,'09-25-15','08-24-16',684),(8,'08-28-15','02-21-16',142),(9,'10-10-15','06-25-16',334),(10,'09-05-15','06-05-16',169),(11,'10-19-15','04-05-16',77),(12,'09-15-15','04-17-16',343),(13,'09-27-15','03-29-16',833),(14,'10-24-15','12-18-15',250),(15,'09-26-15','01-11-16',809),(16,'10-03-15','05-03-16',314),(17,'09-08-15','04-21-16',813),(18,'10-01-15','06-30-16',256),(19,'10-12-15','08-14-16',164),(20,'10-04-15','02-09-16',133),(21,'10-27-15','08-08-16',361),(22,'09-03-15','08-14-16',894),(23,'10-09-15','04-23-16',232),(24,'10-12-15','11-25-15',253),(25,'09-09-15','03-12-16',308),(26,'09-19-15','12-13-15',289),(27,'10-05-15','11-15-15',956),(28,'09-07-15','02-14-16',250),(29,'10-05-15','01-23-16',489),(30,'10-23-15','01-16-16',40),(31,'08-28-15','03-02-16',556),(32,'09-08-15','08-17-16',850),(33,'10-01-15','06-17-16',258),(34,'10-21-15','12-30-15',910),(35,'10-23-15','05-13-16',56),(36,'10-24-15','11-05-15',964),(37,'10-03-15','05-30-16',986),(38,'10-17-15','06-29-16',44),(39,'09-22-15','04-17-16',647),(40,'09-14-15','04-06-16',200),(41,'10-06-15','08-24-16',416),(42,'10-26-15','08-01-16',471),(43,'08-31-15','06-12-16',538),(44,'10-07-15','03-21-16',354),(45,'10-16-15','03-22-16',322),(46,'10-17-15','12-28-15',831),(47,'10-06-15','08-14-16',368),(48,'09-22-15','10-31-15',113),(49,'08-31-15','03-09-16',715),(50,'09-08-15','03-23-16',298),(51,'08-31-15','02-02-16',680),(52,'10-17-15','07-18-16',116),(53,'10-07-15','11-12-15',636),(54,'09-26-15','12-08-15',670),(55,'09-17-15','07-28-16',848),(56,'10-05-15','04-11-16',970),(57,'09-30-15','02-26-16',326),(58,'10-02-15','06-18-16',847),(59,'09-29-15','06-07-16',387),(60,'10-15-15','04-23-16',866),(61,'09-03-15','06-24-16',412),(62,'10-25-15','11-04-15',327),(63,'08-28-15','12-22-15',124),(64,'08-31-15','08-06-16',948),(65,'10-29-15','08-12-16',630),(66,'09-11-15','07-13-16',457),(67,'10-08-15','11-24-15',87),(68,'10-01-15','07-20-16',706),(69,'10-21-15','11-05-15',921),(70,'10-02-15','07-02-16',749),(71,'10-06-15','11-15-15',941),(72,'09-20-15','03-10-16',728),(73,'10-11-15','07-20-16',171),(74,'10-02-15','03-03-16',469),(75,'09-03-15','11-27-15',394),(76,'10-04-15','08-15-16',377),(77,'10-11-15','02-03-16',4),(78,'10-20-15','08-02-16',829),(79,'09-17-15','06-09-16',835),(80,'08-29-15','07-09-16',214),(81,'09-24-15','11-15-15',656),(82,'10-29-15','02-09-16',370),(83,'10-28-15','02-16-16',554),(84,'09-25-15','03-28-16',244),(85,'09-15-15','12-17-15',677),(86,'09-10-15','04-21-16',183),(87,'08-29-15','06-12-16',212),(88,'10-15-15','05-09-16',85),(89,'09-23-15','05-04-16',85),(90,'09-05-15','02-03-16',726),(91,'09-19-15','04-09-16',608),(92,'10-11-15','08-24-16',235),(93,'10-12-15','05-27-16',55),(94,'10-14-15','12-08-15',617),(95,'08-28-15','12-18-15',731),(96,'10-29-15','04-20-16',131),(97,'10-15-15','08-13-16',545),(98,'09-19-15','08-01-16',70),(99,'10-23-15','01-26-16',302),(100,'10-05-15','05-20-16',568);


--SET IDENTITY_INSERT [dbo].[Prix] OFF



SET IDENTITY_INSERT [dbo].[Identites] ON 

-- INSERT [dbo].[Identites] ([IdIdentite], [Nom], [Prenom], [Identifiant], [Password], [Email]) 

SET IDENTITY_INSERT [dbo].[Identites] OFF
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([IdAdresse], [Ligne1], [Ligne2], [CodePostal], [Ville]) VALUES (1, N'2 rue tralala', NULL, N'75012', N'Paris')
SET IDENTITY_INSERT [dbo].[Adresses] OFF


INSERT INTO ProduitTracking([DatePT],[IdProduit]) VALUES('06-28-15',315),('07-12-15',244),('08-12-15',326),('08-08-15',230),('08-27-15',218),('07-01-15',259),('07-09-15',72),('06-29-15',87),('08-24-15',13),('06-21-15',356),('07-27-15',229),('08-25-15',33),('07-07-15',177),('06-20-15',97),('06-23-15',168),('07-30-15',170),('07-25-15',73),('07-18-15',11),('08-23-15',10),('08-23-15',68),('07-03-15',321),('08-18-15',328),('06-19-15',63),('07-20-15',252),('07-26-15',275),('08-07-15',305),('08-08-15',39),('07-02-15',25),('07-04-15',208),('07-07-15',311),('07-31-15',326),('08-06-15',21),('08-25-15',390),('07-03-15',18),('08-01-15',354),('07-10-15',73),('06-16-15',400),('07-20-15',192),('08-16-15',292),('08-08-15',23),('08-17-15',277),('06-23-15',333),('06-24-15',243),('06-20-15',346),('07-27-15',317),('08-12-15',361),('08-12-15',14),('07-26-15',349),('06-20-15',171),('08-01-15',372),('07-22-15',47),('07-06-15',252),('06-28-15',69),('08-19-15',348),('06-30-15',220),('08-07-15',98),('07-30-15',2),('08-08-15',32),('07-15-15',395),('08-07-15',257),('08-11-15',359),('06-30-15',319),('06-30-15',194),('07-19-15',356),('07-11-15',388),('06-23-15',21),('06-20-15',164),('07-19-15',201),('07-18-15',346),('07-10-15',161),('07-19-15',384),('07-09-15',253),('07-13-15',97),('08-21-15',79),('07-12-15',77),('06-16-15',394),('07-09-15',21),('06-30-15',276),('06-24-15',245),('07-22-15',263),('06-19-15',137),('07-07-15',51),('08-26-15',299),('07-30-15',378),('08-07-15',329),('07-01-15',402),('07-28-15',371),('07-23-15',21),('07-25-15',29),('08-15-15',390),('08-02-15',280),('07-26-15',276),('08-07-15',91),('08-25-15',31),('08-10-15',242),('06-18-15',52),('07-30-15',124),('06-20-15',371),('07-26-15',312),('07-22-15',312);

INSERT INTO Promos([IdProduit],[Promo],[DateDeb],[DateFin]) VALUES(1,5,'09-29-15','01-27-16'),(2,10,'09-26-15','01-07-16'),(3,15,'09-30-15','08-22-16'),(4,20,'09-21-15','11-12-15'),(5,25,'10-29-15','03-26-16'),(6,30,'09-02-15','03-12-16'),(7,35,'10-09-15','11-24-15'),(8,40,'10-10-15','11-12-15'),(9,45,'09-18-15','12-01-15'),(10,50,'10-11-15','03-29-16'),(11,5,'10-22-15','12-05-15'),(12,10,'10-21-15','03-13-16'),(13,15,'10-28-15','08-03-16'),(14,20,'10-08-15','11-17-15'),(15,25,'09-26-15','07-30-16'),(16,30,'10-07-15','12-28-15'),(17,35,'09-04-15','03-25-16'),(18,40,'09-09-15','03-29-16'),(19,45,'10-06-15','11-15-15'),(20,50,'09-07-15','02-28-16'),(21,5,'10-11-15','05-13-16'),(22,10,'10-05-15','01-05-16'),(23,15,'09-17-15','08-24-16'),(24,20,'09-19-15','01-10-16'),(25,25,'08-30-15','11-02-15'),(26,30,'09-30-15','01-13-16'),(27,35,'09-17-15','06-28-16'),(28,40,'09-10-15','11-19-15'),(29,45,'10-01-15','12-13-15'),(30,50,'09-15-15','02-04-16'),(31,5,'10-05-15','08-16-16'),(32,10,'09-01-15','01-08-16'),(33,15,'10-27-15','12-05-15'),(34,20,'09-20-15','08-05-16'),(35,25,'09-13-15','12-22-15'),(36,30,'10-26-15','08-24-16'),(37,35,'09-02-15','04-24-16'),(38,40,'09-25-15','03-01-16'),(39,45,'09-23-15','11-27-15'),(40,50,'09-12-15','02-04-16'),(41,5,'10-07-15','04-08-16'),(42,10,'10-28-15','07-17-16'),(43,15,'09-05-15','01-10-16'),(44,20,'08-31-15','05-01-16'),(45,25,'08-28-15','07-04-16'),(46,30,'10-01-15','03-21-16'),(47,35,'09-26-15','07-17-16'),(48,40,'09-25-15','12-24-15'),(49,45,'09-27-15','02-20-16'),(50,50,'09-06-15','05-01-16'),(51,5,'09-06-15','07-20-16'),(52,10,'09-12-15','06-21-16'),(53,15,'09-27-15','11-29-15'),(54,20,'10-01-15','08-06-16'),(55,25,'10-03-15','12-31-15'),(56,30,'10-23-15','01-12-16'),(57,35,'09-04-15','11-27-15'),(58,40,'09-05-15','07-17-16'),(59,45,'09-10-15','08-24-16'),(60,50,'08-28-15','08-25-16'),(61,5,'09-01-15','01-25-16'),(62,10,'09-13-15','03-17-16'),(63,15,'10-21-15','02-09-16'),(64,20,'09-15-15','12-19-15'),(65,25,'09-25-15','01-05-16'),(66,30,'09-19-15','04-13-16'),(67,35,'10-13-15','04-07-16'),(68,40,'08-28-15','07-29-16'),(69,45,'09-23-15','07-02-16'),(70,50,'10-23-15','01-14-16'),(71,5,'09-05-15','01-23-16'),(72,10,'10-26-15','11-22-15'),(73,15,'10-05-15','03-16-16'),(74,20,'09-24-15','03-14-16'),(75,25,'09-17-15','03-24-16'),(76,30,'10-29-15','06-29-16'),(77,35,'09-17-15','06-05-16'),(78,40,'09-29-15','11-25-15'),(79,45,'10-28-15','06-17-16'),(80,50,'09-07-15','01-06-16'),(81,5,'09-21-15','05-05-16'),(82,10,'10-09-15','04-09-16'),(83,15,'10-25-15','02-23-16'),(84,20,'10-19-15','07-19-16'),(85,25,'10-21-15','01-25-16'),(86,30,'09-11-15','03-13-16'),(87,35,'10-05-15','03-15-16'),(88,40,'09-04-15','01-12-16'),(89,45,'09-10-15','06-03-16'),(90,50,'10-12-15','01-08-16'),(91,5,'09-16-15','05-21-16'),(92,10,'09-29-15','07-22-16'),(93,15,'10-13-15','04-22-16'),(94,20,'10-17-15','12-10-15'),(95,25,'10-29-15','02-24-16'),(96,30,'10-12-15','03-13-16'),(97,35,'08-30-15','05-06-16'),(98,40,'10-08-15','03-17-16'),(99,45,'09-13-15','05-18-16'),(100,50,'10-18-15','12-05-15');
