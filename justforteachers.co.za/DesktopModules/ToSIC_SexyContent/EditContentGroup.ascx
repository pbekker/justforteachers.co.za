<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditContentGroup.ascx.cs" Inherits="ToSIC.Modules.SexyContent.EditContentGroup" %>

<!-- Dimension-Navigation -->
<asp:Panel runat="server" CssClass="dnnForm dimensionTabs" ID="pnlDimensionNav">
    <ul class="dnnAdminTabNav dnnClear ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
        <asp:Repeater runat="server" ID="rptDimensions" OnItemCommand="rptDimensions_ItemCommand">
            <ItemTemplate>
                <li class='<%# "ui-state-default ui-corner-top" + (LanguageID.ToString() == Eval("DimensionID").ToString() ? " ui-tabs-selected ui-state-active" : "") + (DefaultLanguageID == (int)Eval("DimensionID") ? " sc-default-language" : "") %>'>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("Name") %>' OnClientClick='<%# "if(!ChangeLanguage(" + LanguageID.ToString() + ", " + Eval("DimensionID").ToString() + ")) return false;"  %>'
                        CommandName="ChangeLanguage" CommandArgument='<%# Eval("DimensionID") %>'></asp:LinkButton>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:HiddenField runat="server" ID="hfMustSave" Value="false" />
</asp:Panel>
<!-- / Dimension-Navigation -->

<div class="dnnForm scNewOrEditItem dnnClear">
    <asp:Panel runat="server" id="pnlLanguageNotActive" Visible="false">
        <br />
        <div class="dnnFormMessage dnnFormInfo">
            The language you are trying to edit (<i><asp:Literal runat="server" ID="litLanguageName"></asp:Literal></i>) is not active in 2SexyContent Portal Configuration.
            <asp:LinkButton runat="server" Visible="False" ID="btnActivateLanguage" Text="Activate Language" OnClick="btnActivateLanguage_Click"></asp:LinkButton>
        </div>
        <br />
    </asp:Panel>
    <asp:PlaceHolder runat="server" ID="phNewOrEditControls"></asp:PlaceHolder>
    <asp:Panel runat="server" ID="pnlActions" Visible="true">
        <ul class="dnnActions dnnClear">
            <li><asp:LinkButton ID="btnUpdate" resourcekey="btnUpdate" runat="server" CommandName="Update" OnClick="btnUpdate_Click" CssClass="dnnPrimaryAction eav-save" /></li>
            <li><asp:LinkButton ID="btnCancel" resourcekey="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false" onclick="btnCancel_Click" CssClass="dnnSecondaryAction" /></li>
            <li><asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CausesValidation="false" OnClick="btnDelete_Click" CssClass="dnnSecondaryAction" /></li>
            <li><asp:Hyperlink CssClass="dnnSecondaryAction hlkChangeContent" runat="server" ID="hlkChangeContent" ResourceKey="hlkChangeContent" Visible="False"></asp:Hyperlink></li>
        </ul>
    </asp:Panel>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        var setupModule = function () {
            jQuery('.scNewOrEditItem').dnnPanels();
        };
        setupModule();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            // note that this will fire when _any_ UpdatePanel is triggered
            setupModule();
        });
    });

    function ChangeLanguage(CurrentLanguage, NewLanguage) {
        if (CurrentLanguage == NewLanguage)
            return false;

        var mustSave = false;
        $(".eav-form").each(function(i,e) {
            if(e.Controller.IsChanged())
                mustSave = true;
        });
        $("input[type=hidden][id$='_hfReferenceChanged']").each(function() {
            if($(this).val() == 'true')
                mustSave = true;
        });

        $("input[type=hidden][id$='_hfMustSave']").val(mustSave);

        if(mustSave)
            return confirm("<%= LocalizeString("ChangeLanguageConfirm.Text") %>");
        else
            return true;
    }
</script>

<asp:Literal runat="server" id="litAssetsInclude"></asp:Literal>