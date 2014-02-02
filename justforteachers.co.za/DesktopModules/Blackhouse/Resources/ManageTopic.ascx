<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageTopic.ascx.cs" Inherits="Blackhouse.Resources.ManageTopic" %>

<asp:GridView runat="server" ID="gvTopics" AutoGenerateColumns="true">

</asp:GridView>

<div>
    <asp:HiddenField runat="server" ID="hidTopicId" />
    <div><asp:Label runat="server" ID="lblParent" Text="Please select Phase:" /><asp:DropDownList runat="server" ID="ddParentId" /></div>
    <div><asp:Label runat="server" ID="lblSubject" Text="Please select Subject:" /><asp:DropDownList runat="server" ID="ddSubject" /></div>
    <div><asp:Label runat="server" ID="lblName" Text="Please enter Topic Name:" /> <asp:TextBox runat="server" ID="txtName" /></div>
    <div><asp:Label runat="server" ID="lblDesc" Text="Please give a Description of the topic:" /><asp:TextBox runat="server" ID="txtDesc" /></div>
    <div><asp:CheckBox runat="server" ID="chkActive" Checked="true" /></div>
    <div><asp:LinkButton runat="server" ID="cmdCancel" Text="Cancel" OnClick="cmdCancel_Click" /> &nbsp; <asp:LinkButton runat="server" ID="cmdSave" Text="Save" OnClick="cmdSave_Click" /></div>
</div>