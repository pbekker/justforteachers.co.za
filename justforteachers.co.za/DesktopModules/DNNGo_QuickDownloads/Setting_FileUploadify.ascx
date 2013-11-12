<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_FileUploadify.ascx.cs"
    Inherits="DNNGo.Modules.QuickDownloads.Setting_FileUploadify" %>
<asp:PlaceHolder ID="PHcss" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="PHjs" runat="server"></asp:PlaceHolder>
<script type="text/javascript">
    var postData =
            {
                'ClientID': '<%=ClientID %>',
                'UserID': '<%=UserId %>',
                'ItemID': '<%=InfoID %>',
                'HomeDirectory': '<%=PortalSettings.HomeDirectory %>',
                'SaveDirectory': '<%=Settings["QuickDownloads_Directory"] %>',
                'ModuleId': '<%=ModuleId %>',
                'PortalId': '<%=PortalId %>',
                'token': 'fileupload'
            };

            jQuery(document).ready(function () {
                jQuery(".uploadify").uploadify({
                    swf: '<%=ModulePath %>Resource/uploadify/uploadify.swf',
                    uploader: '<%=ModulePath %>Resource_Service.aspx',
                    // cancelImg: '<%=ModulePath %>Resource/uploadify/uploadify-cancel.png',
                    queueID: 'fileQueue',
                    auto: false,
                    multi: true,
                    formData: postData,
                    onQueueComplete: function (queueData) {
                        //alert(queueData.uploadsSuccessful + ' files were successfully uploaded.');
                        UploadifySumbit();
                    },
                    onSelect: function (file) {
                                           }
                });

               


            });  
</script>


 
<table class="inline_content">
    <tr valign="top">
        <td >
            <div id="file_upload" class="uploadify" >
            </div>
        </td>
        <td >
            <a class="uploadify-button btn-primary"  href="javascript:jQuery('#file_upload').uploadify('upload','*')">Upload</a>
        </td>
        <td >
            <a class="uploadify-button btn-danger"  href="javascript:jQuery('#file_upload').uploadify('cancel','*')">Cancel</a>
        </td>
        <td></td>
    </tr>
</table>
   <div id="fileQueue"></div>
 
 








