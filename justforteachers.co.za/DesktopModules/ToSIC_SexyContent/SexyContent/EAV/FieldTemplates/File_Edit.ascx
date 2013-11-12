<%@ Control Language="C#" Inherits="ToSic.EAV.ManagementUI.File_EditCustom" AutoEventWireup="True" Codebehind="File_Edit.ascx.cs" %>
<%@ Import Namespace="DotNetNuke.Entities.Portals" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register tagPrefix="SexyContent" tagName="DimensionMenu" src="../Controls/DimensionMenu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>

<dnn:Label ID="FieldLabel" runat="server" Suffix=":" />
<SexyContent:DimensionMenu runat="server"></SexyContent:DimensionMenu>
<div class="eav-field-control">
    <asp:TextBox runat="server" ID="txtFilePath"></asp:TextBox>
    <a class="sc-browsefile" href='<%# "javascript:OpenDialog" + txtFilePath.ClientID + "(\"" + DialogType + "\");" %>'>...</a>
</div>

<telerik:DialogOpener runat="server" ID="DialogOpener1">
</telerik:DialogOpener>

<asp:Panel ID="pnlScriptStyles" runat="server">
    <script type="text/javascript">
        function OpenDialog<%# txtFilePath.ClientID %>(Type) {
            if(Type == "ImageManager") {
                $find('<%# DialogOpener1.ClientID %>').open('ImageManager', {CssClasses: []});
            } else {
                var args = new Telerik.Web.UI.EditorCommandEventArgs("DocumentManager", null, document.createElement("a"));
                args.CssClasses = [];
 
                $find('<%# DialogOpener1.ClientID %>').open('DocumentManager', args);
            }
        }

        function ImageManagerFunction<%# txtFilePath.ClientID %>(sender, args) {
            if (!args) {
                return false;
            }

            var path;
            if (args.value[0] == null)
                path = args.value.getAttribute("src", 2);
            else
                path = args.value[0].getAttribute("src", 2);

            var txt = $get('<%# txtFilePath.ClientID %>');
            txt.value = path;
        }
    
        function DocumentManagerFunction<%# txtFilePath.ClientID %>(sender, args) {
            if (!args) {
                return false;
            }
        
            var path = args.value.getAttribute("href", 2);

            var txt = $get('<%# txtFilePath.ClientID %>');
            txt.value = path;
        }
    </script>
</asp:Panel>

<dnn:DnnEditor ID="dnnEditor" runat="server" Visible="False"></dnn:DnnEditor>