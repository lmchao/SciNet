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

        public bool Insertar(PublicacionEntity publicacion)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("PublicacionInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioID"].Value = publicacion.usuarioID;
                        comando.Parameters["@GrupoID"].Value = publicacion.grupoID;
                        comando.Parameters["@Descripcion"].Value = publicacion.descripcion.Trim();
                        comando.Parameters["@PublicacionActualizacion"].Value = publicacion.actualizacion;
                        comando.Parameters["@ComentarioCalificacion"].Value = publicacion.calificacion;
                        comando.Parameters["@PublicacionImagen"].Value = publicacion.imagen;
                        comando.ExecuteNonQuery();
                        publicacion.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar la publicacion.", ex);
            }
        }
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
				    comando.Parameters.AddWithValue("@GrupoID", ((GrupoEntity)filtro).id);
		        }
		        if (filtro.GetType().Name == "Usuario")
		        {
		            query += "UsuarioID = @UsuarioID";
			        comando.Parameters.AddWithValue("@UsuarioID", ((UsuarioEntity)filtro).Id);	
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

        public void Actualizar(int id, byte[] archivoFoto)
        {
            try
            {
                //FileInfo infoArchivo = new FileInfo(nombreArchivo);

                //string rutaFotos = ConfigurationManager.AppSettings["RutaFotos"];
                //string nuevoNombreArchivo = id.ToString() + infoArchivo.Extension;

                //using (FileStream archivo = File.Create(rutaFotos + nuevoNombreArchivo))
                //{
                //    archivo.Write(archivoFoto, 0, archivoFoto.Length);
                //    archivo.Close();
                //}

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("PublicacionActualizarFoto", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@PublicacionID"].Value = id;                        
                        comando.Parameters["@PublicacionImagen"].Value = archivoFoto;
                        comando.ExecuteNonQuery();
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al actualizar la imagen.", ex);
            }
        }
        #endregion Métodos Públicos


    }
}
