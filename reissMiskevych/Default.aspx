<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="reissMiskevych._Default" %>

<!DOCTYPE html>
<html>
    <head>
        <title>xml ja xslt kuvamine</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
        </head>
        <body>
            <h1>xml ja xslt andmete kuvamine</h1>
            <br />
            <div>
                <asp:Xml runat="server" DocumentSource="~/reisid.xml"
                    TransformSource="~/reisidLisa.xslt" />
            </div>
        </body>
    
</html>