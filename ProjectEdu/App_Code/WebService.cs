using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
//using System.Web.Mvc.JsonResult;

/// <summary>
/// Descripción breve de WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hola a todos";
    }

    [WebMethod]
    public Username SetSession(Username parametro)
    {
        // Session["Identificador"] = null;
        RnLogin on= new RnLogin();
        //parametro.idUser = on.Login(parametro);
        //HttpContext.Current.Session["identificador"] = parametro.idUser;
        //if (parametro.idUser > 0)
        //{
        //    return parametro;
        //}
        //else
        //{
        //    parametro.idUser = 0;
        //    return parametro;
        //}
        parametro.idUser=1;
        return parametro;


    }
    [WebMethod(EnableSession=true)]
    public Nope CalcularPorcentaje(Calculo calc) 
    {
        double anual = calc.monto * calc.frecuencia;
        double ranual;
        List<double> aportaciones = new List<double>();
        for(int i=0;i<(18-calc.edad);i++)
        {
            Random azar = new Random();
            int luck= azar.Next(1,1100);
            int coin = azar.Next(1, 2);
            if (coin == 1)
            {
                ranual = anual - Convert.ToDouble(luck);
            }
            else 
            {
                ranual = anual + Convert.ToDouble(luck);
            }
            if(i<1)
            {
                aportaciones.Add((anual * .035) + anual);
            }
            else
            {
                aportaciones.Add((aportaciones[i-1]) +(aportaciones[i - 1] * .035) + ranual);
            }
        }
        Nope x = new Nope();
        x.num1 = aportaciones[0];
        x.num2 = aportaciones[1];
        x.num3 = aportaciones[2];
        //HttpContext.Current.Session["Alcance"];
        return x;
    } 
//    [ComVisible(true)]
//    public string GetData()
//    {
//        string test = "[{'Name': 'test1'}, {'Name': 'test2'}, {'Name': 'test3'}]";
//        //string test = "[{"Name": "test1"}, {"Name": test2"}, {"Name": "test3"}]";
//    return test;
//}
}
