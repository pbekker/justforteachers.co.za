<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_DashBoardOptionAlbumFilter.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_DashBoardOptionAlbumFilter" %>

 <div class="form_field">
    <h4><%=ViewTitle("lblDisplaySize", "Display Size", "txtDisplaySize")%>:</h4>
    <asp:TextBox runat="server" ID="txtDisplaySize" Width="100px" CssClass="input_text validate[required,custom[integer],max[1000],min[0]]"></asp:TextBox>
    <%=ViewHelp("lblDisplaySize", "Enter 0 to display all data")%>
</div>
 

<!--Album start-->
 <div class="form_field" id="divChooseCategories" runat="server">
    <h4><%=ViewTitle("lblChooseCategories", "Choose Categories", "lboxChooseCategories")%>:</h4>
    <asp:ListBox ID="lboxChooseCategories" runat="server" Rows="10" Width="50%" DataTextField="Name" DataValueField="ID" SelectionMode="Single"></asp:ListBox>
</div>
 <div class="form_field" id="divSequence" runat="server">
    <h4><%=ViewTitle("lblSequence", "Sequence", "rblSequence")%>:</h4>
    <asp:RadioButtonList ID="rblSequence" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
</div>
 <div class="form_field" id="divAlbumsDisplay" runat="server">
    <h4><%=ViewTitle("lblAlbumsDisplay", "Albums Display", "rblAlbumsDisplay")%>:</h4>
    <asp:RadioButtonList ID="rblAlbumsDisplay" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
</div>
 
<!--Album start-->


 