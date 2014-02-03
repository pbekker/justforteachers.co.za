USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceListByKeywordList'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceListByKeywordList
END
GO

CREATE PROCEDURE dbo.sps_getResourceListByKeywordList
	@keywords VARCHAR(MAX),
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

	DECLARE @SQLString VARCHAR(MAX)
	SET @SQLString = @keywords + ',';
	;WITH Nbrs_3(n) AS (SELECT 1 UNION SELECT 0),
	Nbrs_2(n) AS (SELECT 1 FROM Nbrs_3 n1 CROSS JOIN Nbrs_3 n2),
	Nbrs_1(n) AS (SELECT 1 FROM Nbrs_2 n1 CROSS JOIN Nbrs_2 n2),
	Nbrs_0(n) AS (SELECT 1 FROM Nbrs_1 n1 CROSS JOIN Nbrs_1 n2),
	Nbrs  (n) AS (SELECT 1 FROM Nbrs_0 n1 CROSS JOIN Nbrs_0 n2)


	, resources AS
	(SELECT 
		r.id,
		r.name,
		r.previewFileId,
		l.name [language],
		t.name [topic],
		rt.name [type],
		rr.rating,
		r.[description],
		r.uploadDate,
		r.uploadUser,
		ROW_NUMBER() OVER 
                     (ORDER BY r.id) AS rowNumber
					 
	FROM bhdKeyword kw (NOLOCK)
		JOIN bhdResourceKeyword rkw (NOLOCK) ON rkw.KeywordId = kw.id
		JOIN bhdResource r	(NOLOCK) ON r.id = rkw.Resourceid
		JOIN bhdResourceLanguage l (NOLOCK) ON l.id = r.languageId
		JOIN bhdResourceTopics t (NOLOCK) ON t.id = r.topicId
		JOIN bhdResourceType rt (NOLOCK) ON rt.id = r.typeId
		LEFT JOIN bhdResourceRating rr (NOLOCK) ON rr.resourceId = r.id
	WHERE r.isActive = @active
		 AND kw.value IN (
				SELECT SUBSTRING(@SQLString, n+1, CHARINDEX(',', @SQLString, n+1) - n-1)
				FROM
				(
					SELECT 0 AS 'n' 
					UNION ALL 
					SELECT TOP(LEN(@SQLString)-1) ROW_NUMBER() OVER (ORDER BY n) AS 'n'
					FROM Nbrs
				) x
				WHERE SUBSTRING(@SQLString, n, 1) = ',' OR n = 0
			)
	)

	SELECT 
		r.id,
		r.name,
		r.previewFileId,
		r.[language],
		r.topic,
		r.[type],
		r.rating,
		r.[description],
		r.uploadDate,
		r.uploadUser,
		(SELECT COUNT(*) FROM resources) total

	FROM resources r (NOLOCK)
	WHERE
		r.rowNumber >= @startRow AND r.rowNumber <= @endRow 
	ORDER BY
		CASE WHEN @orderby = 'name' AND @orderDirection = 'ASC' THEN r.name END,
		CASE WHEN @orderby = 'name' AND @orderDirection != 'DESC' THEN r.name END DESC,
		CASE WHEN @orderby = 'rating' AND @orderDirection = 'ASC' THEN r.rating END, 
		CASE WHEN @orderby = 'rating' AND @orderDirection != 'DESC' THEN r.rating END DESC,
		CASE WHEN @orderby = 'uploadDate' AND @orderDirection = 'ASC' THEN r.uploadDate END,
		CASE WHEN @orderby = 'uploadDate' AND @orderDirection != 'DESC' THEN r.uploadDate END DESC
END
GO

DECLARE @keywords VARCHAR(MAX) = 'this, resource, is, in, the, world, somewhere, it, doesnt, matter, how, many, are, here'
EXEC  sps_getResourceListByKeywordList @keywords, 1, 1, 20, 'qwe', 'qwe'


