using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;
using RedSocialEntity;
using RedSocialData;

namespace RedSocialDataSQLServer
{
    public class GrupoUsuarioDA
    {
        public GrupoUsuarioDA()
        {
        }

        #region Métodos Privados
        private GrupoUsuarioEntity CrearGrupoUsuario(SqlDataReader cursor)
        {
            GrupoUsuarioEntity grupoUsuario = new GrupoUsuarioEntity();
            grupoUsuario.grupoID = cursor.GetInt32(cursor.GetOrdinal("GrupoID"));
            grupoUsuario.usuarioID = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));            

            return grupoUsuario;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(GrupoUsuarioEntity grupoUsuario)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("GrupoUsuarioInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@GrupoID"].Value = grupoUsuario.grupoID;
                        comando.Parameters["@UsuarioID"].Value = grupoUsuario.usuarioID;
                        comando.ExecuteNonQuery();                        
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el usuario al grupo.", ex);
            }
        }

        #endregion Métodos Públicos
    }
}
