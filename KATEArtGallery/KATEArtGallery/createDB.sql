CREATE TABLE [dbo].[Agent] (
    [AgentId]   SMALLINT     IDENTITY (50, 1) NOT NULL,
    [FirstName] VARCHAR (25) NULL,
    [LastName]  VARCHAR (35) NULL,
    [Location]  VARCHAR (40) NULL,
    [Address]   VARCHAR (80) NULL,
    [PhoneNumber]     VARCHAR (10) NULL,
    [Active]    BIT          NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED ([AgentId] ASC)
);

CREATE TABLE [dbo].[Artist] (
    [ArtistId]  SMALLINT     IDENTITY (100, 1) NOT NULL,
    [Name]      VARCHAR (65) NOT NULL,
    [BirthYear] DATE     NULL,
    [DeathYear] DATE     NULL,
    CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);

CREATE TABLE [dbo].[Artwork] (
    [ArtworkId]           SMALLINT     IDENTITY (1000, 1) NOT NULL,
    [ArtistId]            SMALLINT     NOT NULL,
    [Title]               VARCHAR (60) NOT NULL,
    [YearOriginalCreated] SMALLINT     NULL,
    [Medium]              VARCHAR (60) NULL,
    [Dimensions]          VARCHAR (60) NULL,
    [NumberMade]          SMALLINT     NULL,
    [NumberInInventory]   SMALLINT     NOT NULL,
    [NumberSold]          SMALLINT     NOT NULL,
    CONSTRAINT [PK_Artwork] PRIMARY KEY CLUSTERED ([ArtworkId] ASC)
);

CREATE TABLE [dbo].[ArtShow] (
    [ArtShowId]    SMALLINT     IDENTITY (1, 1) NOT NULL,
    [ArtworkId]    SMALLINT     NULL,
    [ShowLocation] VARCHAR (40) NULL,
    [Agents]       VARCHAR(30)  NOT NULL,
    [Overhead]     BIT          NOT NULL,
    CONSTRAINT [FK_ArtShow] FOREIGN KEY ([ArtworkId]) REFERENCES [dbo].[Artwork] ([ArtworkId])
);

CREATE TABLE [dbo].[Customer] (
    [CustomerId] SMALLINT     IDENTITY (500, 1) NOT NULL,
    [AgentId]    SMALLINT     NULL,
    [FirstName]  VARCHAR (25) NULL,
    [LastName]   VARCHAR (35) NULL,
    [Location]   VARCHAR (40) NULL,
    [Address]    VARCHAR (80) NULL,
    [PhoneNumber]      VARCHAR (10) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [FK_Customer] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[Agent] ([AgentId])
);

CREATE TABLE [dbo].[IndividualPiece] (
  [IndividualPieceId] INT NOT NULL,
  [ArtWorkId] INT NOT NULL,
  [Image] IMAGE NULL,
  [DateCreated] DATE NULL,
  [Cost] DECIMAL(18,2) NULL,
  [Price] DECIMAL(18,2) NULL,
  [Sold] INT NULL,
  [Location] VARCHAR(50) NULL,
  [EditionNumber] INT NULL,
  PRIMARY KEY CLUSTERED (IndividualPieceId ASC)
);

CREATE TABLE [dbo].[Invoice] (
  [InvoiceId] INT NOT NULL,
  [CustomerId] INT NOT NULL,
  [AgentId] INT NOT NULL,
  [PaymentMethod] VARCHAR(30) NULL,
  [ShippingAddress] DATE NULL,
  [PieceSold] DECIMAL(18,0) NULL,
  [Price] DECIMAL(18,0) NULL,
 CONSTRAINT PK_Invoice PRIMARY KEY CLUSTERED (CustomerId ASC),
CONSTRAINT FK_Invoice1 FOREIGN KEY (AgentId) REFERENCES Agent (AgentId)

);
