<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lol.aspx.cs" Inherits="lol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #btnCalc {
            width: 93px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <button id="btnAgregar">Agregar Hijo</button>
    <button disabled="disabled" id="btnCalc">Calcular</button>
    <form action="Calc.aspx">
            <input type="submit" value="Calcular"/>
    </form>
</body>
</html>
