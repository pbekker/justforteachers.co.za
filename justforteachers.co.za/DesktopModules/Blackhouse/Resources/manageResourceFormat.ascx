<%@ Control Language="C#" AutoEventWireup="true" CodeFile="manageResourceFormat.ascx.cs" Inherits="Blackhouse.Resources.manageResourceFormat" %>

<div runat="server" id="divFormats">
    <div>
       <%-- <asp:UpdatePanel runat="server" ID="upGrid" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
                <asp:GridView runat="server" ID="gvResourceFormat" AutoGenerateColumns="false" OnRowDataBound="gvResourceFormat_RowDataBound" OnRowCommand="gvResourceFormat_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Format Id">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFormatId" Text="Id" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Format Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblName" Text="name" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkActive" Checked="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="cmdEdit" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <div>
        <asp:LinkButton runat="server" ID="cmdAdd" Text="Add" OnClick="cmdAdd_Click" />
    </div>
</div>

<div runat="server" id="divAddEdit">
    <asp:HiddenField runat="server" ID="hidFormatId" />
    <div>
        <asp:Label runat="server" ID="lblFormatName" Text="Please enter a name:" />
        <asp:TextBox runat="server" ID="txtFormatName" />
    </div>
    <div>
        <asp:CheckBox runat="server" ID="chkActive" Text="Activate" />
    </div>
    <div>
        <asp:LinkButton runat="server" ID="cmdCancel" Text="Cancel" OnClick="cmdCancel_Click" />
        &nbsp;
        <asp:LinkButton runat="server" ID="cmdSave" Text="Save" OnClick="cmdSave_Click" />
    </div>


</div>
