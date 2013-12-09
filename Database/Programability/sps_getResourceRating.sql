USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceRating'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceRating
END
GO

CREATE PROCEDURE dbo.sps_getResourceRating
	@resourceId int,
	@userId int
AS
BEGIN

	DECLARE @exists bit  = 0
	IF EXISTS(SELECT * FROM bhdResourceRating rr (NOLOCK) WHERE rr.resourceId = @resourceId AND rr.userId = @userId)
		SET @exists = 1

	SELECT 
		ISNULL(SUM(rating), 0) sumRating,
		COUNT(rating) countRating,
		@exists [rated]
	FROM bhdResourceRating rr (NOLOCK)
	WHERE rr.resourceId = @resourceId

END
GO

EXEC sps_getResourceRating @resourceID = 0, @userID = 0