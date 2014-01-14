USE justfyty_justfo

IF EXISTS (SELECT * FROM sys.foreign_keys t WHERE t.name = 'FK_bhdMenuPage_bhdMenu' AND parent_object_id = OBJECT_ID(N'dbo.bhdMenuPage')
)
ALTER TABLE bhdMenuPage
DROP CONSTRAINT FK_bhdMenuPage_bhdMenu
GO

IF EXISTS (SELECT * FROM sys.foreign_keys t WHERE t.name = 'FK_bhdMenuItem_bhdMenu' AND parent_object_id = OBJECT_ID(N'dbo.bhdMenuItem'))
ALTER TABLE bhdMenuItem
DROP CONSTRAINT FK_bhdMenuItem_bhdMenu
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdMenuPage')
DROP TABLE bhdMenuPage
GO

CREATE TABLE dbo.bhdMenuPage
	(
	menuId int NOT NULL,
	tabId int NOT NULL,
	moduleId int NOT NULL
	CONSTRAINT pk_MenuPage PRIMARY KEY (menuId, tabId, moduleId)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdMenuPage SET (LOCK_ESCALATION = TABLE)
GO


IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdMenu')
DROP TABLE bhdMenu
GO
CREATE TABLE dbo.bhdMenu
	(
	id int NOT NULL IDENTITY (1, 1),
	name varchar(250) NOT NULL,
	description varchar(250) NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.bhdMenu ADD CONSTRAINT
	PK_bhdMenu PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

IF EXISTS (SELECT * FROM sys.tables t WHERE t.name = 'bhdMenuItem')
DROP TABLE bhdMenuItem
GO

CREATE TABLE dbo.bhdMenuItem
	(
	id int NOT NULL IDENTITY (1, 1),
	menuId int NOT NULL,
	text varchar(250) NOT NULL,
	hoverText varchar(250) NOT NULL,
	tabId int NULL,
	moduleId int NULL,
	url varchar(MAX) NULL,
	isAdmin bit NOT NULL,
	isActive bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.bhdMenuItem ADD CONSTRAINT
	DF_bhdMenuItem_isAdmin DEFAULT (0) FOR isAdmin
GO
ALTER TABLE dbo.bhdMenuItem ADD CONSTRAINT
	DF_bhdMenuItem_isActive DEFAULT (1) FOR isActive
GO
ALTER TABLE dbo.bhdMenuItem ADD CONSTRAINT
	PK_bhdMenuItem PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.bhdMenuItem SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE dbo.bhdMenuPage ADD CONSTRAINT
	FK_bhdMenuPage_bhdMenu FOREIGN KEY
	(
	menuId
	) REFERENCES dbo.bhdMenu
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

ALTER TABLE dbo.bhdMenuItem ADD CONSTRAINT
	FK_bhdMenuItem_bhdMenu FOREIGN KEY
	(
	menuId
	) REFERENCES dbo.bhdMenu
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO