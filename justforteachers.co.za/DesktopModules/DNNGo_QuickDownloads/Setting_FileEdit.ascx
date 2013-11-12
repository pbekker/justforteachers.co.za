<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_FileEdit.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_FileEdit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="asp" Namespace="DNNGo.Modules.QuickDownloads.WebControls" Assembly="DNNGo.Modules.QuickDownloads" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<div class="article_setting">
    <h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Compose a new file info")%></h2>
    <div class="add_title form_field">
        <h3><%=ViewTitle("lblName", "Name", "txtName")%>:</h3>
        <asp:TextBox ID="txtName" runat="server" Width="90%"  CssClass="input_text validate[required,maxSize[100]]"></asp:TextBox>
    </div>
    <div class="add_content_text form_field">
         <h3><%=ViewTitle("lblDescription", "Description", "txtDescription")%>:</h3>
        <div id="wp-content-editor-container" class="wp-editor-container">  
            <%--<asp:TextBox id="txtDescription" runat="server" height="300" TextMode="MultiLine" width="90%"></asp:TextBox>--%>
             <dnn:TextEditor id="txtDescription" runat="server" height="400" width="100%"></dnn:TextEditor> 
        </div>
    </div>
    <div class="insert_picture form_field handlediv">
        <h3 class="hndle"><%=ViewTitle("lblPhoto", "Insert Picture")%></h3>
        <div class="inside">
           <dnn:URL ID="ucPhoto" runat="server" ShowTabs="false" UrlType="N" ShowNewWindow="false"
                    ShowNone="true" Visible="true" ShowSecure="false" ShowDatabase="false" ShowLog="false"
                    ShowTrack="false" ShowFiles="true" ShowUrls="true" />
        </div>
    </div>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle"><%=ViewTitle("lblCategory", "Categories", "ddlCategories")%></h3>
        <div class="inside">
           <asp:Literal runat="server" ID="liCategory"></asp:Literal>
           <asp:HyperLink runat="server" ID="hlAddCategory"  resourcekey="hlAddCategory"  Text="Add Category"></asp:HyperLink>
        </div>
    </div>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle"><%=ViewTitle("lblTags", "Tags")%></h3>
         <div class="inside" id="TagDiv">
            <asp:Literal ID="listTag" runat="server"></asp:Literal>
            <asp:Label ID="lblTagsMessage"  runat="server" resourcekey="lblTagsMessage"></asp:Label>
        </div>
    </div>

     <div class="article_settings form_field handlediv" id="divFileSettings" runat="server">
        <h3 class="hndle"><%=ViewTitle("lblSettings", "File Settings")%></h3>
            <div class="inside" >
                    <asp:PlaceHolder ID="phContainer" runat="server"></asp:PlaceHolder>
                    <asp:GridView ID="gvFileList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvFileList_RowDataBound"
                    Width="100%" CellPadding="6" cellspacing="0" border="0" CssClass="table table-bordered table-striped"  GridLines="none" >
                    <Columns>
                        <asp:TemplateField HeaderText="File Name">
                            <ItemTemplate>
                               <asp:TextBox runat="server" ID="txtName"  CssClass="input_text validate[required,maxSize[100]]" Width="95%"></asp:TextBox>
                               <asp:HiddenField runat="server" ID="hfName" />
                               <asp:HiddenField runat="server" ID="hfID" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Number" HeaderStyle-Width="50">
                            <ItemTemplate>
                               <asp:TextBox runat="server" ID="txtNumber" Width="50"  CssClass="input_text validate[required,custom[integer]]" ></asp:TextBox>
                               <asp:HiddenField runat="server" ID="hfNumber" Value="0" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:BoundField DataField="ClickCount" HeaderText="ClickCount" />--%>
                        <asp:BoundField DataField="LastTime" HeaderText="CreatedDate" ItemStyle-Width="150" />
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="80">
                            <ItemTemplate>
                             <asp:LinkButton CssClass="CommandButton" ID="btnDownLoad" runat="server" BorderStyle="none"
                                    OnClick="btnDownLoad_Click"  OnClientClick="CancelValidation();"></asp:LinkButton>
                                <asp:LinkButton CssClass="CommandButton" ID="btnDelete" resourcekey="cmdDelete" runat="server"
                                    BorderStyle="none" Text="Delete" OnClick="btnDelete_Click"  OnClientClick="CancelValidation();"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                      <PagerSettings Visible="False" />
                        <FooterStyle  />
                        <PagerStyle  />
                        <SelectedRowStyle  />
                        <HeaderStyle  />
                        <AlternatingRowStyle CssClass="alternating_row"  />
                </asp:GridView>
               
            </div>
    </div>


    <div class="choose_tags form_field handlediv">
        <h3 class="hndle"><%=ViewTitle("lblSEO", "SEO Settings")%></h3>
        <div class="inside" style="display:none">
            <div class="add_summary form_field">
                <h3><%=ViewTitle("lblSearchTitle", "SEO Title", "txtSearchTitle")%>:</h3>
                <asp:TextBox ID="txtSearchTitle" CssClass="input_text validate[maxSize[100]]" runat="server" Width="90%" ></asp:TextBox>
            </div>
            <div class="add_summary form_field">
                <h3><%=ViewTitle("lblSearchKeywords", "SEO Keywords", "txtSearchKeywords")%>:</h3>
                <asp:TextBox ID="txtSearchKeywords" CssClass="input_text validate[maxSize[200]]" runat="server" Width="90%" Rows="2" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="add_summary form_field">
                <h3><%=ViewTitle("lblSearchDescription", "SEO Description", "txtSearchDescription")%>:</h3>
                <asp:TextBox ID="txtSearchDescription" CssClass="input_text validate[maxSize[500]]" runat="server" Width="90%" Rows="4" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="article_settings form_field handlediv">
        <h3 class="hndle"><%=ViewTitle("lblSettings", "Other Settings")%></h3>
            <div class="inside" >
                <div class="add_summary form_field">
                    <h3><%=ViewTitle("lblPublishTime", "Publish Time", "txtPublishTime")%>:</h3>
                      
                         <asp:TextBox ID="txtPublishTime" runat="server" CssClass=" " Width="200px"></asp:TextBox>
                         <asp:Image ID="Image1" runat="server" ImageUrl="~/images/calendar.png" /> 
                </div>


                 <div class="add_summary form_field">
                    <h3><%=ViewTitle("lblCloseDate", "Close Time", "txtCloseDate")%>:</h3>
                      
                         <asp:TextBox ID="txtCloseDateTime" runat="server" CssClass=" " Width="200px"></asp:TextBox>
                         <asp:Image ID="imgBeginDate" runat="server" ImageUrl="~/images/calendar.png" /> 
                </div>
                <div class="add_summary form_field">
                    <h3><%=ViewTitle("lblHotValue", "Hot Value", "txtHotValue")%>:</h3>
                        <asp:TextBox ID="txtHotValue" runat="server" CssClass="input_text :required" Width="100px"></asp:TextBox>
                      
                </div>
                 <div class="add_summary form_field"  id="trTopStatus" runat="server">
                    <h3><%=ViewTitle("lblTopStatus", "Top Status", "rblTopStatus")%>:</h3>
                         <asp:RadioButtonList ID="rblTopStatus" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                </div>
                 <div class="add_summary form_field"  id="trFeature" runat="server">
                    <h3><%=ViewTitle("lblFeature", "Feature", "rblFeature")%>:</h3>
                        <asp:RadioButtonList ID="rblFeature" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                </div>
                 
                <div class="add_summary form_field" id="trStatusByAdmin" runat="server">
                    <h3><%=ViewTitle("lblStatusByAdmin", "Status", "rblStatus")%>:</h3>
                        <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                </div>

                <div class="add_summary form_field" id="trStatusByUser" runat="server">
                    <h3><%=ViewTitle("lblStatusByUser", "Status", "rblStatus")%>:</h3>
                        <asp:RadioButtonList ID="rblStatusByUser" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                </div>
               
            </div>
    </div>
</div>
<p style="text-align: center;">
    <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
         Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
    <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
         Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"  OnClientClick="CancelValidation();"></asp:Button>&nbsp;
    <asp:Button CssClass="input_button" ID="cmdDelete" resourcekey="cmdDelete" runat="server"
         Text="Delete" Enabled="false" CausesValidation="False" OnClick="cmdDelete_Click"  OnClientClick="CancelValidation();"></asp:Button>&nbsp;
   <asp:Button ID="cmdRefreshList" runat="server" OnClick="cmdRefreshList_Click" style=" display:none;"></asp:Button>
</p>
 <script type="text/javascript">
     jQuery(function (q) {
         q('#<%=txtCloseDateTime.ClientID %>').datetimepicker({});
         q('#<%=txtPublishTime.ClientID %>').datetimepicker({});

         q("#TagDiv").find('input.tag').tagedit({
             autocompleteURL: '<%=ModulePath %>Resource_Service.aspx?Token=AutoTag&PortalId=<%=PortalId %>&TabId=<%=TabId %>',
             autocompleteOptions: { minLength: 1 }
         });
     });

 

     //上传成功的提交事件
     function UploadifySumbit() {
         jQuery('#<%=cmdRefreshList.ClientID %>').attr("lang", "").click();

     }
 
 

    

 </script>
 
