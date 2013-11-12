<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Upload.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Services.Upload.SLUploadProvider.Upload" %>
<%@ Register TagPrefix="dmx" Assembly="Bring2mind.DNN.Modules.DMX" Namespace="Bring2mind.DNN.Modules.DMX.Services.Upload.SLUploadProvider" %>
<div style="width:600px;height:400px;">
 <dmx:uploadcontrol runat="server" id="uploader" />
</div>
<div style="display:none">
 <asp:TextBox runat="server" ID="hidUploadedFiles" />
</div>
<script type="text/javascript">
 var uploadedFiles = document.getElementById('<%= hidUploadedFiles.ClientId %>');
 var uploadId = '<%= uploader.ClientId %>';
 var nextButtonId = '<%=NextButtonId%>'
</script>
