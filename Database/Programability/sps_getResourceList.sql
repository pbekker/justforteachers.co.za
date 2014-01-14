USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceList'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceList
END
GO

CREATE PROCEDURE dbo.sps_getResourceList
	@active bit = 0,
	@pageNumber int,
	@pageSize int = 20,
	@orderby varchar(50) = 'name',
	@orderDirection CHAR(4) = 'ASC'
AS
BEGIN

	DECLARE @startRow int = ((@pageNumber - 1) * @pageSize) + 1
	IF (@startRow = 0) SET @startRow = 1
	DECLARE @endRow int = (@startRow - 1) + @pageSize

	;WITH resources AS
	(SELECT 
		r.id,
		r.name,
		l.name [language],
		t.name [topic],
		rt.name [type],
		rr.rating,
		r.[description],
		r.uploadDate,
		r.uploadUser,
		r.previewFileId,
		ROW_NUMBER() OVER 
                     (ORDER BY r.id) AS rowNumber
					 
	FROM bhdResource r	(NOLOCK)
		JOIN bhdResourceLanguage l (NOLOCK) ON l.id = r.languageId
		JOIN bhdResourceTopics t (NOLOCK) ON t.id = r.topicId
		JOIN bhdResourceType rt (NOLOCK) ON rt.id = r.typeId
		LEFT JOIN bhdResourceRating rr (NOLOCK) ON rr.resourceId = r.id
	WHERE r.isActive = @active
	)

	SELECT 
		r.id,
		r.name,
		r.[language],
		r.topic,
		r.[type],
		r.rating,
		r.[description],
		r.uploadDate,
		r.uploadUser,
		r.previewFileId,
		(SELECT COUNT(*) FROM resources) total
	FROM resources r (NOLOCK)
	WHERE
		r.rowNumber >= @startRow AND r.rowNumber <= @endRow 
	ORDER BY
		CASE WHEN @orderby = 'name' AND @orderDirection = 'ASC' THEN r.name END,
		CASE WHEN @orderby = 'name' AND @orderDirection != 'ASC' THEN r.name END DESC,
		CASE WHEN @orderby = 'rating' AND @orderDirection = 'ASC' THEN r.rating END, 
		CASE WHEN @orderby = 'rating' AND @orderDirection != 'ASC' THEN r.rating END DESC,
		CASE WHEN @orderby = 'uploadDate' AND @orderDirection = 'ASC' THEN r.uploadDate END,
		CASE WHEN @orderby = 'uploadDate' AND @orderDirection != 'ASC' THEN r.uploadDate END DESC

	
END
GO
EXEC sps_getResourceList 0, 1, 20, 'qwe', 'qwe'