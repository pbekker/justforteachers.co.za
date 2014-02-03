USE [justfyty_justfo]
GO
IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sps_getResourceTopic'))
BEGIN
	DROP PROCEDURE dbo.[sps_getResourceTopic]
END
GO

CREATE PROCEDURE [dbo].[sps_getResourceTopic]
 @parentId int = NULL
AS
BEGIN
	 ;WITH resourcePerTopic 
	 AS (
	  SELECT r.topicId, COUNT(r.topicId) linkedResources
	  FROM bhdResource r (NOLOCK)
	  GROUP BY r.topicId
	 )
 
 
	 SELECT * 
	 FROM bhdResourceTopics rt (NOLOCK)
	 LEFT JOIN resourcePerTopic rpt (NOLOCK) ON rpt.topicId = rt.id
	 WHERE isActive = 1 
	 AND (rt.parentId = @parentId OR @parentId IS NULL)
END
GO