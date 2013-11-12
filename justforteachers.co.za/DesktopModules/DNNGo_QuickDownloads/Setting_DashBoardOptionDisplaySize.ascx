<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_DashBoardOptionDisplaySize.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_DashBoardOptionCategory" %>
 <div class="form_field">
    <h4><%=ViewTitle("lblDisplaySize", "Display Size", "txtDisplaySize")%>:</h4>
    <asp:TextBox runat="server" ID="txtDisplaySize" Width="100px" CssClass="input_text validate[required,custom[integer],max[1000],min[0]]"></asp:TextBox>
    <%=ViewHelp("lblDisplaySize", "Enter 0 to display all data")%>
</div>