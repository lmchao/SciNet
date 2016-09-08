using System;
using System.Data.SqlClient;
using System.Configuration;

namespace RedSocialDataSQLServer
{
    internal class ConexionDA
    {
        private ConexionDA()
        {
        }

        public static SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString);
            conexion.Open();

            return conexion;
        }
    }
}
