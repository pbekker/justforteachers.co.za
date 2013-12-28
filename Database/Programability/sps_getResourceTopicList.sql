USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceTopicList'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceTopicList
END
GO

CREATE PROCEDURE dbo.sps_getResourceTopicList
	@active bit = 0
AS
BEGIN
	;WITH parentTopic AS
	(
		SELECT 
			rt.id,
			rt.parentId,
			rt.name,
			rt.[description],
			rt.isActive
		FROM bhdResourceTopics rt (NOLOCK)
		WHERE rt.isActive = @active
	)

	SELECT 
		rt.id,
		rt.parentId,
		rt.name,
		rt.[description],
		pt.name parentName,
		pt.[description] parentDescription
	FROM bhdResourceTopics rt (NOLOCK)
	LEFT JOIN parentTopic pt ON pt.id = rt.parentId
	WHERe rt.isActive = @active
	ORDER BY parentId 
END
GO
EXEC sps_getResourceTopicList 1