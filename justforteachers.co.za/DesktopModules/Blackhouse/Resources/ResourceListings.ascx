<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceListings.ascx.cs" Inherits="Blackhouse.Resources.ResourceListings" %>

<style>
#main {
    padding: 5px 0 5px 0;
    display: block;
}
#tiles {
    list-style-type: none;
    position: relative;
    margin: 0;
}
#main ul {
    margin: 0 0;
    padding: 0 0 0 10px;
    display: block;
    list-style-type: disc;
    list-style: none;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
#tiles li {
    min-width:216px;
    max-width: 216px;
    background-color: #ffffff;
    border: 1px solid #dedede;
    display: none;
    cursor: pointer;
    padding: 2px;
}
/*#tiles li p {
    color: #666;
    font-size: 12px;
    margin: 7px 0 0 7px;
}*/
</style>

<asp:Repeater runat="server" ID="rptListings" OnItemCommand="rptListings_ItemCommand" OnItemDataBound="rptListings_ItemDataBound">
    <HeaderTemplate>
        <div class="box2">
            <p>sort: &nbsp; 
                <asp:LinkButton runat="server" ID="lnkName" CommandArgument="resourcename" Text="Name" /> |
                <asp:LinkButton runat="server" ID="lnkRating" CommandArgument="resourcerating" Text="Rating" /> |
                <asp:LinkButton runat="server" ID="lnkUploadDate" CommandArgument="resourceuploaddate" Text="Upload Date" /> 
            </p>
            <p>
                <div class="resource-search">
                    search: &nbsp;<asp:TextBox runat="server" ID="txtSearch" CssClass="resource-text" PlaceHolder="e.g. english, afrikaans" />&nbsp; <asp:LinkButton runat="server" ID="lnkSearch" CommandArgument="resourcesearch" Text="Search" />
                </div>
            </p>
        </div>
        <div id="main" role="main">
            <ul id="tiles">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <span style="max-width: 236px;">
            <h3><asp:LinkButton runat="server" ID="lblResourceName" Text='<%#Eval("ResourceName") %>' CommandArgument='<%#Eval("ResourceId") %>' /></h3>
            <p><asp:Image runat="server" ID="imgPreviewImage" /></p>
            <span><b>Type:</b> <asp:Label runat="server" ID="ResourceType" Text='<%#Eval("ResourceType") %>' /></span><br />
            <span><b>Topic:</b> <asp:Label runat="server" ID="ResourceTopic" Text='<%#Eval("ResourceTopic") %>' /></span><br />
            <span><b>Language:</b> <asp:Label runat="server" ID="ResourceLanguage" Text='<%#Eval("ResourceLanguage") %>' /></span><br />
            <p><b>Uploaded:</b> <asp:Label runat="server" ID="ResourceUploadDate" Text='<%#Eval("ResourceUploadDate") %>' /></p>
            </span>
        </li>
    </ItemTemplate>
    <FooterTemplate>
            </ul>
        </div>
    </FooterTemplate>
</asp:Repeater>
<div style="clear:both; width: 100%;">
    <br />
</div>

<!-- put pager here -->
<div class="box1" style="clear:both; width: 100%; text-align:center;">
<asp:Label runat="server" ID="PaginationLabel"/>
</div>
<!-- end pager -->

<div style="clear:both;">
    <asp:LinkButton runat="server" CssClass="text" ID="lnkAdd" Text ="Add a resource" OnClick="lnkAdd_Click" />
</div>


  <!-- include jQuery -->
  <script src="../desktopmodules/blackhouse/js/vendor/jquery.min.js"></script>

  <!-- Include the plug-in -->
  <script src="../desktopmodules/blackhouse/js/vendor/jquery.wookmark.js"></script>

  <!-- Once the page is loaded, initalize the plug-in. -->
  <script type="text/javascript">
      (function ($) {
          var handler = $('#tiles li');

          handler.wookmark({
              // Prepare layout options.
              autoResize: true, // This will auto-update the layout when the browser window is resized.
              container: $('#main'), // Optional, used for some extra CSS styling
              offset: 5, // Optional, the distance between grid items
              outerOffset: 10, // Optional, the distance to the containers border
              itemWidth: 210 // Optional, the width of a grid item
          });

          // Capture clicks on grid items.
          handler.click(function () {
              // Randomize the height of the clicked item.
              var newHeight = $('img', this).height() + Math.round(Math.random() * 300 + 30);
              $(this).css('height', newHeight + 'px');

              // Update the layout.
              handler.wookmark();
          });
      })(jQuery);
  </script>
