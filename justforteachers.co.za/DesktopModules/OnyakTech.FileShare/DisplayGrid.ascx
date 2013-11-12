<%@ Control Language="c#" CodeBehind="DisplayGrid.ascx.cs" AutoEventWireup="false" Inherits="OnyakTech.FileShare.DisplayGrid" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table id="tblFileShareGrid" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td class="Normal" valign="top">
            <asp:Label ID="lblUserInformation" Visible="true" CssClass="Normal " runat="server"></asp:Label>
            <telerik:RadGrid ID="grdFileShare" runat="server" Width="860px" Height="700px" PageSize="35"
            AllowSorting="True" AllowMultiRowSelection="True" AllowPaging="True" ShowGroupPanel="True"
            GridLines="None" AutoGenerateColumns="False" Style="border: 0; outline:none;" Skin="Office2007">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
            <MasterTableView DataKeyNames="FileId" AllowMultiColumnSorting="True">
                <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <SelectFields>
                            <telerik:GridGroupByField FieldAlias="DatePublished" FieldName="DatePublished" FormatString="{0:D}"
                                HeaderValueSeparator=" from date: "></telerik:GridGroupByField>
                        </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField SortOrder="Descending" FieldName="DatePublished" FormatString=""
                                HeaderText="Date Published"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
                </GroupByExpressions>
                <Columns>
                    <telerik:GridClientSelectColumn Reorderable="False" UniqueName="ClientSelectColumn">
                        <HeaderStyle Width="30px"></HeaderStyle>
                    </telerik:GridClientSelectColumn>                    
                    <telerik:GridTemplateColumn UniqueName="TemplateColumn2" GroupByExpression="Title Group By Title"
                        SortExpression="Title" HeaderText="Title / Summary"> 
                        <ItemStyle Height="35px"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                            <br />
                            <div style="float:left;position:relative;">
                                <%# DataBinder.Eval(Container.DataItem, "Summary")%>
                            </div>
                           <%-- <div style="float:right;position:relative;">
                             <%# GetDownloadLink(DataBinder.Eval(Container.DataItem, "FileId"), DataBinder.Eval(Container.DataItem, "DownloadFile"))%>                                
                            </div>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="DatePublished" SortExpression="DatePublished" HeaderText="Date Published"
                        DataField="DatePublished" DataFormatString="{0:d}">
                        <HeaderStyle Width="125px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings AllowDragToGroup="True">
                <Selecting AllowRowSelect="True"></Selecting>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="275px"></Scrolling>
                <ClientMessages DragToGroupOrReorder="Drag to group" />
            </ClientSettings>
        </telerik:RadGrid>

        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="lnkAddSelectedFiles" runat="server" CssClass="CommandButton"
                resourcekey="lnkAddSelectedFiles"></asp:LinkButton>&nbsp;-
            <asp:LinkButton ID="lnkAddAllFiles" runat="server" CssClass="CommandButton"
                resourcekey="lnkAddAllFiles"></asp:LinkButton>
        </td>
    </tr>
</table>
