<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CultureSelector.ascx.cs"
	Inherits="ToSic.EAV.ManagementUI.CultureSelector" %>
<asp:ObjectDataSource ID="dsrcCultureDimension" runat="server" SelectMethod="GetDimensionChildren"
	TypeName="ToSic.EAV.Library.EAVContext" OnObjectCreating="dsrcCultureDimension_ObjectCreating">
	<SelectParameters>
		<asp:Parameter Name="SystemKey" Type="String" DefaultValue="Culture" />
	</SelectParameters>
</asp:ObjectDataSource>
<asp:DropDownList ID="ddlCultureDimension" runat="server" AppendDataBoundItems="True"
	AutoPostBack="True" DataSourceID="dsrcCultureDimension" DataTextField="Name"
	DataValueField="DimensionID" OnDataBound="ddlCultureDimension_DataBound" 
	OnSelectedIndexChanged="ddlCultureDimension_SelectedIndexChanged">
</asp:DropDownList>
