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
   
                List<PublicacionEntity> publicaciones = new List<PublicacionEntity>();

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
		        if (filtro.GetType().Name == "Grupo")
		        {
		            query += "GrupoID = @GrupoID";
				comando.Parameters.Add("@GrupoID", (GrupoEntity)filtro.id);
		        }
		        if (filtro.GetType().Name == "Usuario")
		        {
		            query += "UsuarioID = @UsuarioID";
			    comando.Parameters.Add("@UsuarioID", (UsuarioEntity)filtro.id);	
		        } 

                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            if (cursor.Read())
                            {
                                publicaciones.Add(CrearPublicacion(cursor));
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
                throw new ExcepcionDA("Se produjo un error al buscar la lista de publicaciones.", ex);
            }
        }
        #endregion Métodos Públicos
    }
}
