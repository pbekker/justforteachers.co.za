<%@ Control Language="C#" AutoEventWireup="True"
	Inherits="ToSic.EAV.ManagementUI.ContentTypesList" Codebehind="ContentTypesList.ascx.cs" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<asp:EntityDataSource ID="dsrcAttributeSets" runat="server" ConnectionString="name=EAVContext"
			DefaultContainerName="EAVContext" EntitySetName="AttributeSets"
			EnableDelete="True" EnableViewState="False" EnableFlattening="False" StoreOriginalValuesInViewState="False"
			Include="AttributesInSets,Entities" OrderBy="it.Name" 
			OnContextCreating="dsrcAttributeSets_ContextCreating" 
			OnDeleting="dsrcAttributeSets_Deleting" 
			Where="it.ChangeLogIDDeleted IS NULL AND (it.Scope = @Scope OR @Scope IS NULL) AND it.AppID = @AppID" 
			onselecting="dsrcAttributeSets_Selecting">
			<WhereParameters>
				<asp:Parameter Name="Scope" Size="50" Type="String" />
				<asp:Parameter Name="AppID" Type="Int32" />
			</WhereParameters>
		</asp:EntityDataSource>
		<asp:QueryExtender ID="qeAttributeSets" runat="server" TargetControlID="dsrcAttributeSets">
			<asp:SearchExpression SearchType="Contains" DataFields="Name,Description">
				<asp:ControlParameter ControlID="SearchTextBox" />
			</asp:SearchExpression>
		</asp:QueryExtender>
		Filter:
		<asp:TextBox runat="server" ID="SearchTextBox" AutoPostBack="true" />
		<asp:LinkButton Text="Refresh" runat="server" ID="lbtnRefreshData" OnClick="lbtnRefreshData_Click"
			ClientIDMode="Static" Style="display: block" />
		<asp:GridView ID="grdAttributeSets" runat="server" AutoGenerateColumns="False" DataSourceID="dsrcAttributeSets"
			DataKeyNames="AttributeSetID" CssClass="EAVAttributeSets">
			<Columns>
				<asp:BoundField DataField="AttributeSetID" HeaderText="AttributeSetID" Visible="false" />
				<asp:BoundField DataField="Name" HeaderText="Name" />
				<asp:BoundField DataField="Description" HeaderText="Description" />
				<asp:TemplateField HeaderText="Fields">
					<ItemTemplate>
						<asp:Label ID="lblFieldsCount" Text='<%# Eval("AttributesInSets.Count") %>' runat="server" />&nbsp;<asp:HyperLink
							ID="hlnkDesignFields" NavigateUrl='<%# GetDesignFieldsUrl(Eval("AttributeSetID")) %>'
							Text="Design" CssClass='<%# UseDialogs ? "Dialog" : "" %>' runat="server" />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Records">
					<ItemTemplate>
						<asp:Label ID="lblRecordsCount" runat="server" Text='<%# Eval("Entities.Count") %>' />
						<asp:HyperLink ID="hlnkShowItems" NavigateUrl='<%# GetShowItemsUrl(Eval("AttributeSetID")) %>'
							runat="server" CssClass='<%# UseDialogs ? "Dialog" : "" %>' Text="Show Items" />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<ItemTemplate>
						<asp:HyperLink ID="hlnkConfigureContentType" NavigateUrl='<%# GetConfigureContentTypeUrl(Eval("AttributeSetID")) %>'
							Text="Edit" CssClass='<%# UseDialogs ? "Dialog" : "" %>' runat="server" />&nbsp;<asp:LinkButton ID="lbtnDeleteField"
								Text="Delete" runat="server" CommandName="Delete" OnClientClick='return confirm("Are you sure you want to delete this entry?");' />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<RowStyle VerticalAlign="Top" />
		</asp:GridView>
	</ContentTemplate>
</asp:UpdatePanel>
<asp:HyperLink ID="hlnkNewContentType" NavigateUrl='<%# GetNewContentTypeUrl() %>' runat="server" CssClass='<%# UseDialogs ? "Dialog" : "" %>' Text="New Content Type" />