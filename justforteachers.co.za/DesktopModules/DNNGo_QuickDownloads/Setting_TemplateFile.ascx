<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_TemplateFile.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_TemplateFile" %>
 <%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="theme_file_setting">
<h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Theme File")%></h2>
<table cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"
    border="0">

    <tr>
        <td >
            <table class="Settings" cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"  border="0">
                <tr>
                    <td width="100%">
                        <asp:Label ID="lbTitle" runat="server"></asp:Label>
                    </td>
                    <td style="white-space:nowrap;">
                        <%=ViewTitle("lblChooseTheme", "Choose Theme")%>:
                    </td>
                     <td><asp:DropDownList runat="server" ID="ddlThemes"></asp:DropDownList>  </td>
                      <td>  
                           <asp:Button ID="lbChoose" runat="server" CssClass="Normal" 
                               resourcekey="lbChoose" onclick="lbChoose_Click" ></asp:Button>
                      </td>
                </tr>
            </table>           
        </td>
    </tr>
    <tr valign="top">
        <td>
            <table class="Settings" cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"  border="0">
                <tr valign="top">
                    <td class="col_left">
                        <textarea runat="server" ID="txtContent" Rows="20"  style="width:600px; overflow-x:auto;"></textarea>
                    
                   <%-- <asp:TextBox runat="server" ID="txtContent" Rows="20" TextMode="MultiLine" Style="width:600px;"></asp:TextBox>--%>
                        <p><br/><asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
        Text="Update" OnClick="cmdUpdate_Click"></asp:Button></p>
                    </td>
                    <td class="col_right">
                        <h3> <asp:Label ID="lblHtmlTitle" runat="server" resourcekey="lblHtmlTitle"></asp:Label></h3>
                        <ul>
                            <asp:Repeater ID="RepeaterHtml" runat="server" 
                             onitemdatabound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal runat="server" ID ="LiDataItem"></asp:Literal>
                            </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <h3><asp:Label ID="lblStyleTitle" runat="server" resourcekey="lblStyleTitle"></asp:Label></h3>
                        <ul><asp:Repeater ID="RepeaterCss" runat="server" 
                             onitemdatabound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal runat="server" ID ="LiDataItem"></asp:Literal>
                            </ItemTemplate>
                        </asp:Repeater>
                        </ul>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>