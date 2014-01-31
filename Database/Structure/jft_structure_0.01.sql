USE justfyty_justfo
GO

/** drop existing tables that we made **/

IF EXISTS (SELECT * FROM sys.foreign_keys t WHERE t.name = 'FK_bhdResourceComment_bhdResource' AND parent_object_id = OBJECT_ID(N'bhdResourceComment')
)
ALTER TABLE bhdResourceComment
DROP CONSTRAINT FK_bhdResourceComment_bhdResource
GO
IF EXISTS (SELECT * FROM sys.foreign_keys t WHERE t.name = 'FK_bhdResourceAuthor_bhdFile' AND parent_object_id = OBJECT_ID(N'bhdResourceAuthor')
)
BEGIN
ALTER TABLE dbo.bhdResourceAuthor DROP CONSTRAINT FK_bhdResourceAuthor_bhdFile
ALTER TABLE dbo.bhdResourceAuthor DROP CONSTRAINT FK_bhdResourceAuthor_bhdAuthor
END
GO
ALTER TABLE dbo.bhdResource DROP CONSTRAINT FK_bhdResource_bhdResourceLanguage 
ALTER TABLE dbo.bhdResource DROP CONSTRAINT FK_bhdResource_bhdResourceType
ALTER TABLE dbo.bhdResource DROP CONSTRAINT	FK_bhdResource_bhdResourceTopics
ALTER TABLE dbo.bhdResourceRating DROP CONSTRAINT FK_bhdResourceRating_bhdResource 
ALTER TABLE dbo.bhdFile DROP CONSTRAINT	FK_bhdFile_bhdFileType
ALTER TABLE dbo.bhdResourceFile DROP CONSTRAINT FK_bhdResourceFile_bhdResource
ALTER TABLE dbo.bhdResourceFile DROP CONSTRAINT	FK_bhdResourceFile_bhdFile 
ALTER TABLE dbo.bhdFeaturedResources DROP CONSTRAINT FK_bhdFeaturedResources_bhdResource
ALTER TABLE dbo.bhdPublishInformation DROP CONSTRAINT FK_bhdPublishInformation_bhdPublisher
ALTER TABLE dbo.bhdPublishInformation DROP CONSTRAINT FK_bhdPublishInformation_bhdAuthor
ALTER TABLE dbo.bhdResourceLink DROP CONSTRAINT	FK_bhdResourceLink_bhdLink 
ALTER TABLE dbo.bhdResourceLink DROP CONSTRAINT FK_bhdResourceLink_bhdResource 
ALTER TABLE dbo.bhdResourceKeyword DROP CONSTRAINT FK_bhdResourceKeyword_bhdKeyword 
ALTER TABLE dbo.bhdResourceKeyword DROP CONSTRAINT FK_bhdResourceKeyword_bhdResource 
ALTER TABLE dbo.bhdResourceBundleFile DROP CONSTRAINT FK_bhdResourceBundleFile_bhdResourceBundle
ALTER TABLE dbo.bhdResourceBundleFile DROP CONSTRAINT FK_bhdResourceBundleFile_bhdFile
ALTER TABLE dbo.bhdFileData DROP CONSTRAINT	FK_bhdFileData_bhdFile
ALTER TABLE dbo.bhdResourceFormat DROP CONSTRAINT FK_bhdResourceFormat_bhdFormat
ALTER TABLE dbo.bhdResourceFormat DROP CONSTRAINT FK_bhdResourceFormat_bhdResource

DELETE FROM bhdResource

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'FeaturedResources')
DROP TABLE FeaturedResources

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceAuthor')
DROP TABLE  bhdResourceAuthor
GO
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
IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceFormat')
DROP TABLE bhdResourceFormat
GO

/** end drops **/

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFeaturedResources')
DROP TABLE bhdFeaturedResources
GO


CREATE TABLE dbo.bhdFeaturedResources
	(
	resourceId int NOT NULL,
	portalId int NOT NULL,
	isFrontPage bit NOT NULL,
	startDate datetime NOT NULL,
	endDate datetime NOT NULL,
	sequence int NOT NULL,
	isActive bit NOT NULL
	CONSTRAINT pk_FeaturedResources PRIMARY KEY (resourceId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFeaturedResources ADD CONSTRAINT
	DF_bhdFeaturedResources_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdFeaturedResources SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceRating')
DROP TABLE  bhdResourceRating
GO


GO
CREATE TABLE dbo.bhdResourceRating
	(
	resourceId int NOT NULL,
	userId int NOT NULL,
	rating int NOT NULL
	CONSTRAINT pk_ResourceRating PRIMARY KEY (resourceId, userId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceRating SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceTopics')
DROP TABLE  bhdResourceTopics
GO


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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceLanguage')
DROP TABLE  bhdResourceLanguage
GO


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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceType')
DROP TABLE bhdResourceType
GO


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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResource')
DROP TABLE  bhdResource
GO


GO
CREATE TABLE dbo.bhdResource
	(
	id int NOT NULL IDENTITY (1, 1),
	portalId int NOT NULL,
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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFileType')
DROP TABLE bhdFileType
GO


GO
CREATE TABLE dbo.bhdFileType
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(255) NULL,
	extension VARCHAR(5) NOT NULL,
	contentType VARCHAR(255),
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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFileData')
DROP TABLE bhdFileData
GO


GO
CREATE TABLE dbo.bhdFileData
	(
	fileId int NOT NULL,
	data image NOT NULL
	CONSTRAINT pk_FileData PRIMARY KEY (fileId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFileData SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFile')
DROP TABLE  bhdFile
GO


GO
CREATE TABLE dbo.bhdFile
	(
	id int NOT NULL IDENTITY (1, 1),
	fileTypeId int NOT NULL,
	name varchar(255) NOT NULL,
	size int NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceFile')
DROP TABLE  bhdResourceFile
GO


GO
CREATE TABLE dbo.bhdResourceFile
	(
	fileId int NOT NULL,
	resourceId int NOT NULL
	CONSTRAINT pk_ResourceFile PRIMARY KEY (fileId, resourceId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceFile SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdPublishInformation')
DROP TABLE  bhdPublishInformation
GO


GO
CREATE TABLE dbo.bhdPublishInformation
	(
	id int NOT NULL IDENTITY (1, 1),
	resourceId int NOT NULL,
	fileId int NOT NULL,
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


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdAuthor')
DROP TABLE  bhdAuthor
GO


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

GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdPublisher')
DROP TABLE  bhdPublisher
GO


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

GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceKeyword')
DROP TABLE bhdResourceKeyword
GO


GO
CREATE TABLE dbo.bhdResourceKeyword
	(
	Resourceid int NOT NULL,
	KeywordId int NOT NULL
	CONSTRAINT pk_ResourceKeyword PRIMARY KEY (ResourceId, KeywordId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceKeyword SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdKeyword')
DROP TABLE bhdKeyword
GO


GO
CREATE TABLE dbo.bhdKeyword
	(
	id int NOT NULL IDENTITY(1, 1),
	value varchar(250) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdKeyword ADD CONSTRAINT
	PK_bhdKeyword PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdKeyword SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdLink')
DROP TABLE bhdLink
GO


GO
CREATE TABLE dbo.bhdLink
	(
	linkId int NOT NULL IDENTITY(1,1),
	url varchar(MAX) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.bhdLink ADD CONSTRAINT
	PK_bhdLink PRIMARY KEY CLUSTERED 
	(
	linkId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdLink SET (LOCK_ESCALATION = TABLE)
GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceLink')
DROP TABLE bhdResourceLink
GO


GO
CREATE TABLE dbo.bhdResourceLink
	(
	linkId int NOT NULL,
	resourceId int NOT NULL
	CONSTRAINT pk_ResourceLink PRIMARY KEY (linkId, resourceId)
	
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceLink SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceBundle')
DROP TABLE bhdResourceBundle
GO

GO
CREATE TABLE dbo.bhdResourceBundle
	(
	bundleId int NOT NULL,
	userId int NOT NULL,
	name varchar(255) NOT NULL,
	[description] varchar(max) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceBundle ADD CONSTRAINT
	PK_bhdResourceBundle PRIMARY KEY CLUSTERED 
	(
	bundleId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdResourceLink SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceBundleFile')
DROP TABLE bhdResourceBundleFile
GO

GO
CREATE TABLE dbo.bhdResourceBundleFile
	(
	bundleId int NOT NULL,
	resourceFileId int NOT NULL,
	isFavourite bit NOT NULL
	CONSTRAINT pk_ResourceBundleFile PRIMARY KEY (bundleId, resourceFileId)
	)  ON [PRIMARY]
GO

ALTER TABLE dbo.bhdResourceBundleFile SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceFormat')
DROP TABLE bhdResourceFormat
GO

GO
CREATE TABLE dbo.bhdResourceFormat
	(
	resourceId int NOT NULL,
	formatId int NOT NULL
	CONSTRAINT pk_ResourceFormat PRIMARY KEY (resourceid, formatId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdResourceFormat SET (LOCK_ESCALATION = TABLE)
GO



IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdFormat')
DROP TABLE bhdFormat
GO

GO
CREATE TABLE dbo.bhdFormat
	(
	id int NOT NULL,
	name varchar(255) NOT NULL,
	isActive bit NULL
	CONSTRAINT pk_Format PRIMARY KEY (id)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdFormat ADD CONSTRAINT
	DF_bhdFormat_isActive DEFAULT 1 FOR isActive
GO
ALTER TABLE dbo.bhdFormat SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdResourceComment')
DROP TABLE bhdResourceComment
GO

CREATE TABLE dbo.bhdResourceComment
	(
	id int not null identity(1,1),
	resourceId int not null,
	userId int not null,
	commentId int null,
	comment varchar(max),
	commentDate datetime,
	isActive bit
	CONSTRAINT pk_ResourceComment PRIMARY KEY (id)
	)  ON [PRIMARY]
GO


/*************************** LOOK UP TABLES ************************************/
IF NOT EXISTS(SELECT * FROM bhdResourceLanguage)
BEGIN
	INSERT INTO bhdResourceLanguage (name, isActive)
	VALUES ('English', 1), ('Afrikaans', 1)
END

IF NOT EXISTS(SELECT * FROM bhdResourceTopics)
BEGIN
	INSERT INTO bhdResourceTopics (parentId, name, [description], isActive)
	VALUES (NULL, 'FET', 'Further Education and Training (Grades 10 - 12)', 1)
			,(NULL, 'GED (Grades 7 - 9)', 'GED Senior Phase (Grades 7 - 9)', 1)
			,(NULL, 'GED (Grades 4 - 6)', 'GED Intermediate Phase (Grades 4 - 6)', 1)
			,(NULL, 'GED (Grades 0 - 3)', 'GED Foundation Phase (Grades 0 - 3)', 1)
			,(1, 'Accounting', '', 1)
			,(1, 'Afrikaans', '', 1)
			,(1, 'Agricultural Management', '', 1)
			,(1, 'Practices','',1)
			,(1, 'Agricultural Sciences', '', 1)
			,(1, 'Agricultural Technology', '', 1)
			,(1, 'Business Studies', '', 1)
			,(1, 'Civil Technology', '', 1)
			,(1, 'Computer Applications', '', 1)
			,(1, 'Technology ', '', 1)
			,(1, 'Consumer Studies', '', 1)
			,(1, 'Dance Studies', '', 1)
			,(1, 'Design', '', 1)
			,(1, 'Dramatic Arts', '', 1)
			,(1, 'Economics', '', 1)
			,(1, 'Electrical Technology', '', 1)
			,(1, 'Engineering Graphics and Design', '', 1)
			,(1, 'English', '', 1)
			,(1, 'Geography', '', 1)
			,(1, 'History', '', 1)
			,(1, 'Hospitality Studies', '', 1)
			,(1, 'Information Technology', '', 1)
			,(1, 'Life Sciences', '', 1)
			,(1, 'Mathematics', '', 1)
			,(1, 'Mathematics Literacy', '', 1)
			,(1, 'Mechanical Technology', '', 1)
			,(1, 'Music', '', 1)
			,(1, 'Physical Science', '', 1)
			,(1, 'Religion Studies', '', 1)
			,(1, 'Tourism', '', 1)
			,(1, 'Visual Arts', '', 1)
			,(1, 'Xhosa', '', 1)
			,(1, 'Zulu', '', 1)
			,(1, 'Life Orientation', '', 1)
	
END

IF NOT EXISTS(SELECT * FROM bhdResourceType)
BEGIN
	INSERT INTO bhdResourceType (name, isActive)
	VALUES ('File', 1), ('Website Link (URL)', 1)
	
END

IF NOT EXISTS(SELECT * FROM bhdFileType)
BEGIN
	INSERT INTO bhdFileType (name, extension, isActive)
	VALUES ('Word', 'docx', 1)
END

DECLARE @topicId int
IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name like '%Life Sciences%')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Environmental Studies')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name like '%Life Sciences%'

INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Environmental Studies', '', @topicId, 1),
	   ('Diversity, Change and Continuity', '', @topicId, 1),
	   ('Life at molecular, Cellular and Tissue Level', '', @topicId, 1),
	   ('Life Processes in Plants and Animals', '', @topicId, 1)

END


IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name like '%Geography%')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Human and environment interaction')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name like '%Geography%'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Human and environment interaction', '', @topicId, 1),
	   ('Place', '', @topicId, 1),
	   ('Spatial distribution patterns', '', @topicId, 1),
	   ('Spatial processes', '', @topicId, 1)

END

IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name like '%History%')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Cause and effect')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name like '%History%'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Cause and effect', '', @topicId, 1),
	   ('Change and continuity ', '', @topicId, 1),
	   ('Multi - perspectivity', '', @topicId, 1),
	   ('Sources and evidence', '', @topicId, 1),
	   ('Time and chronology', '', @topicId, 1)
END

IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name like '%Life Orientation%')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Careers and career choices')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name like '%Life Orientation%'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Careers and career choices', '', @topicId, 1),
	   ('Democracy & human rights', '', @topicId, 1),
	   ('Development of self in society', '', @topicId, 1),
	   ('Physical education', '', @topicId, 1),
	   ('Social and environmental responsibility', '', @topicId, 1),
	   ('Study skills', '', @topicId, 1)
END

IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name = 'Mathematics')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Careers and career choices')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name = 'Mathematics'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Algebra', '', @topicId, 1),
	   ('Analytical geometry', '', @topicId, 1),
	   ('Differential calculus', '', @topicId, 1),
	   ('Finance, growth, decay', '', @topicId, 1),
	   ('Functions', '', @topicId, 1),
	   ('Euclidean Geometry and measurement', '', @topicId, 1),
	   ('Number patterns, sequences, series', '', @topicId, 1),
	   ('Probability', '', @topicId, 1),
	   ('Statistics', '', @topicId, 1),
	   ('Trigonometry', '', @topicId, 1)
END

IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name = 'Mathematics Literacy')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Data handling')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name = 'Mathematics Literacy'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Data handling', '', @topicId, 1),
	   ('Finance', '', @topicId, 1),
	   ('Interpreting and communication answers', '', @topicId, 1),
	   ('Maps, plans and other representations of the physical world', '', @topicId, 1),
	   ('Measurement', '', @topicId, 1),
	   ('Numbers and calculations with numbers', '', @topicId, 1),
	   ('Patterns, relationships and representations', '', @topicId, 1),
	   ('Probability', '', @topicId, 1)
END

IF EXISTS (SELECT * FROM bhdResourceTopics (NOLOCK) WHERE name = 'Physical Science')
 AND NOT EXISTS (SELECT * FROM bhdResourceTopics WHERE name = 'Electricity and magnetism')
BEGIN
SELECT @topicId = id FROM bhdResourceTopics rt (NOLOCK)
WHERE rt.name = 'Physical Science'
INSERT INTO  bhdResourceTopics (name, [description], parentId, isActive)
VALUES ('Electricity and magnetism', '', @topicId, 1),
	   ('Chemical change', '', @topicId, 1),
	   ('Chemical systems', '', @topicId, 1),
	   ('Matter and materials', '', @topicId, 1),
	   ('Mechanics', '', @topicId, 1),
	   ('Waves, sound and light', '', @topicId, 1)
END

IF NOT EXISTS (SELECT * FROM bhdFormat)
BEGIN
	INSERT INTO bhdFormat (id, name, isActive)
	VALUES (1, 'Activity', 1), 
		(2, 'Assembly', 1), 
		(3, 'Lesson Plan', 1), 
		(4, 'Long-term plan', 1), 
		(5, 'Poster',1 ), 
		(6, 'Revision', 1), 
		(7, 'School admin', 1), 
		(8, 'Test / Examination', 1), 
		(9, 'Timetable', 1), 
		(10, 'Worksheet', 1)
END


ALTER TABLE dbo.bhdResource ADD CONSTRAINT
	FK_bhdResource_bhdResourceLanguage FOREIGN KEY
	(
	languageId
	) REFERENCES dbo.bhdResourceLanguage
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResource ADD CONSTRAINT
	FK_bhdResource_bhdResourceType FOREIGN KEY
	(
	typeId
	) REFERENCES dbo.bhdResourceType
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResource ADD CONSTRAINT
	FK_bhdResource_bhdResourceTopics FOREIGN KEY
	(
	topicId
	) REFERENCES dbo.bhdResourceTopics
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResource SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceRating ADD CONSTRAINT
	FK_bhdResourceRating_bhdResource FOREIGN KEY
	(
	resourceId
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceRating SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdPublisher SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdFileType SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdFile ADD CONSTRAINT
	FK_bhdFile_bhdFileType FOREIGN KEY
	(
	fileTypeId
	) REFERENCES dbo.bhdFileType
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdFile SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceFile ADD CONSTRAINT
	FK_bhdResourceFile_bhdResource FOREIGN KEY
	(
	resourceId
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceFile ADD CONSTRAINT
	FK_bhdResourceFile_bhdFile FOREIGN KEY
	(
	fileId
	) REFERENCES dbo.bhdFile
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceFile SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdFeaturedResources ADD CONSTRAINT
	FK_bhdFeaturedResources_bhdResource FOREIGN KEY
	(
	resourceId
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdFeaturedResources SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdAuthor SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdPublishInformation ADD CONSTRAINT
	FK_bhdPublishInformation_bhdPublisher FOREIGN KEY
	(
	publisherId
	) REFERENCES dbo.bhdPublisher
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdPublishInformation ADD CONSTRAINT
	FK_bhdPublishInformation_bhdAuthor FOREIGN KEY
	(
	authorId
	) REFERENCES dbo.bhdAuthor
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdPublishInformation SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceBundle SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResource SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdLink SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceLink ADD CONSTRAINT
	FK_bhdResourceLink_bhdLink FOREIGN KEY
	(
	linkId
	) REFERENCES dbo.bhdLink
	(
	linkId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceLink ADD CONSTRAINT
	FK_bhdResourceLink_bhdResource FOREIGN KEY
	(
	resourceId
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceLink SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdKeyword SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceKeyword ADD CONSTRAINT
	FK_bhdResourceKeyword_bhdKeyword FOREIGN KEY
	(
	KeywordId
	) REFERENCES dbo.bhdKeyword
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceKeyword ADD CONSTRAINT
	FK_bhdResourceKeyword_bhdResource FOREIGN KEY
	(
	Resourceid
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceKeyword SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdFile SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdResourceBundleFile ADD CONSTRAINT
	FK_bhdResourceBundleFile_bhdResourceBundle FOREIGN KEY
	(
	bundleId
	) REFERENCES dbo.bhdResourceBundle
	(
	bundleId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceBundleFile ADD CONSTRAINT
	FK_bhdResourceBundleFile_bhdFile FOREIGN KEY
	(
	resourceFileId
	) REFERENCES dbo.bhdFile
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceBundleFile SET (LOCK_ESCALATION = TABLE)
GO


ALTER TABLE dbo.bhdFile SET (LOCK_ESCALATION = TABLE)
GO


GO
ALTER TABLE dbo.bhdFileData ADD CONSTRAINT
	FK_bhdFileData_bhdFile FOREIGN KEY
	(
	fileId
	) REFERENCES dbo.bhdFile
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdFileData SET (LOCK_ESCALATION = TABLE)
GO


ALTER TABLE dbo.bhdResourceComment ADD CONSTRAINT
FK_bhdResourceComment_bhdResource FOREIGN KEY
(
resourceId
) REFERENCES dbo.bhdResource
(
id
) ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
	
GO

ALTER TABLE dbo.bhdResourceFormat ADD CONSTRAINT
	FK_bhdResourceFormat_bhdFormat FOREIGN KEY
	(
	formatId
	) REFERENCES dbo.bhdFormat
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.bhdResourceFormat ADD CONSTRAINT
	FK_bhdResourceFormat_bhdResource FOREIGN KEY
	(
	resourceId
	) REFERENCES dbo.bhdResource
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO