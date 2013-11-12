<%@ Control language="vb" Inherits="DotNetNuke.jb_PaymentGateway" CodeBehind="jb_PaymentGateway.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<%@ Register TagPrefix="Portal" TagName="Address" Src="~/DesktopModules/PA_JobBoard/jb_Address.ascx"%>
<asp:Panel id="pnlProceedToAuthorize" runat="server" Visible="true" CssClass="Normal">

        <table class="Normal">
              <tr id="trItem" runat="server" visible="true">
                <td class="Normal">
			        <asp:Label id="lblItem" runat="server" CssClass="Normal">Plan:</asp:Label>
                </td>
                <td class="Normal">
			        <asp:Label id="lblItemAmount" runat="server" CssClass="Normal"></asp:Label>
                </td>
            </tr>
            <tr id="trCardType" runat="server" visible="false">
                <td class="Normal">
                    <asp:Label id="lblCard" CssClass="Normal" runat="server">Card Type:</asp:Label>
                </td>
                <td class="Normal">
                    <asp:RadioButtonList id="rblCard" CssClass="Normal" runat="server" Width="160px" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Visa" Selected="true">Visa</asp:ListItem>
                        <asp:ListItem Value="MasterCard">MasterCard</asp:ListItem>
                    </asp:RadioButtonList>
				    <asp:RequiredFieldValidator id="req_rblCard" runat="server" ControlToValidate="rblCard" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*" Enabled="false"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trCardHoldersName" runat="server" visible="true">
                <td class="Normal">
			        <asp:Label id="lblCardHoldersName" runat="server" CssClass="Normal">First/Last Name:</asp:Label>
                </td>
                <td class="Normal">
			        <asp:TextBox ID="txtFirstName" runat="server" Width="120px"></asp:TextBox>
                    <asp:TextBox ID="txtLastName" runat="server" Width="120px"></asp:TextBox>
			         <asp:RequiredFieldValidator ID="req_FirstName" runat="server" ControlToValidate="txtFirstName" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                     <asp:RequiredFieldValidator ID="req_LastName" runat="server" ControlToValidate="txtLastName" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="Normal">			  
			        <asp:Label id="lblCardNumber" runat="server" CssClass="Normal">Card Number:</asp:Label>
                </td>
                <td class="Normal">
			        <asp:TextBox id="txtCreditCard" runat="server" Width="130px" MaxLength="100"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="req_txtCreditCard" runat="server" ControlToValidate="txtCreditCard" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr >
                <td class="Normal">			      
			         <asp:Label id="lblCode" runat="server" CssClass="Normal">CSC Code:</asp:Label>
                </td>
                <td class="Normal">	
			        <asp:TextBox ID="txtCode" MaxLength="4" runat="server" Width="40px"></asp:TextBox> &nbsp;<img id="imglg_cvv" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_cvv.jpg" border="0" align="middle"/>
			        <asp:RequiredFieldValidator ID="req_txtCode" runat="server" ControlToValidate="txtCode" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="Normal">			  
			         <asp:Label id="lblExpiryDate" runat="server" CssClass="Normal">Exp. Date:</asp:Label>
                </td>
                <td class="Normal">
			        <asp:DropDownList id="ddlMonth" runat="server" CssClass="Normal">
				        <asp:ListItem Value="01">01</asp:ListItem>
				        <asp:ListItem Value="02">02</asp:ListItem>
				        <asp:ListItem Value="03">03</asp:ListItem>
				        <asp:ListItem Value="04">04</asp:ListItem>
				        <asp:ListItem Value="05">05</asp:ListItem>
				        <asp:ListItem Value="06">06</asp:ListItem>
				        <asp:ListItem Value="07">07</asp:ListItem>
				        <asp:ListItem Value="08">08</asp:ListItem>
				        <asp:ListItem Value="09">09</asp:ListItem>
				        <asp:ListItem Value="10">10</asp:ListItem>
				        <asp:ListItem Value="11">11</asp:ListItem>
				        <asp:ListItem Value="12">12</asp:ListItem>
			        </asp:DropDownList>
			        <asp:Label id="lblSlash" runat="server" CssClass="Normal">&nbsp;/&nbsp;</asp:Label>
			        <asp:DropDownList id="ddlYear" runat="server" CssClass="Normal"></asp:DropDownList>
                </td>
            </tr>
             <tr id="trCCLogos" runat="server" visible="true">
                <td class="Normal">			  
			         <asp:Label id="lblLogos" runat="server" CssClass="Normal"></asp:Label>
                </td>
                <td class="Normal">
                   &nbsp;<img id="imglg_paypal" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_paypal.gif" border="0" align="middle"/>
                   &nbsp;<img id="imglg_ccVisa" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_ccVisa.gif" border="0" align="middle"/>
                   &nbsp;<img id="imglg_ccMC" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_ccMC.gif" border="0" align="middle"/>
                   &nbsp;<img id="imglg_ccAmex" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_ccAmex.gif" border="0" align="middle"/>
                   &nbsp;<img id="imglg_ccDiscover" runat="server" src="~/DesktopModules/PA_JobBoard/images/payment/lg_ccDiscover.gif" border="0" align="middle"/>
                   
                </td>
            </tr>
            <tr>
                <td class="Normal" valign="top">			  
			         <asp:Label id="lblAddressControl" runat="server" CssClass="Normal">Address:</asp:Label>
                </td>
                <td class="Normal">
                    <portal:address id="Address1" runat="server" ControlColumnWidth="250" LabelColumnWidth="100" EnableViewState="True" ShowUnit="false" ShowCell="false" ShowFax="false" ></portal:address>
                </td>
            </tr>
        </table>
        <p>
        <asp:Label id="lblConfirmMessage" runat="server" CssClass="Normal"></asp:Label>        
        </p>
        <asp:button id="btnProcess" runat="server" cssclass="StandardButton" Text="Confirm Order"></asp:button>
</asp:Panel>
<asp:Label id="lblError" runat="server" CssClass="NormalRed" Visible="false"></asp:Label>
<span id="resultSpan" runat="server"></span>