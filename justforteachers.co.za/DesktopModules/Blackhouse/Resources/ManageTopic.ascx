<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageTopic.ascx.cs" Inherits="Blackhouse.Resources.ManageTopic" %>


<div id="divTopics" runat="server">
    <asp:TreeView runat="server" ID="tvTopics" OnSelectedNodeChanged="tvTopics_SelectedNodeChanged" />
    <div>
        <asp:LinkButton runat="server" ID="cmdAdd" Text="Add Topic" OnClick="cmdAdd_Click" />
    </div>
</div>

<div id="divAddEdit" runat="server">
    <div>
        <asp:HiddenField runat="server" ID="hidTopicId" />
        <asp:UpdatePanel runat="server" ID="upAddEdit" RenderMode="Block" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <div>
                    <asp:Label runat="server" ID="lblParent" Text="Please select Phase:" /><asp:DropDownList runat="server" ID="ddParentId" OnSelectedIndexChanged="ddParent_SelectedIndexChanged" AutoPostBack="True" />
                </div>
                <div id="divSubject" runat="server" visible="false">
                    <asp:Label runat="server" ID="lblSubject" Text="Please select Subject:" /><asp:DropDownList runat="server" ID="ddSubject" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div>
            <asp:Label runat="server" ID="lblName" Text="Please enter Topic Name:" />
            <asp:TextBox runat="server" ID="txtName" />
        </div>
        <div>
            <asp:Label runat="server" ID="lblDesc" Text="Please give a Description of the topic:" /><asp:TextBox runat="server" ID="txtDesc" />
        </div>
        <div>
            <asp:CheckBox runat="server" ID="chkActive" Checked="true" Text="Activate" />
        </div>
        <div>
            <asp:LinkButton runat="server" ID="cmdCancel" Text="Cancel" OnClick="cmdCancel_Click" />
            &nbsp;
            <asp:LinkButton runat="server" ID="cmdSave" Text="Save" OnClick="cmdSave_Click" />
        </div>
    </div>
</div>

