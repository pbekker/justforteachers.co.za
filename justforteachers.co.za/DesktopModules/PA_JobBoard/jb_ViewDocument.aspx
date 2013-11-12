<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import NameSpace="DotNetNuke.jb_UConversion" %>
<%@ Import NameSpace="DotNetNuke.jb_Utility" %>
<%@ Import NameSpace="DotNetNuke" %>
<script runat="server">
 
     Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
				Dim thisApplication As Integer = Request.QueryString("ApplicationID")
				Dim thisDoc As String = Request.QueryString("doc")			
                Dim objApplication As New jb_JobApplication
                Dim dBContent As SqlDataReader = objApplication.jb_JobApplicationGet(thisApplication) 
                Try

                    dBContent.Read()                  
                    If thisDoc.ToUpper() = "RESUME" Then
                        Response.AppendHeader("content-disposition", "filename=" & CStr(dBContent("ImageFileName")))
                        Response.ContentType = CType(dBContent("ImageContentType"), String)
                        ' output the actual document contents to the response output stream
                        Response.OutputStream.Write(CType(dBContent("Image"), Byte()), 0, CInt(dBContent("ImageContentSize")))
                    Else 'This is the cover letter
                        Response.AppendHeader("content-disposition", "filename=" & CStr(dBContent("ImageFileName1")))
                        Response.ContentType = CType(dBContent("ImageContentType1"), String)
                        ' output the actual document contents to the response output stream
                        Response.OutputStream.Write(CType(dBContent("Image1"), Byte()), 0, CInt(dBContent("ImageContentSize1")))
                    End If
                    Response.End()
                    dBContent.Close()
                    
                    Exit Try
                Catch ex As Exception
                    Response.Write("Error Code:" & ex.Message.ToString())
                    Response.End()
                Finally
                    If dBContent.IsClosed = False Then
                        dBContent.Close()
                    End If
                End Try            

        End Sub
    
    

</script>
