﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropBoxAuthorizing.aspx.cs" Inherits="Evotiva.Providers.DNNGlobalStorage.DropBoxAuthorizing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DropBox Configuration</title>
        <link id="DefaultStylesheet" runat="server" rel="stylesheet" type="text/css" href="~/Portals/_default/default.css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <asp:Label runat="server" ID="lblDropBoxAuthorizationMessage" />        
            </div>
        </form>
    </body>
</html>