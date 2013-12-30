USE [justfyty_justfo]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceBundleByUserId'))
BEGIN
	DROP PROCEDURE dbo.sps_getResourceBundleByUserId
END
GO

CREATE PROCEDURE dbo.sps_getResourceBundleByUserId
	@userId int
AS
BEGIN
	SELECT 
		rb.bundleId,
		rb.name,
		rb.[description],
		rbf.isFavourite,
		f.id fileid,
		f.name [fileName],
		f.size [fileSize],
		ft.name [fileType],
		ft.extension [fileExtension],
		r.isActive
	FROM bhdResourceBundle rb (NOLOCK)
		JOIN bhdResourceBundleFile rbf (NOLOCK) ON rbf.bundleId = rb.bundleId
		JOIN bhdResourceFile rf (NOLOCK) ON rf.fileId = rbf.resourceFileId
		JOIN bhdResource r (NOLOCK) ON r.id = rf.resourceId
		JOIN bhdFile f (NOLOCK) ON f.id = rf.fileId
		JOIN bhdFileType ft (NOLOCK) ON ft.id = f.fileTypeId
	WHERE rb.isActive = 1
	 AND rb.userId = @userId
END