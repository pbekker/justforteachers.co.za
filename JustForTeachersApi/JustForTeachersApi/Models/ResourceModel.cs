﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace JustForTeachersApi.Models
{
    public class ResourceModel
    {

    }

    public class UploadModel
    {
        public UploadData model { get; set; }
        public List<UploadFile> files { get; set; }
    }

    public class FeaturedResourceModel
    {
        public int ResourceId { get; set; }
        public int PortalId { get; set; }
        public int Sequence { get; set; }
        public DateTime sDate { get; set; }
        public DateTime eDate { get; set; }
    }

    public class UploadFile
    {
        public string name { get; set; }
        public string size { get; set; }
        public string type { get; set; }
    }

    public class UploadData
    {
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public int ResourceTypeId { get; set; }
        public int ResourceLanguageId { get; set; }
        public int ResourceTopicId { get; set; }
        public int ResourceFormatId { get; set; }
        public int PortalId { get; set; }
    }

    public class GenDropList
    {
        public int ListId { get; set; }
        public string ListValue { get; set; }
    }

    public class ResourcePayload
    {
        public List<GenDropList> types { get; set; }
        public List<GenDropList> languages { get; set; }
        public List<GenDropList> formats { get; set; }
        public DataTable topics { get; set; }
    }

    public class ResourceListPayload
    {
        public int count { get; set; }
        public List<ResourceList> resourceList { get; set; }
    }

    public class ResourceViewPayload
    {
        public ResourceList resourceInfo { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
        public List<LinkViewInfo> urlInfo { get; set; }
        public List<Comment> comments { get; set; }
        public int averageRating { get; set; }
        public int ratingCount { get; set; }
    }

    public class Comment
    {
        public int commentId { get; set; }
        public int resourceId { get; set; }
        public int userId { get; set; }
        public DateTime commentDate { get; set; }
        public bool active { get; set; }
        public string comment { get; set; }

    }

    public class FileViewInfo
    {
        public string FileName { get; set; } 
        public int  FileSize { get; set; }
        public string FileContentType { get; set; }
        public int FileId { get; set; }
        public int authorId { get; set; }
        public int publisherId { get; set; }
        public int year { get; set; }
    }

    public class LinkViewInfo
    {
        public string resourceURL { get; set; }
    }

    public class ResourceList
    {
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public string ResourceTopic { get; set; }
        public string ResourceType { get; set; }
        public string ResourceLanguage { get; set; }
        public string ResourceUploadDate { get; set; }
        public string ResourceTags { get; set; }
        public string ResourceFormat { get; set; }
        public int PreviewFileId { get; set; }
        public string PreviewFileString { get; set; }
        public bool isActive { get; set; }
    }

    public class ResourceFeaturedPayload
    {
        public List<ResourceList> resourceList { get; set; }
    }

    public class ResourceApprovePayload
    {
        public List<ResourceList> resourceList { get; set; }
    }

    public class ResourceBundle
    {
        public int bundleId {get; set;}
        public string name {get;set;}
		public string description {get;set;}
		public int fileId {get; set; }
		public string fileName {get; set;}
		public long fileSize {get; set;}
		public string fileType {get;set;}
		public string fileExtension {get;set;}
        public bool isActive { get; set; }
        public bool isFavourite { get; set; }
    }

    public class FileData
    {
        public string fileName { get; set; }
        public string fileType { get; set; }
        public int fileSize { get; set; }
        public byte[] fileData { get; set; }
    }

    public class LessonPlan
    {
        public List<FileData> fileData { get; set; }
        public string linkUrl { get; set; }
    }

    public class ResourceFile
    {
        public int fileid { get; set; }
        public string filename { get; set; }
    }

    public class AuthorData
    {
        public string AuthorName { get; set; }
        public string AuthorSurname { get; set; }
    }

    public class PublisherData
    {
        public string PublisherName { get; set; }
        public string PublisherSurname { get; set; }
    }

    public class FileInfoData
    {
        public int resourceid { get; set; }
        public int fileid { get; set; }
        public int authorid { get; set; }
        public int publisherid { get; set; }
        public int publishYear { get; set; }
    }

    public class FileDownloadData
    {
        public string ContentType { get; set; }
        public string ContentLength { get; set; }
        public string ContentDisposition { get; set; }
        public string ContentDispositionFileName { get; set; }
        public byte[] FileData { get; set; }
    }

    public class TagsInfo
    {
        public int ResourceId { get; set; }
        public List<string> tags { get; set; }
    }

    public class ResourceEditPayload
    {
        public ResourceEditList resourceInfo { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
        public List<LinkViewInfo> urlInfo { get; set; }
    }

    public class ResourceEditList
    {
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public string ResourceTopic { get; set; }
        public int ResourceTopicId { get; set; }
        public string ResourceType { get; set; }
        public int ResourceTypeId { get; set; }
        public string ResourceLanguage { get; set; }
        public int ResourceLanguageId { get; set; }
        public string ResourceUploadDate { get; set; }
        public string ResourceTags { get; set; }
        public bool isActive { get; set; }
    }

    public class ResourceEditSend
    {
        public ResourceEditList resourceInfo { get; set; }
        public TagsInfo tagsInfo { get; set; }
        public string URL { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
    }

    public class TopicInfo
    {
        public int topicId { get; set; }
        public int? parentId { get; set; }
        public string name { get; set; }

    }
}