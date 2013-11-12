<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View_FileDetail.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.View_FileDetail" %>
<asp:HiddenField ID="hfReply_ID" runat="server" />
<asp:HiddenField ID="hfReply_UserName" runat="server" />


<script type="text/javascript">
    function Reply(name, id) {
        jQuery("#<%=hfReply_UserName.ClientID %>").val(name);
        jQuery("#<%=hfReply_ID.ClientID %>").val(id);

        var box = jQuery("#CtlTextArea<%=ModuleId %>");
        box.focus();
        box.val("@" + name + ": " + box.val());
    }
</script>





<asp:Literal ID="liContent" runat="server"></asp:Literal>
<asp:Button runat="server" ID="SubmitButton" OnClick="SubmitButton_Click" Visible="false"  />