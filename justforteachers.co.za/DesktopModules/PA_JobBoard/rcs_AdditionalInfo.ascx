<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rcs_AdditionalInfo.ascx.cs" Inherits="DesktopModules_PA_JobBoard_rcs_AdditionalInfo" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" 
    SelectCommand="SELECT [ItemID], [info1] FROM [jb_ClassifiedsItem] WHERE ([ItemID] = @ItemID)"
    UpdateCommand="UPDATE [jb_ClassifiedsItem] SET [info1] = @info1 WHERE ([ItemID] = @ItemID)"
    >
    <SelectParameters>
        <asp:QueryStringParameter Name="ItemID" QueryStringField="ItemID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:FormView ID="AdditionalInfoForm" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ItemID" DefaultMode="Edit" >
    <ItemTemplate>
        <asp:Label ID="lblInfo1" runat="server" Text='<%# Bind("info1") %>'></asp:Label>
        <br />
    </ItemTemplate>
    <EditItemTemplate>
        External Url: 
        <asp:TextBox ID="txtInfo1" runat="server" Text='<%# Bind("info1") %>' Width="600px"></asp:TextBox>
        <br /><br />
        <asp:Button ID="submitAdditionalInfo" runat="server" Text="Update" CommandName="Update" />
    </EditItemTemplate>
</asp:FormView>

