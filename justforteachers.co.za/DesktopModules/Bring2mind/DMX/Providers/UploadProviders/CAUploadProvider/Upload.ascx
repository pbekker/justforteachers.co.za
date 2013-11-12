<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Upload.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Services.Upload.CAUploadProvider.Upload" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<script language="javascript">
 var nextButtonId = '<%=NextButtonId%>'
</script>
<div class="uploadCont">
	<ComponentArt:Upload
		ID="ctlUpload"
		RunAt="server"
		AutoPostBack="true"
		FileInputClientTemplateId="FileInputTemplate"
		UploadCompleteClientTemplateId="CompletedTemplate"
		ProgressClientTemplateId="ProgressTemplate"
		ProgressDomElementId="upload-progress"
	>
		<ClientEvents>
			<FileChange EventHandler="file_change" />
			<UploadBegin EventHandler="upload_begin" />
			<UploadEnd EventHandler="upload_end" />
		</ClientEvents>

		<ClientTemplates>
			<ComponentArt:ClientTemplate ID="FileInputTemplate">
				<div class="file">
					<div class="## DataItem.FileName ? "filename" : "filename empty"; ##"><input value="## DataItem.FileName ? DataItem.FileName : "Please select a file to upload"; ##" onfocus="this.blur();" /></div>
					<a href="javascript:void(0);" onclick="this.blur();return false;" class="browse" title="Browse for a file">#$FileInputImage</a>
					<a href="javascript:void(0);" onclick="remove_file(## Parent.Id ##,## DataItem.FileIndex ##);return false;" class="remove" title="Remove this file"></a>
				</div>
			</ComponentArt:ClientTemplate>

			<ComponentArt:ClientTemplate ID="ProgressTemplate">
				<!-- Dialogue contents -->
				<div class="con">
					<div class="stat">
						<h3 rel="total">Total Progress:</h3>
						<div class="prog">
							<div class="con">
								<div class="bar" style="width:## get_percentage(DataItem.Progress) ##%;"></div>
							</div>
						</div>
						<div class="lbl" style="text-align:right;"><strong>## format_file_size(DataItem.ReceivedBytes) ##</strong> of <strong>## format_file_size(DataItem.TotalBytes) ##</strong> (## get_percentage(DataItem.Progress) ##%) Uploaded</div>
					</div>

					<div class="list">
						<h3>Uploading files <span style="font-size:11px;">(<strong>## get_file_position(Parent,DataItem.CurrentFile) ##</strong> of <strong>## Parent.GetFiles().length ##</strong>):</span></h3>
						<div class="files">## generate_file_list(Parent,DataItem.CurrentFile); ##</div>
					</div>
				</div>
				<!-- /Dialogue contents -->

				<!-- Dialogue footer -->
				<div class="ftr">
					<div class="ftr-l"></div>
					<div class="ftr-m">
						<div class="info">
							<span>Elapsed time: <strong>## format_time(DataItem.ElapsedTime); ##</strong></span>
							<span style="padding-left:8px;">Estimated time: <strong>## format_time(DataItem.ElapsedTime + DataItem.RemainingTime); ##</strong></span>
							<span style="padding-left:8px;">Speed: <strong>## DataItem.Speed.toFixed(2) ## KB/S</strong></span>
						</div>
						<div class="btns">
							<a onclick="UploadDialog.close();this.blur();return false;" href="javascript:void(0);" rel="cancel">
								<span class="l"></span>
								<span class="m" id="btn1">Cancel Upload</span>
								<span class="r"></span>
							</a>
						</div>
					</div>
					<div class="ftr-r"></div>
				</div>
				<!-- /Dialogue footer -->
			</ComponentArt:ClientTemplate>

			<ComponentArt:ClientTemplate ID="CompletedTemplate">
				<!-- Dialogue contents -->
				<div class="con">
					<div class="stat">
						<h3 style="text-align:center;font-weight:bold" class="blue">&mdash; Upload Complete &mdash;</h3>
						<div class="prog">
							<div class="con">
								<div class="bar" style="width:## get_percentage(DataItem.Progress) ##%;"></div>
							</div>
						</div>
						<div class="lbl" style="text-align:right;"><strong>## format_file_size(DataItem.ReceivedBytes) ##</strong> of <strong>## format_file_size(DataItem.TotalBytes) ##</strong> (## get_percentage(DataItem.Progress) ##%) Uploaded</div>
					</div>

					<div class="list">
						<h3><strong>## Parent.GetFiles().length ##</strong> ## (Parent.GetFiles().length > 1) ? "files" : "file" ## uploaded in <strong>## format_time(DataItem.ElapsedTime,true); ##</strong>:</h3>
						<div class="files">## generate_file_list(Parent,DataItem.CurrentFile); ##</div>
					</div>
				</div>
				<!-- /Dialogue contents -->

				<!-- Dialogue footer -->
				<div class="ftr">
					<div class="ftr-l"></div>
					<div class="ftr-m">
						<div class="btns">
							<a onclick="UploadDialog.close();this.blur();return false;" href="javascript:void(0);" rel="cancel">
								<span class="l"></span>
								<span class="m" style="padding-left:6px;padding-right:6px;">Close</span>
								<span class="r"></span>
							</a>
						</div>
					</div>
					<div class="ftr-r"></div>
				</div>
				<!-- /Dialogue footer -->
			</ComponentArt:ClientTemplate>
		</ClientTemplates>
	</ComponentArt:Upload>
</div>

<div class="actions" rel="ctlUpload">
	<a href="javascript:void(0);" onclick="add_file(ctlUpload,this);this.blur();return false;" class="add" id="btn-add"></a>
	<a href="javascript:void(0);" onclick="init_upload(ctlUpload);this.blur();return true;" class="upload-d" id="btn-upload"></a>
</div>


<%-- Upload Dialogue & Control --%>
<ComponentArt:Dialog
	ID="UploadDialog"
	RunAt="server"
	AllowDrag="true"
	AllowResize="false"
	Modal="false"
	Alignment="MiddleCentre"
	Width="458"
	Height="247"
	ContentCssClass="dlg-up"
	ContentClientTemplateId="UploadContent"
>
	<ClientTemplates>
		<ComponentArt:ClientTemplate id="UploadContent">
			<div class="ttl" onmousedown="UploadDialog.StartDrag(event);">
				<div class="ttlt">
					<div class="ttlt-l"></div>
					<div class="ttlt-m">
						<a class="close" href="javascript:void(0);" onclick="UploadDialog.close();this.blur();return false;"></a>
						<span>Upload</span>
					</div>
					<div class="ttlt-r"></div>
				</div>

				<div class="ttlb">
					<div class="ttlb-l"></div>
					<div class="ttlb-m"></div>
					<div class="ttlb-r"></div>
				</div>
			</div>

			<!-- for contents & footer, see upload progress client template -->
			<div id="upload-progress"></div>
		</ComponentArt:ClientTemplate>
	</ClientTemplates>
</ComponentArt:Dialog>

