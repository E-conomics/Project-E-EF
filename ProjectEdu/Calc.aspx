<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calc.aspx.cs" Inherits="Calc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script src="scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/Chart.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#divbtnInv").hide();
            $("#opEspeciales").hide();
        }
       );
        $(document).ready(function () {
            $('#btnChange').click(function () {
                // alert("hey");
                $("#divbtnVis").hide();
                $("#divbtnInv").show();
                $("#opNormales").hide();
                $("#opEspeciales").show();
            });
        });
        $(document).ready(function () {
            $('#btnChange2').click(function () {
                // alert("hey");
                $("#divbtnVis").show();
                $("#divbtnInv").hide();
                $("#opNormales").show();
                $("#opEspeciales").hide();
            });
        });
        $(document).ready(function () {
            $('#btnCalcular').click(function () {
                var monto= $("#txtMonto").val();
                var frecuencia= $("#sltTemporal option:selected").val();
                var escuela= $("#sltUniversidad option:selected").val();
                var edad= $("#sltEdad option:selected").val();
                var ahorrado= $("#txtAhorrado").val();
                // alert("hey");
                MiFuncionObj(monto,frecuencia,escuela,edad,ahorrado);
            });
        });
        function MiFuncionObj(a,b,c,d,e) {
            var obJason = {
                "monto":a,
                "frecuencia": b,
                "escuela": c,
                "edad": d,
                "ahorrado":e
            }
            var actiondata = JSON.stringify(obJason);
            //var actiondata = obJason;
            //alert("listen");
            $.ajax(
                {
                    url: "http://localhost/ProjectEdu/WebService.asmx/CalcularPorcentaje",
                    data: "{'calc':" + actiondata + "}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        alert(msg.d.num1);
                        //for (var i = 0; i < msg.all.length; i++) {
                        //    alert(msg.all[i].textContent);
                        //}
                        Desu(msg);
                        
                        //       alert(msg.d.idUser);
                        //if (msg.d.Identificador != 0) {
                        //    alert("Bienvendio usuario! Buen Dia!");
                        //    window.location.replace("http://localhost/ProjectEdu/lol.aspx");
                        //}
                        //else {
                        //    alert("Usuario y/o contraseña incorrecta");
                        //}

                    },
                    error: function (result) { alert("ERROR" + result.status + '' + result.statusText); }

                }
                );
        }
        
           

        
         </script>
      
</head>
<body>
    <div id="divbtnVis">
    <button id="btnChange" >¿Aun no estas convencido? Presiona Aqui</button>
        </div>
    <div id="divbtnInv">
        <button id="btnChange2" >Volver al menu anterior</button>
        </div>
    <select id="sltUniversidad">
         <option value="21933">Publica</option>
         <option value="183060">UDL</option>
         <option value="279120">Universidad de la Salle</option>
         <option value="245430">Univa</option>
         <option value="457825">Ibero</option>
    </select>
    <select id="sltEdad">
        <option value="0">Menor de un año</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
    </select>
    <input id="hiddenField" value="cnv" hidden="hidden"/>
    <div id="opNormales">
            <input id="txtMonto" placeholder="Monto" />
    </div>

        <div id="opEspeciales" >
             <select id="sltArticulo" >
        <option value="11">Refresco</option>
        <option value="10">Frituras</option>
        <option value="5">Golosinas Diversas</option>
        <option value="39">Cajetilla de Cigarro</option>
        <option value="120">Six de Cerveza</option>
    </select>
            <label>Elije un producto</label>
        </div>
     <select id="sltTemporal" >
        <option value="52">Semanal</option>
        <option value="26">Quincenal</option>
        <option value="12">Mensual</option>
    </select>
    <input id="txtAhorrado" placeholder="¿Tengo un dinero extra?" value="0" />
    <input type="button" id="btnCalcular" value="Calcular" />
    <canvas id="myNewChart" width="400" height="400"></canvas>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
     <script type="text/javascript">
         function Desu(Lista) {
             alert("ok");
             var ctx = document.getElementById("myNewChart").getContext("2d");

             var data = {
                 labels: ["16", "17", "18"],
                 datasets: [
                     {
                         fillColor: "rgba(220,220,220,0.5)",
                         strokeColor: "rgba(220,220,220,1)",
                         pointColor: "rgba(220,220,220,1)",
                         pointStrokeColor: "#fff",
                         data: [Lista.d.num1, Lista.d.num2, Lista.d.num3]
                     },
                     {
                         fillColor: "rgba(151,187,205,0.5)",
                         strokeColor: "rgba(151,187,205,1)",
                         pointColor: "rgba(151,187,205,1)",
                         pointStrokeColor: "#fff",
                         data: [28, 48, 40]
                     }
                 ]
             }
             var myNewChart = new Chart(ctx).Line(data);
         }


         </script>
</body>
</html>
