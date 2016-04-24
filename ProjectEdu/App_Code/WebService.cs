using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

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
}
