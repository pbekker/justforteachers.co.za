<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceBundleView.ascx.cs" Inherits="Blackhouse.Resources.ResourceBundleView" %>
<div>
    <div>
        <div>
            <asp:Label runat="server" ID="lblLabelName" Text="Bundle name" />
        </div>
        <div>
            <asp:Label runat="server" ID="lblName" Text="name" />
        </div>
    </div>
    <div>
        <div>
            <asp:Label runat="server" ID="lblLableDescription" Text="Bundle Description" />
        </div>
        <div>
            <asp:Label runat="server" ID="lblDescription" Text="description" />
        </div>
    </div>
    <div>
        <asp:Label runat="server" ID="lblLabelFiles" Text="Bundle Files:" />
        <asp:GridView runat="server" ID="gvBundleFiles" AutoGenerateColumns="true">
            <Columns>
                <asp:TemplateField HeaderText="File Name">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblFileName" Text="filename" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Size">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblFileSize" Text="filesize" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Info">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbltemplabel" Text="temp label (ext/fav/go to resource)" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Control">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbltemplabel2" Text="temp label 2 (download/remove)" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                If you see this please report it to an admin.
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</div>