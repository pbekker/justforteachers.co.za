<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Theme.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Theme" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<div class="add_theme_setting">
    <h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Add Theme")%></h2>
    <div class="form_field">
        <!--<dnn:label id="lblName" runat="server" controlname="txtName" suffix=":"></dnn:label>-->
        <h4><%=ViewTitle("lblName", "Name", "txtName")%>:</h4>
        <asp:TextBox ID="txtName" runat="server" Width="90%"  CssClass="input_text :required"></asp:TextBox>
    </div>
    <div class="form_field">
        <!--<dnn:label id="lblAlias" runat="server" controlname="txtAlias" suffix=":"></dnn:label>-->
        <h4><%=ViewTitle("lblAlias", "Alias", "txtAlias")%>:</h4>
        <asp:TextBox ID="txtAlias" runat="server" Width="90%" CssClass="input_text :required"></asp:TextBox>
    </div>
    <div class="form_field">
        <!--<dnn:label id="lblVersion" runat="server" controlname="txtVersion" suffix=":"></dnn:label>-->
        <h4><%=ViewTitle("lblVersion", "Version", "txtVersion")%>:</h4>
        <asp:TextBox ID="txtVersion" runat="server" Width="90%"  CssClass="input_text :required"></asp:TextBox>
    </div>
    <div class="form_field">
        <!--<dnn:label id="lblPicture" runat="server" controlname="txtPicture" suffix=":"></dnn:label>-->
        <h4><%=ViewTitle("lblPicture", "Picture", "fuPicture")%>:</h4>
        <asp:Image runat="server" Visible="false" ID="imgPicture" style=" max-height:120px; max-height:120px;"  />
        <asp:FileUpload runat="server" ID="fuPicture" Width="300px"  CssClass="NormalTextBox" />
    </div>
    <div class="form_field">
        <!-- <dnn:label id="lblDescription" runat="server" controlname="txtDescription" suffix=":"></dnn:label> -->
        <h4><%=ViewTitle("lblDescription", "Description", "txtDescription")%>:</h4>
        <asp:TextBox ID="txtDescription" TextMode="MultiLine" Width="90%" Rows="6" runat="server" ></asp:TextBox>
    </div>
    <div class="form_field">
        <!-- <dnn:label id="lblTags" runat="server" controlname="txtTags" suffix=":"></dnn:label> -->
        <h4><%=ViewTitle("lblTags", "Tags", "txtTag")%>:</h4>
        <input type="text" id="txtTag" style=" width:220px;" class="input_text" />&nbsp;<input type="button" class="input_button2" id="TagAdd" value="add" />
        <asp:HiddenField runat="server" ID="hfTags" Value="" /><%=ViewHelp("lblTags", "Multiple tags by commas or spaces split")%> 
        <asp:Panel runat="server" CssClass="tagchecklist" ID="TagPanel"></asp:Panel>
    </div>
    <p style="text-align: center;">
        <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
            Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
            Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="input_button" ID="cmdDelete" resourcekey="cmdDelete" runat="server"
            Text="Delete" Enabled="false" CausesValidation="False" OnClick="cmdDelete_Click"></asp:Button>&nbsp;
    </p>
 </div>



 <script type="text/javascript">
     jQuery(function (q) {


         //添加标签事件
         q('#TagAdd').click(function () {
             var a, b, c, d, e, f;
             a = jQuery('#txtTag').val();
             a = a.replace(new RegExp(" ", "g"), ",");
             b = a.split(',');
             c = b.length;
             for (var i = 0; i < c; i++) {
                 e = b[i];
                 if (e != null && e != '') {
                     d = ',' + e;
                     f = q('#<%=hfTags.ClientID %>');
                
                     if (f.val().indexOf(d) < 0) {
                         q('.tagchecklist').append("<span><a id=\"post_tag-check-num-" + e + "\" lang=\"" + e + "\" class=\"ntdelbutton\">X</a>&nbsp;" + e + "</span>");
                         q('#post_tag-check-num-' + e).click(function () {
                             jQuery(this).parent().empty();
                             var g = q('#<%=hfTags.ClientID %>');
                             g.val(g.val().replace(new RegExp(d, "g"), ","));
                         });
                         f.val(f.val() + d)
                     }
                 }
             }
             q('#txtTag').val('');
         });


     });

     //根据隐藏域的值创建标签
     jQuery(function (q) {
         var a, b, c, d, e, f;
         a = q('#<%=hfTags.ClientID %>');
         if (a.val() != null &&a.val() != '') {
             b = a.val().split(',');
             c = b.length;
             for (var i = 0; i < c; i++) {
                 e = b[i];
                 if (e != null && e != '') {
                     q('.tagchecklist').append("<span><a id=\"post_tag-check-num-" + e + "\" lang=\"" + e + "\" class=\"ntdelbutton\">X</a>&nbsp;" + e + "</span>");
                     q('#post_tag-check-num-' + e).click(function () {
                         q(this).parent().empty();
                         var g = q('#<%=hfTags.ClientID %>');
                         g.val(g.val().replace(new RegExp(d, "g"), ","));
                     });
                 }
             } 
         }
     });

</script>

