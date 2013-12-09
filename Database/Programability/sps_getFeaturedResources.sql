USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getFeaturedResources'))
BEGIN
	DROP PROCEDURE dbo.sps_getFeaturedResources
END
GO

CREATE PROCEDURE dbo.sps_getFeaturedResources
	@portalId int = 0,
	@isFrontPage bit = 0
AS
BEGIN
	SELECT 
		r.id,
		r.name,
		r.[description],
		l.name [language],
		t.name [topic],
		rt.name [type],
		r.uploadDate
	FROM bhdFeaturedResources fr (NOLOCK)
		JOIN bhdResource r (NOLOCK) ON r.id = fr.resourceId
		JOIN bhdResourceLanguage l (NOLOCK) ON l.id = r.languageId
		JOIN bhdResourceTopics t (NOLOCK) ON t.id = r.topicId
		JOIN bhdResourceType rt (NOLOCK) ON rt.id = r.typeId
	WHERE fr.isActive = 1 
		AND fr.portalId = @portalId 
		AND fr.isFrontPage = @isFrontPage
	ORDER BY fr.sequence ASC
END
GO

EXEC sps_getFeaturedResources