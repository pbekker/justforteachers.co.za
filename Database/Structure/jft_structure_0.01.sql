USE jft
GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'FeaturedResources')
DROP TABLE FeaturedResources
GO

BEGIN TRANSACTION
CREATE TABLE dbo.FeaturedResources
	(
	resourceId int NOT NULL,
	isFrontPage bit NOT NULL,
	startDate datetime NOT NULL,
	endDate datetime NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.FeaturedResources ADD CONSTRAINT
	DF_FeaturedResources_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.FeaturedResources SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceRating')
DROP TABLE  ResourceRating
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceRating
	(
	resourceId int NOT NULL,
	userId int NOT NULL,
	rating int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceRating SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceTopics')
DROP TABLE  ResourceTopics
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceTopics
	(
	id int NOT NULL IDENTITY (1, 1),
	parentId int NULL,
	name varchar(255) NOT NULL,
	Description varchar(MAX) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceTopics ADD CONSTRAINT
	DF_ResourceTopics_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.ResourceTopics ADD CONSTRAINT
	PK_ResourceTopics PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ResourceTopics SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceLanguage')
DROP TABLE  ResourceLanguage
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceLanguage
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceLanguage ADD CONSTRAINT
	DF_ResourceLanguage_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.ResourceLanguage ADD CONSTRAINT
	PK_ResourceLanguage PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ResourceLanguage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceType')
DROP TABLE  ResourceType
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceType
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceType ADD CONSTRAINT
	DF_ResourceType_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.ResourceType ADD CONSTRAINT
	PK_ResourceType PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ResourceType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'Resource')
DROP TABLE  [Resource]
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.[Resource]
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
ALTER TABLE dbo.Resource ADD CONSTRAINT
	DF_Resource_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.Resource ADD CONSTRAINT
	PK_Resource PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Resource SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'FileType')
DROP TABLE  FileType
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.FileType
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.FileType ADD CONSTRAINT
	DF_FileType_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.FileType ADD CONSTRAINT
	PK_FileType PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.FileType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'File')
DROP TABLE  [File]
GO

BEGIN TRANSACTION
GO
CREATE TABLE dbo.[File]
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
ALTER TABLE dbo.[File] ADD CONSTRAINT
	DF_File_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.[File] ADD CONSTRAINT
	PK_File PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[File] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'ResourceFile')
DROP TABLE  ResourceFile
GO


BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceFile
	(
	fileId int NOT NULL,
	resourceId int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceFile SET (LOCK_ESCALATION = TABLE)
GO
COMMIT