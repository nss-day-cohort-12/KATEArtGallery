CREATE TABLE [dbo].[Agent] (
    [AgentId]   SMALLINT     IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (25) NULL,
    [LastName]  VARCHAR (35) NULL,
    [Location]  VARCHAR (40) NULL,
    [Address]   VARCHAR (80) NULL,
    [PhoneNumber] VARCHAR (20) NULL,
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
    [Title]               VARCHAR (100) NULL,
	[Category]            VARCHAR (50) NULL,
    [YearOriginalCreated] SMALLINT     NULL,
    [Medium]              VARCHAR (60) NULL,
    [Dimensions]          VARCHAR (30) NULL,
    [NumberMade]          VARCHAR (15) NULL,
    [NumberInInventory]   SMALLINT     NULL,
    [NumberSold]          SMALLINT     NULL,
    CONSTRAINT [PK_Artwork] PRIMARY KEY CLUSTERED ([ArtworkId] ASC),
	CONSTRAINT [FK_Artwork_Artist] FOREIGN KEY ([ArtistId]) REFERENCES [Artist]([ArtistId])
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
    [PhoneNumber] VARCHAR (20)  NULL,
	[Address]    VARCHAR (100) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [FK_Customer] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[Agent] ([AgentId])
);

CREATE TABLE [dbo].[IndividualPiece] (
  [IndividualPieceId] SMALLINT   IDENTITY (1, 1) NOT NULL,
  [ArtWorkId] SMALLINT NOT NULL,
  [Image] VARCHAR(100) NULL,
  [DateCreated] SMALLINT NULL,
  [Cost] DECIMAL(18,2) NULL,
  [Price] DECIMAL(18,2) NULL,
  [Sold] SMALLINT NULL,
  [Location] VARCHAR(10) NULL,
  PRIMARY KEY CLUSTERED (IndividualPieceId ASC),
  CONSTRAINT [FK_IndividualPiece_Artwork] FOREIGN KEY ([ArtworkId]) REFERENCES [dbo].[Artwork]([ArtworkId])
);

CREATE TABLE [dbo].[Invoice] (
    [InvoiceId]       SMALLINT        IDENTITY (1, 1) NOT NULL,
    [CustomerId]      SMALLINT        NOT NULL,
    [AgentId]         SMALLINT        NOT NULL,
    [PaymentMethod]   VARCHAR (25)    NULL,
    [ShippingAddress] VARCHAR (100)   NULL,
    [PieceSold]       VARCHAR (75)    NULL,
    [Price]           DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([InvoiceId] ASC), 
    CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId]), 
    CONSTRAINT [FK_Invoice_Agent] FOREIGN KEY ([AgentId]) REFERENCES [Agent]([AgentId]) 
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
INSERT INTO [dbo].[Artist] ([ArtistId], [Name], [BirthYear], [DeathYear]) VALUES (42, N'Lucinda Shmulsky', NULL, NULL)
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

--Artwork Table Data
SET IDENTITY_INSERT [dbo].[Artwork] ON
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (1, 1, N'Pilots', N'Digital Print', 2015, N'Digital Print on unstretched canvas', N'28"h x 46"w', N'50', 4, 2)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (2, 1, N'Vesper', N'Digital Print', 2015, N'Digital Print on unstretched canvas', N'37"x28"', N'50', 3, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (3, 1, N'Under the Rain', N'Digital Print', 2010, N'Digital Print on unstretched canvas', N'26.3"x19.7"', N'50', 4, 3)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (4, 2, N'Mountian Dance', N'Print', 2015, N'Printmakeing on paper', N'26"x40"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (5, 3, N'Nightmare Squid', N'Drawing', 2015, N'Ink artwork on Paper', N'12"x9"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (6, 4, N'Disneyland', N'Digital Print', 2015, N'Digital Printmaking on metal', N'40"x40"', N'4', 2, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (7, 4, N'Fish Can''t', N'Digital Print', 2011, N'Digital Printmaking on metal', N'34"x48"x25"', N'4', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (8, 5, N'Watermelon Outlook', N'Mixed Media', 2015, N'Mixed media artwork on stretched canvas', N'12"x16"x1"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (9, 6, N'Mute Piano', N'Photography', 2011, N'Fine Art Print', N'10"x15"', N'Open', 11, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (10, 7, N'Phantom Island Sunset - Crater Lake National Park Oregon', N'Photography', 2012, N'Fine Art Print', N'10"x15"', N'Open', 3, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (11, 8, N'Red Ram', N'Photography', 2012, N'Fine Art Print', N'16'' x 24"', N'Open', 5, 3)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (12, 9, N'The Ladies Room', N'Oil Painting', 2016, N'Oil painting on stretched canvas', N'20"x24"x8"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (13, 10, N'Heagon-Greyscale', N'Other Media', 2013, N'Papercut Artwork', N'16"x22"x1"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (14, 11, N'Path to the Lake', N'Oil Painting', 2015, N'Oil painting on canvas board', N'11"x14"x25"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (15, 12, N'Big Dog', N'Print', 2004, N'Printmakeing on paper', N'12"x4"', N'75', 5, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (16, 12, N'The Peacock', N'Drawing', 2015, N'Pastel on wood', N'26"x24"x2"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (17, 13, N'The Amputee', N'Drawing', 2015, N'Charcoal drawing on paper', N'25"h x 19"w', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (18, 13, N'Death''s Head', N'Drawing', 2015, N'Charcoal drawing on paper', N'25"h x 19"w', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (19, 14, N'Bruges Street View', N'Oil Painting', 2014, N'Oil painting on stretched canvas', N'24"x18"x1.5"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (20, 15, N'Birds', N'Digital Print', 2015, N'Digital Printmaking on paper', N'20"x28"x1"', N'Open', 3, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (21, 16, N'Luz', N'Sculpture', 2014, N'Sculpture on Wood', N'23.5" x 16"x 3"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (22, 17, N'Vessel #2', N'Print', 2015, N'Printmakeing on paper', N'33"x22"x25"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (23, 17, N'Planted Seed', N'Print', 2015, N'Printmakeing on paper', N'22"x30"x25"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (24, 18, N'Hope is a Thing With Feathers', N'Acrylic Painting', 2016, N'Acrylic painting on stretched canvas', N'12"x12"x1.5"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (25, 19, N'Dalmation on Red', N'Acrylic Painting', 2015, N'Acrylic painting on stretched canvas', N'20"x20"x1.5"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (26, 20, N'Hanuman', N'Drawing', 2013, N'Pastel artwork on paper', N'59.5"x42''"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (27, 21, N'IsItABird?', N'Print', 2013, N'Printmakeing on paper', N'22.5"x22.5"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (28, 22, N'Heart of Gold', N'Sculpture', 2013, N'Sculpture on Metal', N'19"x19"x12"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (29, 23, N'Tumacacori Mission', N'Watercolor', 2015, N'Watercolor Painting on Paper', N'16"x20"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (30, 24, N'La Rosace, Paris', N'Drawing', 2014, N'Colored Pencil on paper', N'10"x8"x4"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (31, 42, N'Bootleg', N'Sculpture', 2016, N'Sculpture on Wood', N'33"x31"21"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (32, 25, N'Indigo 4897', N'Other Media', 2013, N'Other Meida on Paper', N'22" x 30" x 1"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (33, 26, N'Misters Teeth Chattered', N'Drawing', 2013, N'Ink artwork on Paper', N'12.5" x 15"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (34, 27, N'Lost My Head 3/6', N'Photography', 2014, N'Fine Art Print', N'10"x15"', N'Open', 9, 6)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (35, 28, N'Winter Field II', N'Oil Painting', 2015, N'Oil painting on stretched canvas', N'18"x18"x1.3"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (36, 29, N'My Daisies', N'Watercolor', 2014, N'Watercolor Painting on Paper', N'15"x20"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (37, 30, N'Layers of Landscape', N'Watercolor', 2015, N'Watercolor Painting on Paper', N'15"x23"x3"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (38, 31, N'Who Are These Angels XCI ', N'Painting', 2016, N'Oil painting on stretched canvas', N'18" h x 18" w x 1.5" d', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (39, 32, N'Tittibhasana(Firefly Pose)', N'Sculpture', 2009, N'Suplture on Metal', N'11.5"x10"x10"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (40, 33, N'Enigma', N'Other Media', 2015, N'Encaustic Artwork on Wook', N'6" x 6" x 1.5"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (41, 33, N'What Lies Beneath VI', N'Other Media', 2016, N'Encaustic Artwork on Wook', N'6"h x 6"w x 2"d', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (42, 34, N'Red', N'Digital Print', 2014, N'Digital Printmaking on metal', N'32"x32"1.4"', N'5', 2, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (43, 35, N'Under Palm Trees (Ultramarine Blue Shades)', N'Watercolor', 2016, N'Watercolor Painting on Paper', N'18"x24"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (44, 36, N'Portrait in Green', N'Photography', 2015, N'Fine Art Print', N'12"x18"', N'Open', 17, 4)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (45, 37, N'Love Songs', N'Mixed Media', 2016, N'Mixed Media artwork on paper', N'18"x20.5"', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (46, 38, N'Yellow Field with Mese', N'Other Media', 2015, N'Encaustic Artwork on Wook', N'42"h 48"w x 1.5"d', N'1', 0, 1)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (47, 39, N'Airmail', N'Acrylic Painting', 2016, N'Acrylic painting on paper', N'12"x16"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (48, 40, N'Memory Ring (mini)', N'Mixed Media', 2015, N'Mixed media artwork on canvas board', N'14"x11"x1"', N'1', 1, 0)
INSERT INTO [dbo].[Artwork] ([ArtworkId], [ArtistId], [Title], [Category], [YearOriginalCreated], [Medium], [Dimensions], [NumberMade], [NumberInInventory], [NumberSold]) VALUES (49, 41, N'U-35 Window Love I', N'Sculpture', 2016, N'Sculpture on Ceramic', N'10"x8"x4"', N'1', 1, 0)
SET IDENTITY_INSERT [dbo].[Artwork] OFF

--Customer Table Data
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (1, 1, N'Barbara', N'Gordon', N'555-555-1234', N'Apt. 3, Gotham City')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (2, 1, N'Bruce', N'Wayne', N'228-555-2281', N'Wayne Manner, Gotham City')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (3, 4, N'Carter', N'Hall', N'429-555-5626', N'4522 S. 9th St, Hall, VA')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (4, 7, N'Clark', N'Kent', N'787-555-6762', N'22 Super St, Metropolis, MN')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (5, 2, N'Dick', N'Grayson', N'228-555-2281', N'Wayne Manner, Gotham City')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (6, 5, N'Hal', N'Jordan', N'473-555-3652', N'1098 Out of this world')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (7, 6, N'Peter', N'Parker', N'774-555-3377', N'5521 N. Spider Ln, Forest Hills, NY')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (8, 4, N'Ray', N'Palmer', N'843-555-2866', N'33 Small Ave, Starling City')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (9, 1, N'Selina', N'Kyle', N'228-555-2288', N'123 Hiddout St, Gotham City')
INSERT INTO [dbo].[Customer] ([CustomerId], [AgentId], [FirstName], [LastName], [PhoneNumber], [Address]) VALUES (10, 3, N'Steven', N'Rogers', N'227-555-6263', N'Lower East Side Manhattan, New York City, NY')
SET IDENTITY_INSERT [dbo].[Customer] OFF

--Invoice Table Data
SET IDENTITY_INSERT [dbo].[Invoice] ON
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (1, 1, 1, N'Credit Card', N'Apt. 3, Gotham City', N'Red Ram, Big Dog', CAST(550.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (2, 2, 1, N'Cash', N'Wayne Manner, Gotham City', N'Yellow Field with Mese', CAST(1779.75 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (3, 6, 2, N'Cash', N'Wayne Manner, Gotham City', N'Heart of Gold, Pilots', CAST(1237.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (4, 10, 3, N'Credit Card', N'Lower East Side Manhattan, New York City, NY', N'Red Ram', CAST(141.75 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (5, 9, 1, N'PayPal', N'123 Hiddout St, Gotham City', N'Vesper, La Rosace Paris', CAST(1800.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (6, 4, 4, N'Check', N'4522 S. 9th St, Hall, VA', N'Under the Rain', CAST(1550.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (7, 6, 5, N'Cash', N'1098 Out of this world', N'Pilots ', CAST(1500.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (8, 7, 6, N'PayPal', N'5521 N. Spider Ln, Forest Hills, NY', N'Under the Rain', CAST(1550.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (9, 4, 7, N'Check', N'22 Super St, Metropolis, MN', N'Pilots , Under the Rain, Winter Field II', CAST(3825.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (10, 8, 4, N'Credit Card', N'33 Small Ave, Starling City', N'Watermelon Outlook', CAST(350.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (11, 2, 1, N'Cash', N'Wayne Manner, Gotham City', N'Potrait in Green', CAST(126.00 AS Decimal(18, 2)))
INSERT INTO [dbo].[Invoice] ([InvoiceId], [CustomerId], [AgentId], [PaymentMethod], [ShippingAddress], [PieceSold], [Price]) VALUES (12, 6, 5, N'PayPal', N'1098 Out of this world', N'Misters Teeth Chattered', CAST(600.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Invoice] OFF

--IndividualPiece Table Data
SET IDENTITY_INSERT [dbo].[IndividualPiece] ON
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (1, 1, N'https://cdn1.artstation.com/p/assets/images/images/001/622/077/large/alex-andreev-pilots-1200.jpg?1449657939', 2015, CAST(945.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 2, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (2, 2, N'http://www.alexandreev.com/sites/default/files/styles/work_portrait/public/artworks/Vesper.jpg?itok=xkVaQrcH', 2015, CAST(945.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 1, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (3, 3, N'http://static.ugallery.com/webdata/Product/28729/Images/Large_Under_the_rain.jpg', 2010, CAST(976.50 AS Decimal(18, 2)), CAST(1550.00 AS Decimal(18, 2)), 3, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (4, 4, N'http://static.ugallery.com/webdata/Product/38259/Images/Large_Mountain_Dance.jpg', 2015, CAST(425.25 AS Decimal(18, 2)), CAST(675.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (5, 5, N'https://s-media-cache-ak0.pinimg.com/736x/e0/74/38/e07438ffa3db2fd3730efd020a89b84d.jpg', 2015, CAST(346.50 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 0, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (6, 6, N'https://s-media-cache-ak0.pinimg.com/736x/dc/70/fb/dc70fbaaef98a4fee4b8fd68109d129b.jpg', 2015, CAST(1165.50 AS Decimal(18, 2)), CAST(1850.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (7, 7, N'http://product-images.highwire.com/7487644/cant02.jpg', 2011, CAST(1039.50 AS Decimal(18, 2)), CAST(1650.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (8, 8, N'http://ecx.images-amazon.com/images/I/91T6TssKyWL._SY500_.jpg', 2015, CAST(220.50 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (9, 9, N'https://s-media-cache-ak0.pinimg.com/736x/c1/6a/29/c16a29e76b9943f54e41ceaa056110e7.jpg', 2011, CAST(78.75 AS Decimal(18, 2)), CAST(125.00 AS Decimal(18, 2)), 1, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (10, 10, N'http://static.ugallery.com/webdata/Product/43860/Images/Large_craterlakephantomshipislandsunset.jpg', 2012, CAST(78.75 AS Decimal(18, 2)), CAST(125.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (11, 11, N'http://www.ugallery.com/webdata/Product/42754/images/list_Coastal_Plain_40x40_Ugallery.jpg', 2012, CAST(141.75 AS Decimal(18, 2)), CAST(225.00 AS Decimal(18, 2)), 3, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (12, 12, N'http://static.ugallery.com/webdata/Product/45408/Images/Large_iii.jpg', 2016, CAST(645.75 AS Decimal(18, 2)), CAST(1025.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (13, 13, N'https://s-media-cache-ak0.pinimg.com/736x/13/23/53/132353ad96510acd0906f0dbe09fb9b9.jpg', 2013, CAST(1055.25 AS Decimal(18, 2)), CAST(1675.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (14, 14, N'http://static.ugallery.com/webdata/Product/43295/Images/Large_pathtothelakeupdate.jpg', 2015, CAST(378.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (15, 15, N'http://st.hzcdn.com/simgs/13f107ce0164ddc1_4-4868/contemporary-artwork.jpg', 2004, CAST(173.25 AS Decimal(18, 2)), CAST(275.00 AS Decimal(18, 2)), 1, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (16, 16, N'http://static.ugallery.com/webdata/Product/42831/Images/Large_peacock.jpg', 2015, CAST(1008.00 AS Decimal(18, 2)), CAST(1600.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (17, 17, N'http://static.ugallery.com/webdata/Product/41772/Images/Large_The_Amputee.jpg', 2015, CAST(315.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (18, 18, N'http://static.ugallery.com/webdata/Product/40336/Images/Large_deaths_head_(full).jpg', 2015, CAST(252.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (19, 19, N'http://static.ugallery.com/webdata/Product/45755/Images/Large_bruges.jpg', 2014, CAST(929.25 AS Decimal(18, 2)), CAST(1475.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (20, 20, N'https://s-media-cache-ak0.pinimg.com/236x/67/fa/29/67fa297005e0dc8e620ef161289acc7a.jpg', 2015, CAST(315.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (21, 21, N'http://www.ugallery.com/webdata/product/30689/view3/large_patterson_heather_luz_detail3.jpg', 2014, CAST(551.25 AS Decimal(18, 2)), CAST(875.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (22, 22, N'http://www.ugallery.com/webdata/Product/39734/Images/Large_vessel2_rees.jpg', 2015, CAST(677.25 AS Decimal(18, 2)), CAST(1075.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (23, 23, N'http://static.ugallery.com/webdata/Product/39731/Images/Large_plantedseed_rees.jpg', 2015, CAST(661.50 AS Decimal(18, 2)), CAST(1050.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (24, 24, N'http://static.ugallery.com/webdata/Product/45321/Images/Large_hopeisathingwithfeathersmain.jpg', 2016, CAST(252.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (25, 25, N'http://www.ugallery.com/webdata/product/42883/view2/large_img_5458.jpg', 2015, CAST(378.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (26, 26, N'http://static.ugallery.com/webdata/Product/35054/Images/Large_DSCF1548.jpg', 2013, CAST(567.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (27, 27, N'https://s-media-cache-ak0.pinimg.com/736x/4e/b7/b3/4eb7b3703c25663f4b94b1019b0dc90e.jpg', 2013, CAST(346.50 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (28, 28, N'http://static.ugallery.com/webdata/Product/35894/Images/Large_KMUgallery_heart.jpg', 2013, CAST(645.75 AS Decimal(18, 2)), CAST(1025.00 AS Decimal(18, 2)), 1, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (29, 29, N'http://static.ugallery.com/webdata/Product/41653/Images/Large_Tumacacori_Mission_(1500x1090).jpg', 2015, CAST(299.25 AS Decimal(18, 2)), CAST(475.00 AS Decimal(18, 2)), 0, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (30, 30, N'http://static.ugallery.com/webdata/Product/44537/Images/Large_sam6479-version4.jpg', 2014, CAST(141.75 AS Decimal(18, 2)), CAST(225.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (31, 31, N'http://static.ugallery.com/webdata/Product/43710/Images/Large_1.jpg', 2016, CAST(913.50 AS Decimal(18, 2)), CAST(1450.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (32, 32, N'http://static.ugallery.com/webdata/Product/28028/Images/Large_IMG-4897-cropped.jpg', 2013, CAST(567.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (33, 33, N'http://static.ugallery.com/webdata/Product/45291/Images/Large_mistersteethchatteredindiainkoncutpaper12.5x152013.jpg', 2013, CAST(378.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (34, 34, N'http://static.ugallery.com/webdata/Product/43166/Images/Large_Melanie_Duault04.jpg', 2014, CAST(78.75 AS Decimal(18, 2)), CAST(125.00 AS Decimal(18, 2)), 6, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (35, 35, N'https://nerskine.files.wordpress.com/2012/11/winter-field-ii-18x18-oil-on-canvas-2015.jpg', 2015, CAST(488.25 AS Decimal(18, 2)), CAST(775.00 AS Decimal(18, 2)), 1, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (36, 36, N'http://static.ugallery.com/webdata/Product/41931/Images/Large_P1030476.jpg', 2014, CAST(551.25 AS Decimal(18, 2)), CAST(875.00 AS Decimal(18, 2)), 1, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (37, 37, N'http://static.ugallery.com/webdata/Product/41416/Images/Large_1.__Layered_Landscape.jpg', 2015, CAST(393.75 AS Decimal(18, 2)), CAST(625.00 AS Decimal(18, 2)), 0, N'East')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (38, 38, N'http://saimg-a.akamaihd.net/saatchi/403041/art/3132944/2202835-TEWCTIPU-7.jpg', 2016, CAST(929.25 AS Decimal(18, 2)), CAST(1475.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (39, 39, N'http://www.ugallery.com/webdata/product/32379/view1/large__dsc2395h.jpg', 2009, CAST(330.75 AS Decimal(18, 2)), CAST(525.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (40, 40, N'http://www.ugallery.com/webdata/product/43981/view1/large_enigmaside.jpg', 2015, CAST(220.50 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (41, 41, N'http://www.ugallery.com/webdata/product/43980/view1/large_whatliesbeneathviside.jpg', 2016, CAST(220.50 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (42, 42, N'http://static.ugallery.com/webdata/Product/40349/Images/Large_red.jpg', 2014, CAST(1527.75 AS Decimal(18, 2)), CAST(2425.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (43, 43, N'http://static.ugallery.com/webdata/Product/45751/Images/Large_imgp1400.jpg', 2016, CAST(283.50 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 0, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (44, 44, N'http://static.ugallery.com/webdata/Product/42648/Images/Large_16x24ColorsOfBulldog1.jpg', 2015, CAST(126.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 4, N'West')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (45, 45, N'http://static.ugallery.com/webdata/Product/45351/Images/large_lovesongs0743.jpg', 2016, CAST(299.25 AS Decimal(18, 2)), CAST(475.00 AS Decimal(18, 2)), 1, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (46, 46, N'http://www.ugallery.com/webdata/Product/44651/Images/Large_400.yellowfieldwithmesa.jpg', 2015, CAST(1779.75 AS Decimal(18, 2)), CAST(2825.00 AS Decimal(18, 2)), 1, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (47, 47, N'http://www.ugallery.com/webdata/product/44357/view2/large_airmailwall.jpg', 2016, CAST(173.25 AS Decimal(18, 2)), CAST(275.00 AS Decimal(18, 2)), 0, N'North')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (48, 48, N'http://static.ugallery.com/webdata/Product/39847/Images/Large_memory_ring_mini_full.jpg', 2015, CAST(378.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, N'South')
INSERT INTO [dbo].[IndividualPiece] ([IndividualPieceId], [ArtworkId], [Image], [DateCreated], [Cost], [Price], [Sold], [Location]) VALUES (49, 49, http://www.ugallery.com/webdata/Product/43677/Images/Large_Main.jpg, 2016, CAST(298.62 AS Decimal(18, 2)), CAST(474.00 AS Decimal(18, 2)), 0, N'South')
SET IDENTITY_INSERT [dbo].[IndividualPiece] OFF
