﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18033
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ResourcesData
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="justfyty_justfo")]
	public partial class ResourcesDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertbhdResourceType(bhdResourceType instance);
    partial void UpdatebhdResourceType(bhdResourceType instance);
    partial void DeletebhdResourceType(bhdResourceType instance);
    partial void InsertbhdFile(bhdFile instance);
    partial void UpdatebhdFile(bhdFile instance);
    partial void DeletebhdFile(bhdFile instance);
    partial void InsertbhdFileType(bhdFileType instance);
    partial void UpdatebhdFileType(bhdFileType instance);
    partial void DeletebhdFileType(bhdFileType instance);
    partial void InsertbhdResource(bhdResource instance);
    partial void UpdatebhdResource(bhdResource instance);
    partial void DeletebhdResource(bhdResource instance);
    partial void InsertbhdResourceLanguage(bhdResourceLanguage instance);
    partial void UpdatebhdResourceLanguage(bhdResourceLanguage instance);
    partial void DeletebhdResourceLanguage(bhdResourceLanguage instance);
    partial void InsertbhdResourceTopic(bhdResourceTopic instance);
    partial void UpdatebhdResourceTopic(bhdResourceTopic instance);
    partial void DeletebhdResourceTopic(bhdResourceTopic instance);
    #endregion
		
		public ResourcesDataContext() : 
				base(global::ResourcesWebApi.Properties.Settings.Default.justfyty_justfoConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public ResourcesDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ResourcesDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ResourcesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ResourcesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<bhdFeaturedResource> bhdFeaturedResources
		{
			get
			{
				return this.GetTable<bhdFeaturedResource>();
			}
		}
		
		public System.Data.Linq.Table<bhdResourceType> bhdResourceTypes
		{
			get
			{
				return this.GetTable<bhdResourceType>();
			}
		}
		
		public System.Data.Linq.Table<bhdFile> bhdFiles
		{
			get
			{
				return this.GetTable<bhdFile>();
			}
		}
		
		public System.Data.Linq.Table<bhdFileType> bhdFileTypes
		{
			get
			{
				return this.GetTable<bhdFileType>();
			}
		}
		
		public System.Data.Linq.Table<bhdResource> bhdResources
		{
			get
			{
				return this.GetTable<bhdResource>();
			}
		}
		
		public System.Data.Linq.Table<bhdResourceFile> bhdResourceFiles
		{
			get
			{
				return this.GetTable<bhdResourceFile>();
			}
		}
		
		public System.Data.Linq.Table<bhdResourceLanguage> bhdResourceLanguages
		{
			get
			{
				return this.GetTable<bhdResourceLanguage>();
			}
		}
		
		public System.Data.Linq.Table<bhdResourceRating> bhdResourceRatings
		{
			get
			{
				return this.GetTable<bhdResourceRating>();
			}
		}
		
		public System.Data.Linq.Table<bhdResourceTopic> bhdResourceTopics
		{
			get
			{
				return this.GetTable<bhdResourceTopic>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdFeaturedResources")]
	public partial class bhdFeaturedResource
	{
		
		private int _resourceId;
		
		private bool _isFrontPage;
		
		private System.DateTime _startDate;
		
		private System.DateTime _endDate;
		
		private bool _isActive;
		
		public bhdFeaturedResource()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resourceId", DbType="Int NOT NULL")]
		public int resourceId
		{
			get
			{
				return this._resourceId;
			}
			set
			{
				if ((this._resourceId != value))
				{
					this._resourceId = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isFrontPage", DbType="Bit NOT NULL")]
		public bool isFrontPage
		{
			get
			{
				return this._isFrontPage;
			}
			set
			{
				if ((this._isFrontPage != value))
				{
					this._isFrontPage = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_startDate", DbType="DateTime NOT NULL")]
		public System.DateTime startDate
		{
			get
			{
				return this._startDate;
			}
			set
			{
				if ((this._startDate != value))
				{
					this._startDate = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_endDate", DbType="DateTime NOT NULL")]
		public System.DateTime endDate
		{
			get
			{
				return this._endDate;
			}
			set
			{
				if ((this._endDate != value))
				{
					this._endDate = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this._isActive = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResourceType")]
	public partial class bhdResourceType : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _name;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdResourceType()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdFile")]
	public partial class bhdFile : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private int _fileTypeId;
		
		private string _name;
		
		private int _size;
		
		private System.Data.Linq.Binary _data;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnfileTypeIdChanging(int value);
    partial void OnfileTypeIdChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnsizeChanging(int value);
    partial void OnsizeChanged();
    partial void OndataChanging(System.Data.Linq.Binary value);
    partial void OndataChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdFile()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fileTypeId", DbType="Int NOT NULL")]
		public int fileTypeId
		{
			get
			{
				return this._fileTypeId;
			}
			set
			{
				if ((this._fileTypeId != value))
				{
					this.OnfileTypeIdChanging(value);
					this.SendPropertyChanging();
					this._fileTypeId = value;
					this.SendPropertyChanged("fileTypeId");
					this.OnfileTypeIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_size", DbType="Int NOT NULL")]
		public int size
		{
			get
			{
				return this._size;
			}
			set
			{
				if ((this._size != value))
				{
					this.OnsizeChanging(value);
					this.SendPropertyChanging();
					this._size = value;
					this.SendPropertyChanged("size");
					this.OnsizeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_data", DbType="Image NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary data
		{
			get
			{
				return this._data;
			}
			set
			{
				if ((this._data != value))
				{
					this.OndataChanging(value);
					this.SendPropertyChanging();
					this._data = value;
					this.SendPropertyChanged("data");
					this.OndataChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdFileType")]
	public partial class bhdFileType : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _name;
		
		private System.Data.Linq.Binary _icon;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OniconChanging(System.Data.Linq.Binary value);
    partial void OniconChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdFileType()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_icon", DbType="Image", UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary icon
		{
			get
			{
				return this._icon;
			}
			set
			{
				if ((this._icon != value))
				{
					this.OniconChanging(value);
					this.SendPropertyChanging();
					this._icon = value;
					this.SendPropertyChanged("icon");
					this.OniconChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResource")]
	public partial class bhdResource : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _name;
		
		private string _description;
		
		private int _typeId;
		
		private int _languageId;
		
		private int _topicId;
		
		private System.DateTime _uploadDate;
		
		private int _uploadUser;
		
		private System.Nullable<System.DateTime> _approvalDate;
		
		private System.Nullable<int> _approvalUser;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OndescriptionChanging(string value);
    partial void OndescriptionChanged();
    partial void OntypeIdChanging(int value);
    partial void OntypeIdChanged();
    partial void OnlanguageIdChanging(int value);
    partial void OnlanguageIdChanged();
    partial void OntopicIdChanging(int value);
    partial void OntopicIdChanged();
    partial void OnuploadDateChanging(System.DateTime value);
    partial void OnuploadDateChanged();
    partial void OnuploadUserChanging(int value);
    partial void OnuploadUserChanged();
    partial void OnapprovalDateChanging(System.Nullable<System.DateTime> value);
    partial void OnapprovalDateChanged();
    partial void OnapprovalUserChanging(System.Nullable<int> value);
    partial void OnapprovalUserChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdResource()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_description", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
		public string description
		{
			get
			{
				return this._description;
			}
			set
			{
				if ((this._description != value))
				{
					this.OndescriptionChanging(value);
					this.SendPropertyChanging();
					this._description = value;
					this.SendPropertyChanged("description");
					this.OndescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_typeId", DbType="Int NOT NULL")]
		public int typeId
		{
			get
			{
				return this._typeId;
			}
			set
			{
				if ((this._typeId != value))
				{
					this.OntypeIdChanging(value);
					this.SendPropertyChanging();
					this._typeId = value;
					this.SendPropertyChanged("typeId");
					this.OntypeIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_languageId", DbType="Int NOT NULL")]
		public int languageId
		{
			get
			{
				return this._languageId;
			}
			set
			{
				if ((this._languageId != value))
				{
					this.OnlanguageIdChanging(value);
					this.SendPropertyChanging();
					this._languageId = value;
					this.SendPropertyChanged("languageId");
					this.OnlanguageIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_topicId", DbType="Int NOT NULL")]
		public int topicId
		{
			get
			{
				return this._topicId;
			}
			set
			{
				if ((this._topicId != value))
				{
					this.OntopicIdChanging(value);
					this.SendPropertyChanging();
					this._topicId = value;
					this.SendPropertyChanged("topicId");
					this.OntopicIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_uploadDate", DbType="DateTime NOT NULL")]
		public System.DateTime uploadDate
		{
			get
			{
				return this._uploadDate;
			}
			set
			{
				if ((this._uploadDate != value))
				{
					this.OnuploadDateChanging(value);
					this.SendPropertyChanging();
					this._uploadDate = value;
					this.SendPropertyChanged("uploadDate");
					this.OnuploadDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_uploadUser", DbType="Int NOT NULL")]
		public int uploadUser
		{
			get
			{
				return this._uploadUser;
			}
			set
			{
				if ((this._uploadUser != value))
				{
					this.OnuploadUserChanging(value);
					this.SendPropertyChanging();
					this._uploadUser = value;
					this.SendPropertyChanged("uploadUser");
					this.OnuploadUserChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_approvalDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> approvalDate
		{
			get
			{
				return this._approvalDate;
			}
			set
			{
				if ((this._approvalDate != value))
				{
					this.OnapprovalDateChanging(value);
					this.SendPropertyChanging();
					this._approvalDate = value;
					this.SendPropertyChanged("approvalDate");
					this.OnapprovalDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_approvalUser", DbType="Int")]
		public System.Nullable<int> approvalUser
		{
			get
			{
				return this._approvalUser;
			}
			set
			{
				if ((this._approvalUser != value))
				{
					this.OnapprovalUserChanging(value);
					this.SendPropertyChanging();
					this._approvalUser = value;
					this.SendPropertyChanged("approvalUser");
					this.OnapprovalUserChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResourceFile")]
	public partial class bhdResourceFile
	{
		
		private int _fileId;
		
		private int _resourceId;
		
		public bhdResourceFile()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fileId", DbType="Int NOT NULL")]
		public int fileId
		{
			get
			{
				return this._fileId;
			}
			set
			{
				if ((this._fileId != value))
				{
					this._fileId = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resourceId", DbType="Int NOT NULL")]
		public int resourceId
		{
			get
			{
				return this._resourceId;
			}
			set
			{
				if ((this._resourceId != value))
				{
					this._resourceId = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResourceLanguage")]
	public partial class bhdResourceLanguage : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _name;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdResourceLanguage()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResourceRating")]
	public partial class bhdResourceRating
	{
		
		private int _resourceId;
		
		private int _userId;
		
		private int _rating;
		
		public bhdResourceRating()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resourceId", DbType="Int NOT NULL")]
		public int resourceId
		{
			get
			{
				return this._resourceId;
			}
			set
			{
				if ((this._resourceId != value))
				{
					this._resourceId = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_userId", DbType="Int NOT NULL")]
		public int userId
		{
			get
			{
				return this._userId;
			}
			set
			{
				if ((this._userId != value))
				{
					this._userId = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_rating", DbType="Int NOT NULL")]
		public int rating
		{
			get
			{
				return this._rating;
			}
			set
			{
				if ((this._rating != value))
				{
					this._rating = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.bhdResourceTopics")]
	public partial class bhdResourceTopic : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private System.Nullable<int> _parentId;
		
		private string _name;
		
		private string _Description;
		
		private bool _isActive;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnparentIdChanging(System.Nullable<int> value);
    partial void OnparentIdChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnisActiveChanging(bool value);
    partial void OnisActiveChanged();
    #endregion
		
		public bhdResourceTopic()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_parentId", DbType="Int")]
		public System.Nullable<int> parentId
		{
			get
			{
				return this._parentId;
			}
			set
			{
				if ((this._parentId != value))
				{
					this.OnparentIdChanging(value);
					this.SendPropertyChanging();
					this._parentId = value;
					this.SendPropertyChanged("parentId");
					this.OnparentIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this.OnDescriptionChanging(value);
					this.SendPropertyChanging();
					this._Description = value;
					this.SendPropertyChanged("Description");
					this.OnDescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_isActive", DbType="Bit NOT NULL")]
		public bool isActive
		{
			get
			{
				return this._isActive;
			}
			set
			{
				if ((this._isActive != value))
				{
					this.OnisActiveChanging(value);
					this.SendPropertyChanging();
					this._isActive = value;
					this.SendPropertyChanged("isActive");
					this.OnisActiveChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
