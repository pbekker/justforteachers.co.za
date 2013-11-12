<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="Index.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Index" %>
<asp:Panel ID="plLicense" runat="server">
<asp:PlaceHolder ID="phScript" runat="server"></asp:PlaceHolder>
 <asp:PlaceHolder  ID="phContainer" runat="server"></asp:PlaceHolder>
   <script type="text/javascript">
       jQuery(function (q) {
           q("#Form").validationEngine();

       });
       function CancelValidation() {
           jQuery('#Form').validationEngine('detach');
       }
</script>

</asp:Panel>
<asp:Panel ID="pnlTrial" runat="server">
    <center>
        <asp:Literal ID="litTrial" runat="server"></asp:Literal>
        <br />
        <asp:Label ID="lblMessages" runat="server" CssClass="SubHead" resourcekey="lblMessages"
            Visible="false" ForeColor="Red"></asp:Label>
    </center>
</asp:Panel>