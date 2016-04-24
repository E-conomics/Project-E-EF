using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using RnConection.DataStorageLayer;

/// <summary>
/// Descripción breve de RnLogin
/// </summary>
public class RnLogin
{
	public RnLogin()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public long Login(Username users)
    {
        DSL _connection = new DSL();
        try
        {
            _connection.Open(ConfigurationManager.ConnectionStrings["dbLogin"].ToString(), RnConection.DataAbstractionLayer.Provedor.SQLServer);
            _connection.InitialSQLStatement("Autenticarse", System.Data.CommandType.StoredProcedure);
            _connection.SetParameterProcedure("@nick", System.Data.ParameterDirection.Input, RnConection.DataAbstractionLayer.eTypes.Cadena, users.user);
            _connection.SetParameterProcedure("@pwd", System.Data.ParameterDirection.Input, RnConection.DataAbstractionLayer.eTypes.Cadena, users.password);
            long IdCredencial = long.Parse(_connection.ReturnObject().ToString());
            return IdCredencial;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            _connection.Close();
        }
    }
    public int CompAuth(long obtainedCred)
    {
        DSL _connection = new DSL();
        try
        {
            _connection.Open(ConfigurationManager.ConnectionStrings["dbLogin"].ToString(), RnConection.DataAbstractionLayer.Provedor.SQLServer);
            _connection.InitialSQLStatement("ComprobarNivel", System.Data.CommandType.StoredProcedure);
            _connection.SetParameterProcedure("@id", System.Data.ParameterDirection.Input, RnConection.DataAbstractionLayer.eTypes.Entero, obtainedCred);
            int NivelAuth = int.Parse(_connection.ReturnObject().ToString());
            return NivelAuth;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            _connection.Close();
        }
    }
    //public Username ObtenerDatos(Trans Datos) 
    //{
    //    DSL _connection = new DSL();
    //    try
    //    {
    //        if (Datos.permisos == 1)
    //        {
    //            _connection.Open(ConfigurationManager.ConnectionStrings["dbLogin"].ToString(), RnConection.DataAbstractionLayer.Provedor.SQLServer);
    //            _connection.InitialSQLStatement("SearchNormalUsers", System.Data.CommandType.StoredProcedure);
    //            _connection.SetParameterProcedure("id", System.Data.ParameterDirection.Input, RnConection.DataAbstractionLayer.eTypes.Entero, Datos.credencial);
                
    //            _connection.ExcecuteStoredProcedureOutput();
                
    //        }
    //        else if (Datos.permisos == 2) 
    //        {
    //            _connection.Open(ConfigurationManager.ConnectionStrings["dbLogin"].ToString(), RnConection.DataAbstractionLayer.Provedor.SQLServer);
    //            _connection.InitialSQLStatement("SearchContributorUsers", System.Data.CommandType.StoredProcedure);
                
    //        }
    //        else if (Datos.permisos == 3)
    //        {
    //            _connection.Open(ConfigurationManager.ConnectionStrings["dbLogin"].ToString(), RnConection.DataAbstractionLayer.Provedor.SQLServer);
    //            _connection.InitialSQLStatement("SearchCompanyUsers", System.Data.CommandType.StoredProcedure);
    //        }
    //        else 
    //        {
    //            throw new Exception("Error Inesperado");
    //        }
    //    }
    //    catch(Exception ex)
    //    {
    //        throw new Exception(ex.Message, ex);
    //    }
    //    finally 
    //    {
    //        _connection.Close();
    //    }
    //}
}