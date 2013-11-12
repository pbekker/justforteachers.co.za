<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_FileUploads.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_FileUploads" %>
  <asp:PlaceHolder ID="PHcss" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="PHjs" runat="server"></asp:PlaceHolder>
  <fieldset class="normal-fieldset ui-widget ui-widget-content ui-corner-all">

	<legend class="normal-legend ui-widget ui-widget-content ui-corner-all">Edit Product Downloads</legend>

  <div id="fileupload">

    <div id="file_upload">    

        <div class="fileupload-buttonbar">

            <div class="option-select-div">

                <%--<select name="dnn$ctr413$ViewEditProductDownloads$ddlOptions" id="dnn_ctr413_ViewEditProductDownloads_ddlOptions" class="option-select ui-selectmenu normal-ddl">

		<option value="0">All Options</option>

		<option value="26778">Standard </option>

		<option value="26779">Professional</option>

		<option value="26780">Enterprise</option>



	</select>--%>

            </div>

            <input name="hfPackageId" type="hidden" id="hfPackageId" class="hfpackageid" value="25706" />

            <input name="hfModuleId" type="hidden" id="hfModuleId" class="hfmoduleid" value="413" />

            <label class="fileinput-button">

                <span>Add files...</span>

                <input type="file" name="files[]" multiple="true" />

            </label>

            <button type="submit" class="start">Start upload</button>

            <button type="reset" class="cancel">Cancel upload</button>

            <button type="button" class="delete" style="display:none;">Delete files</button>

        </div>

    </div>    

    <div class="fileupload-content">

        <table class="files">

            <tr>

                <td></td>

                <td>File Name</td>

                <td>File Size</td>

                <td>Deployable</td>

                <td>Has S3</td>

                <td>Processing</td>

                <td>Upload Date</td>

                <td></td>

            </tr>

        </table>

        <div class="fileupload-progressbar"></div>

    </div>

</div>
</fieldset>

<script id="template-upload" type="text/x-jquery-tmpl">

        <tr class="template-upload{{if error}} ui-state-error{{/if}}">

            <td class="preview"></td>

            <td class="name">${name}</td>

            <td class="size">${sizef}</td>

            {{if error}}

                <td class="error" colspan="4">Error:

                    {{if error === 'maxFileSize'}}File is too big

                    {{else error === 'minFileSize'}}File is too small

                    {{else error === 'acceptFileTypes'}}Filetype not allowed

                    {{else error === 'maxNumberOfFiles'}}Max number of files exceeded

                    {{else}}${error}

                    {{/if}}

                </td>

            {{else}}

                <td class="progress" colspan="3"><div></div></td>

                <td class="start"><button>Start</button></td>

            {{/if}}

            <td class="cancel"><button>Cancel</button></td>

        </tr>

    </script>

    <script id="template-download" type="text/x-jquery-tmpl">

        <tr class="template-download ui-widget-content{{if error}} ui-state-error{{/if}}">

            {{if error}}

                <td></td>

                <td class="name">${FileName}</td>

                <td class="size">${sizef}</td>

                <td class="error" colspan="4">Error:

                    {{if error === 1}}File exceeds upload_max_filesize (php.ini directive)

                    {{else error === 2}}File exceeds MAX_FILE_SIZE (HTML form directive)

                    {{else error === 3}}File was only partially uploaded

                    {{else error === 4}}No File was uploaded

                    {{else error === 5}}Missing a temporary folder

                    {{else error === 6}}Failed to write file to disk

                    {{else error === 7}}File upload stopped by extension

                    {{else error === 'maxFileSize'}}File is too big

                    {{else error === 'minFileSize'}}File is too small

                    {{else error === 'acceptFileTypes'}}Filetype not allowed

                    {{else error === 'maxNumberOfFiles'}}Max number of files exceeded

                    {{else error === 'uploadedBytes'}}Uploaded bytes exceed file size

                    {{else error === 'emptyResult'}}Empty file upload result

                    {{else}}${error}

                    {{/if}}

                </td>

            {{else}}                

                <td class="preview">

                    {{if thumbnail_url}}                    

                        <a href="${url}" target="_blank"><img src="${thumbnail_url}"></a>

                    {{/if}}                    

                </td>                

                <td class="name">

                    {{if Processing == true}}

                        ${FileName}

                    {{else}}

                        <a href="{{if HasS3 == true}}${S3URL}{{else}}${LocalURL}{{/if}}"{{if thumbnail_url}} target="_blank"{{/if}}>${FileName}</a>

                    {{/if}}

                </td>                

                <td class="size">${sizef}</td>

                <td class="deployable"><input type="checkbox" {{if Deployable == true}}checked="checked"{{/if}} {{if Processing == true}}disabled="disabled"{{/if}} fileid="${FileID}" class="deployable-checkbox" /></td>

                <td class="hass3"><input type="checkbox" {{if HasS3 == true}}checked="checked"{{/if}} disabled="disabled" /></td>

                <td class="processing"><input class="processing-checkbox" type="checkbox" {{if Processing == true}}checked="checked"{{/if}} disabled="disabled" /></td>

                <td class="date">${UploadedOnf}</td>                

            {{/if}}            

            <td class="delete" colspan="2">

                {{if DeleteURL}}

                    <button data-type="POST" data-url="${DeleteURLf}">Delete</button>

                {{/if}}

            </td>

        </tr>

    </script>

   

 