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
    public class PublicacionDA
    {
        public PublicacionDA()
        {

        }
        #region Métodos Privados
        private PublicacionEntity CrearPublicacion(SqlDataReader cursor)
        {
            PublicacionEntity publicacion = new PublicacionEntity();
            publicacion.id = (int)cursor["PublicacionID"];
            publicacion.grupoID = (int)cursor["GrupoID"];
            publicacion.usuarioID = (int)cursor["UsuarioID"];
            publicacion.descripcion = (string)cursor["Descripcion"];
            publicacion.actualizacion = (DateTime)cursor["PublicacionActualizacion"];
            publicacion.calificacion = (int)cursor["PublicacionCalificacion"];
            publicacion.imagen = (byte[])cursor["PublicacionImagen"];
            return publicacion;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public List<PublicacionEntity> BuscarPublicaciones(object filtro)
        {
            try
            {
                string query = "SELECT * FROM Publicacion WHERE ";
                if (filtro.GetType.ToString == "Grupo")
                {
                    query += "GrupoID = @GrupoID";
                }
                    
                List<PublicacionEntity> publicaciones = new List<PublicacionEntity>();

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.Add("@PublicacionEmail", ()filtro.id;

                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            if (cursor.Read())
                            {
                                publicacion = CrearPublicacion(cursor);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return publicaciones;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar por email y contraseña.", ex);
            }
        }
        #endregion Métodos Públicos
    }
}
