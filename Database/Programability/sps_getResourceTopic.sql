USE [justfyty_justfo]
GO
/****** Object:  StoredProcedure [dbo].[sps_getResourceTopic]    Script Date: 2/3/2014 11:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sps_getResourceTopic]
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