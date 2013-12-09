USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceList'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceList
END
GO

CREATE PROCEDURE dbo.sps_getResourceList
	@active bit = 0
AS
BEGIN

	SELECT 
		r.id,
		r.name,
		l.name [language],
		t.name [topic],
		rt.name [type],
		r.[description],
		r.uploadDate,
		r.uploadUser
	
	FROM bhdResource r	(NOLOCK)
		JOIN bhdResourceLanguage l (NOLOCK) ON l.id = r.languageId
		JOIN bhdResourceTopics t (NOLOCK) ON t.id = r.topicId
		JOIN bhdResourceType rt (NOLOCK) ON rt.id = r.typeId
	WHERE r.isActive = @active
END
GO


GO

EXEC sps_getResourceList