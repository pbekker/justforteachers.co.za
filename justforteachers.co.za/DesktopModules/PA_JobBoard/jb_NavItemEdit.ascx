<%@ Import NameSpace="DotNetNuke" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_NavItemEdit" CodeBehind="jb_NavItemEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlNavItemEdit" Runat="server" Width="100%" HorizontalAlign="Center">
	<asp:panel id="pnlBackLink" HorizontalAlign="Center" Width="100%" Runat="server" Visible="True">
		<TABLE id="tblMain" cellSpacing="0" cellPadding="1" width="100%" align="center" runat="server">
			<TR vAlign="middle">
				<TD vAlign="middle" align="left">
					<TABLE id="tblNavItemEdit1" width="100%" align="center" runat="server">
						<TR>
							<TD id="tdBackLink" align="left" width="33%" runat="server" visible="True">
								<asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" Text="Back to Previous Page" cssclass="NormalBold"></asp:hyperlink></TD>
							<TD id="tdItemInfo" align="center" width="34%" runat="server" visible="True">
								<asp:LinkButton id="lnkItemInfo" resourcekey="[RESX:Nav_ItemPage].Text" runat="server" cssclass="NormalBold" CausesValidation="False">View Item Page</asp:LinkButton></TD>
							<TD id="tdMainPage" align="right" width="33%" runat="server" visible="True">
								<asp:hyperlink id="hplMainPage" resourcekey="[RESX:Nav_ModuleHome].Text" Visible="True" runat="server" cssclass="NormalBold"></asp:hyperlink></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
	<TABLE class="NormalBold" id="tblNavItemEdit2" cellSpacing="0" cellPadding="0" width="100%"
		align="center" border="0" runat="server">
		<TR>
			<TD id="tdItem" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemEdit %>" runat="server"><IMG id="imgItem" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-item.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnItem" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:MainPage].Text">Item</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdAttribute" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemAttribute %>" 
      runat="server"><IMG id="imgAttribute" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-atttribute.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnAttribute" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:ItemAttribute].Text">Attribute</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdImage" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemImage %>" runat="server"><IMG id="imgImage" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-image.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnImage" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:RelatedImages].Text">Related Images</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdFile" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemFile %>" runat="server"><IMG id="imgFile" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-file.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnFile" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:RelatedFiles].Text">Related Files</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdCoupon"  valign=middle noWrap width="10%" Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemCoupon %>" runat="server">
				<IMG id="imgCoupon" align=absmiddle src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-Coupon.png" border="0" runat="server">
				<asp:LinkButton id="lnkBtnCoupon" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:RelatedCoupons].Text">Related Coupons</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdVideo" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemVideo %>" runat="server"><IMG id="imgVideo" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-YouTube.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnVideo" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:YouTubeVideos].Text">YouTube Videos</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			<TD id="tdReview" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ReviewAdmin %>" 
      runat="server"><IMG id="imgReview" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-review.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnReview" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:ReviewAdmin].Text">Review Admin</asp:LinkButton>&nbsp;&nbsp;</TD>
			<TD id="tdCategory" vAlign=middle noWrap width="10%" 
    Visible="<%# DotNetNuke.jb_Dispatch.dsp_ItemCategory %>" 
      runat="server"><IMG id="imgCategory" src="~/DesktopModules/PA_JobBoard/images/module/NavItemEdit/ico-category.gif"
					align="absMiddle" border="0" runat="server">
				<asp:LinkButton id="lnkBtnCategory" runat="server" cssclass="NormalBold" CausesValidation="False" resourcekey="[RESX:AlsoListUnder].Text">Also list under</asp:LinkButton></TD>
		</TR>
	</TABLE>
</asp:panel>
