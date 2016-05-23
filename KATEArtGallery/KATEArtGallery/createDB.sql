CREATE TABLE [dbo].[Agent] (
    [AgentId]   SMALLINT     IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (25) NULL,
    [LastName]  VARCHAR (35) NULL,
    [Location]  VARCHAR (40) NULL,
    [Address]   VARCHAR (80) NULL,
    [PhoneNumber] NCHAR (10) NULL,
    [Active]    BIT          NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED ([AgentId] ASC)
);

CREATE TABLE [dbo].[Artist] (
    [ArtistId]  SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (65) NULL,
    [BirthYear] DATE     NULL,
    [DeathYear] DATE     NULL,
    CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);

CREATE TABLE [dbo].[Artwork] (
    [ArtworkId]           SMALLINT     IDENTITY (1, 1) NOT NULL,
    [ArtistId]            SMALLINT     NOT NULL,
    [Title]               VARCHAR (50) NULL,
	[Category]            VARCHAR (50) NULL,
    [YearOriginalCreated] SMALLINT     NULL,
    [Medium]              VARCHAR (60) NULL,
    [Dimensions]          VARCHAR (30) NULL,
    [NumberMade]          SMALLINT     NULL,
    [NumberInInventory]   SMALLINT     NULL,
    [NumberSold]          SMALLINT     NULL,
    CONSTRAINT [PK_Artwork] PRIMARY KEY CLUSTERED ([ArtworkId] ASC)
);

CREATE TABLE [dbo].[ArtShow] (
    [ArtShowId]    SMALLINT     IDENTITY (1, 1) NOT NULL,
    [ArtworkId]    SMALLINT     NOT NULL,
    [ShowLocation] VARCHAR (40) NULL,
    [Agents]       VARCHAR(30)  NULL,
    [Overhead]     BIT          NULL,
    CONSTRAINT [FK_ArtShow] FOREIGN KEY ([ArtworkId]) REFERENCES [dbo].[Artwork] ([ArtworkId])
);

CREATE TABLE [dbo].[Customer] (
    [CustomerId] SMALLINT     IDENTITY (1, 1) NOT NULL,
    [AgentId]    SMALLINT     NOT NULL,
    [FirstName]  VARCHAR (50) NULL,
    [LastName]   VARCHAR (50) NULL,
    [PhoneNumber] NCHAR (10) NULL,
	[Address]    VARCHAR (80) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [FK_Customer] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[Agent] ([AgentId])
);

CREATE TABLE [dbo].[IndividualPiece] (
  [IndividualPieceId] SMALLINT IDENTITY (1, 1) NOT NULL,
  [ArtWorkId] SMALLINT NOT NULL,
  [Image] IMAGE NULL,
  [DateCreated] DATE NULL,
  [Cost] DECIMAL(18,2) NULL,
  [Price] DECIMAL(18,2) NULL,
  [Sold] SMALLINT NULL,
  [Location] VARCHAR(40) NULL,
  [EditionNumber] SMALLINT NULL,
  PRIMARY KEY CLUSTERED (IndividualPieceId ASC)
);

CREATE TABLE [dbo].[Invoice] (
  [InvoiceId] SMALLINT NOT NULL,
  [CustomerId] SMALLINT NOT NULL,
  [AgentId] SMALLINT NOT NULL,
  [PaymentMethod] VARCHAR(30) NULL,
  [ShippingAddress] VARCHAR(100) NULL,
  [PieceSold] VARCHAR(50) NULL,
  [Price] DECIMAL(18,2) NULL,
  CONSTRAINT PK_Invoice PRIMARY KEY CLUSTERED (CustomerId ASC),
  CONSTRAINT FK_Invoice1 FOREIGN KEY (AgentId) REFERENCES Agent (AgentId)
);

--Artist Table Data
SET IDENTITY_INSERT [dbo].[Artist] ON
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (1, N'Alex Andreev', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (2, N'Andrea Epstein', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (3, N'Anthony Christopher', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (4, N'Art Grafts', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (5, N'Autumn Rose', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (6, N'Beat Hauser', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (7, N'Brian Harig', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (8, N'Chelsea Beery', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (9, N'Clemence Dubois', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (10, N'David Ballinger', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (11, N'David Rickert', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (12, N'Doug Lawler', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (13, N'Drew McSherry', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (14, N'Elizabeth Elkin', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (15, N'Freja Erixan', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (16, N'Heather Patterson', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (17, N'James Rees', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (18, N'Jennifer Ross', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (19, N'Jessica JH Roller', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (20, N'Jonathan Cole', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (21, N'Karin Bruckner', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (22, N'Kristine Mays', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (23, N'Lanie Widmar', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (24, N'Laura Kaardal', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (25, N'Lynn Pollard', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (26, N'Matthew Dibble', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (27, N'Melanie Duault', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (28, N'Nanci Erskine', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (29, N'Nancy Graham', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (30, N'Nancy Muren', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (31, N'Naoko Paluszk', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (32, N'Orlando Dominguez', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (33, N'Sandi Miot', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (34, N'Stephan Venekas', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (35, N'Suren Nersisyan', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (36, N'Susa Dosa', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (37, N'Susan Boyle', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (38, N'Teri Muse', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (39, N'Tom Miller', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (40, N'Tomo Mori', NULL, NULL)
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (41, N'Yelitza Diaz', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Artist] OFF

--Agent Table Data
SET IDENTITY_INSERT [dbo].[Agent] ON
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (1, N'Penguin', NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (2, N'The', N'Joker', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (3, N'Batroc', NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (4, N'Golden', N'Eagle', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (5, N'Sinestro', NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (6, N'Sandman', NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Agent] ([AgentId], [FirstName], [LastName], [Location], [Address], [PhoneNumber], [Active]) VALUES (7, N'Bizarro', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Agent] OFF


