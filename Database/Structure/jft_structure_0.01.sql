USE justfyty_justfo
GO

/** drop existing tables that we made **/

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'FeaturedResources')
DROP TABLE FeaturedResources
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceRating')
DROP TABLE  ResourceRating
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceTopics')
DROP TABLE  ResourceTopics
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceLanguage')
DROP TABLE  ResourceLanguage
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'File')
DROP TABLE  [File]
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'FileType')
DROP TABLE  FileType
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'Resource')
DROP TABLE  [Resource]
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceFile')
DROP TABLE  ResourceFile
GO
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceType')
DROP TABLE  ResourceType
GO

/** end drops **/

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFeaturedResources')
DROP TABLE bhdFeaturedResources
GO

BEGIN TRANSACTION
CREATE TABLE dbo.bhdFeaturedResources
	(
	resourceId int NOT NULL,
	isFrontPage bit NOT NULL,
	startDate datetime NOT NULL,
	endDate datetime NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFeaturedResources ADD CONSTRAINT
	DF_bhdFeaturedResources_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdFeaturedResources SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceRating')
DROP TABLE  bhdResourceRating
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceRating
	(
	resourceId int NOT NULL,
	userId int NOT NULL,
	rating int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceRating SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceTopics')
DROP TABLE  bhdResourceTopics
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceTopics
	(
	id int NOT NULL IDENTITY (1, 1),
	parentId int NULL,
	name varchar(255) NOT NULL,
	[description] varchar(MAX) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceTopics ADD CONSTRAINT
	DF_bhdResourceTopics_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdResourceTopics ADD CONSTRAINT
	PK_bhdResourceTopics PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdResourceTopics SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceLanguage')
DROP TABLE  bhdResourceLanguage
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceLanguage
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceLanguage ADD CONSTRAINT
	DF_bhdResourceLanguage_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdResourceLanguage ADD CONSTRAINT
	PK_bhdResourceLanguage PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdResourceLanguage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceType')
DROP TABLE bhdResourceType
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceType
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceType ADD CONSTRAINT
	DF_bhdResourceType_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdResourceType ADD CONSTRAINT
	PK_bhdResourceType PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdResourceType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResource')
DROP TABLE  bhdResource
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResource
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	description varchar(MAX) NOT NULL,
	typeId int NOT NULL,
	languageId int NOT NULL,
	topicId int NOT NULL,
	uploadDate datetime NOT NULL,
	uploadUser int NOT NULL,
	approvalDate datetime NULL,
	approvalUser int NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResource ADD CONSTRAINT
	DF_bhdResource_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdResource ADD CONSTRAINT
	PK_bhdResource PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdResource SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFileType')
DROP TABLE bhdFileType
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdFileType
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	icon Image NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFileType ADD CONSTRAINT
	DF_bhdFileType_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdFileType ADD CONSTRAINT
	PK_bhdFileType PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdFileType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFile')
DROP TABLE  bhdFile
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdFile
	(
	id int NOT NULL IDENTITY (1, 1),
	fileTypeId int NOT NULL,
	name varchar(255) NOT NULL,
	size int NOT NULL,
	data image NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFile ADD CONSTRAINT
	DF_bhdFile_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdFile ADD CONSTRAINT
	PK_bhdFile PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdFile SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceFile')
DROP TABLE  bhdResourceFile
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceFile
	(
	fileId int NOT NULL,
	resourceId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceFile SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdPublishInformation')
DROP TABLE  bhdPublishInformation
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdPublishInformation
	(
	id int NOT NULL IDENTITY (1, 1),
	publisherId int NOT NULL,
	authorId int NOT NULL,
	publishYear int NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdPublishInformation ADD CONSTRAINT
	DF_bhdPublishInformation_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdPublishInformation ADD CONSTRAINT
	PK_bhdPublishInformation PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdPublishInformation SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceAuthor')
DROP TABLE  bhdResourceAuthor
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdResourceAuthor
	(
	authorId int NOT NULL,
	fileId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceAuthor SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdAuthor')
DROP TABLE  bhdAuthor
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdAuthor
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	surname varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdAuthor ADD CONSTRAINT
	DF_bhdAuthor_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdAuthor ADD CONSTRAINT
	PK_bhdAuthor PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
COMMIT
GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdPublisher')
DROP TABLE  bhdPublisher
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.bhdPublisher
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	surname varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdPublisher ADD CONSTRAINT
	DF_bhdPublisher_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdPublisher ADD CONSTRAINT
	PK_bhdPublisher PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
COMMIT
GO

IF NOT EXISTS(SELECT * FROM bhdResourceLanguage)
BEGIN
	INSERT INTO bhdResourceLanguage (name, isActive)
	VALUES ('English', 1), ('Afrikaans', 1)
END

IF NOT EXISTS(SELECT * FROM bhdResourceTopics)
BEGIN
	INSERT INTO bhdResourceTopics (parentId, name, [description], isActive)
	VALUES (NULL, 'FET', 'FET LEVEL RESOURCES', 1)
			,(NULL, 'GET', 'GET LEVEL RESOURCES', 1)
			,(1, 'English Lit', 'literature resources', 1)
			,(1, 'Afrikaans', 'afrikaans stuff.', 1)
	
END

IF NOT EXISTS(SELECT * FROM bhdResourceType)
BEGIN
	INSERT INTO bhdResourceType (name, isActive)
	VALUES ('Book', 1), ('Website', 1), ('Lesson Plan', 1)
	
END