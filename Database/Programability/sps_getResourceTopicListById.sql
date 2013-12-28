USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceTopicListById'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceTopicListById
END
GO

CREATE PROCEDURE dbo.sps_getResourceTopicListById
	@topicId int = NULL,
	@active bit = 1
AS
BEGIN

	DECLARE @parentId INT = (SELECT parentId FROM bhdResourceTopics rt (NOLOCK) WHERE  rt.id = @topicId)

	CREATE TABLE #tempTopicTree
	(
		id INT,
		parentId INT,
		name VARCHAR(250),
		[description] VARCHAR(MAX),
		parentName VARCHAR(250),
		parentDescription VARCHAR(MAX)
	)

	WHILE @topicId is not null
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

		
		INSERT INTO #tempTopicTree
		SELECT 
			rt.id,
			rt.parentId,
			rt.name,
			rt.[description],
			pt.name parentName,
			pt.[description] parentDescription
		FROM bhdResourceTopics rt (NOLOCK)
		LEFT JOIN parentTopic pt ON pt.id = rt.parentId
		WHERE rt.isActive = @active
			AND (rt.id = @topicId OR @topicId is null)
		ORDER BY parentId 
		SET @topicId = @parentId
		SET @parentId = (SELECT parentId FROM bhdResourceTopics rt (NOLOCK) WHERE  rt.id = @topicId)
	END

	SELECT * 
	FROM #tempTopicTree
	ORDER BY id

	DROP TABLE #tempTopicTree
END
GO
EXEC sps_getResourceTopicListById @topicId = 3,  @active = 1