<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Educrea</title>
     <link rel="stylesheet" href="css/reset.css"/>
      <link rel="stylesheet" href="css/style.css"/>
      <link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'/>
    <script src="scripts/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnAcceder').click(function () {
                var nick = $('#txtUser').val();
                var pwd = $('#txtPass').val();
             //   alert("hey");
                MiFuncionObj(nick, pwd);
            });
        });
        function MiFuncionObj(nick, pwd) {
            var obJason = {
                "user": nick,
                "password": pwd
            }
            var actiondata = JSON.stringify(obJason);
            //var actiondata = obJason;
            // alert("listen");
            $.ajax(
                {
                    url: "http://localhost/ProjectEdu/WebService.asmx/SetSession",
                    data: "{'parametro':" + actiondata + "}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                     //   alert(msg.d.idUser);
                        if (msg.d.Identificador != 0) {
                            alert("Bienvendio usuario! Buen Dia!");
                            window.location.replace  ("http://localhost/ProjectEdu/lol.aspx");
                        }
                        else {
                            alert("Usuario y/o contraseña incorrecta");
                        }
                    },
                    error: function (result) { alert("ERROR" + result.status + '' + result.statusText); }

                }
                );
        }
    </script>
    <style>section
{
    font-family: 'PT Sans', sans-serif;

}

    </style>
</head>
<body>
     <section>
            <span></span>
            <h1>Accede a tu cuenta</h1>
            <form>
                <input placeholder='Usuario' type='text' id="txtUser"/>
                <input placeholder='Clave de acceso' type='password' id="txtPass"/>

            </form>
            <button id="btnAcceder">Acceder</button>
            <h2>
                <a href='#' >Recupera tu clave de acceso</a>
                    </h2>

        </section>
    
</body>
</html>
