<%@ Control Language="c#" CodeBehind="ExportComplete.ascx.cs" Inherits="OnyakTech.FileShare.ExportComplete"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false"
    EnableViewState="true" %>
<asp:Timer ID="rdajTimer" runat="server" Interval="2000" Enabled="False" />
<table align="center" cellpadding="2" cellspacing="3">
    <tr>
        <td align="center">
            <table cellpadding="0" cellspacing="0" id="tblLoading" align="center" runat="server">
                <tr>
                    <td class="Normal" align="center">
                        <asp:Image ID="imgLoading" runat="server" Style="text-align: center" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal" align="center">
                      <asp:Label ID="lblHeaderInfo" runat="server" CssClass="Normal"></asp:Label>                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table align="left" cellpadding="0" cellspacing="0" border="0" id="tblMasterCheckOut"
                runat="server">
                <tr>
                    <td class="Normal" valign="top">
                        <asp:Label ID="lblDetails" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="Normal">
                        <table align="left" cellpadding="0" cellspacing="0" border="1" id="tblProgressBar"
                            runat="server">
                            <tr>
                                <td class="DAMsearch" valign="top" id="Td1" width="200px" height="20">
                                    <table align="left" cellpadding="0" cellspacing="0" border="0" id="tblProgressBarValue"
                                        width="80px" height="20" runat="server">
                                        <tr>
                                            <td class="Normal" valign="top" id="tblcellProgress" bgcolor="#3399FF" 
                                                align="center">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="chkEmailWhenComplete" runat="server" AutoPostBack="True" 
                            CssClass="Normal" 
                            Text="Email me when complete (email sent to the email address under My Account)" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblInfo" runat="server" CssClass="Normal" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" align="center">                        
                        <asp:LinkButton ID="lnkDownloadOrder" runat="server" resourcekey="lnkDownloadOrder"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="Normal">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:LinkButton ID="lnkCancel" runat="server" resourcekey="lnkCancel"></asp:LinkButton>                         
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
