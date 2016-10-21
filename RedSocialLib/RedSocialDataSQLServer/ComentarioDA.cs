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
    public class ComentarioDA
    {
        public ComentarioDA()
        {
        }

        #region Métodos Privados
        private ComentarioEntity CrearComentario(SqlDataReader cursor)
        {
            ComentarioEntity comentario = new ComentarioEntity();
            comentario.id = cursor.GetInt32(cursor.GetOrdinal("ComentarioID"));
            comentario.publicacionID = cursor.GetInt32(cursor.GetOrdinal("PublicacionID"));
            comentario.usuarioID = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
            comentario.texto = cursor.GetString(cursor.GetOrdinal("ComentarioTexto"));
            comentario.calificacion = cursor.GetInt32(cursor.GetOrdinal("ComentarioCalificacion"));
            comentario.fechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("ComentarioFechaActualizacion"));


            return comentario;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(ComentarioEntity comentario)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("ComentarioInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@PublicacionID"].Value = comentario.publicacionID;
                        comando.Parameters["@UsuarioID"].Value = comentario.usuarioID;
                        comando.Parameters["@ComentarioTexto"].Value = comentario.texto.Trim();
                        comando.Parameters["@ComentarioCalificacion"].Value = comentario.calificacion;
                        comando.Parameters["@ComentarioFechaActualizacion"].Value = comentario.fechaActualizacion;
                        comando.ExecuteNonQuery();
                        comentario.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el comentario.", ex);
            }
        }

        public static List<ComentarioEntity> BuscarComentarios(object filtro)
        {
            try
            {
                string query = "SELECT * FROM Comentario WHERE ";
                string parameterID = "";
                List<ComentarioEntity> comentarios = new List<ComentarioEntity>();
                if (filtro.GetType().Name == "PublicacionEntity")
                {
                    parameterID = ((GrupoEntity)filtro).id.ToString();
                    query += "PublicacionID = @Parameter_ID";
                }
                if (filtro.GetType().Name == "UsuarioEntity")
                {
                    parameterID = ((UsuarioEntity)filtro).id.ToString();
                    query += "UsuarioID = @Parameter_ID";
                }

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@Parameter_ID", parameterID);
                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            while (cursor != null && cursor.Read())
                            {
                                ComentarioEntity comentario = new ComentarioEntity();
                                comentario.id = (int)cursor["ComentarioID"];
                                comentario.publicacionID = (int)cursor["PublicacionID"];
                                comentario.usuarioID = (int)cursor["UsuarioID"];
                                comentario.texto = (string)cursor["ComentarioTexto"];
                                comentario.calificacion = (int)cursor["ComentarioCalificacion"];
                                comentario.fechaActualizacion = (DateTime)cursor["ComentarioFechaActualizacion"];
                                                               
                                comentarios.Add(comentario);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return comentarios;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar la lista de publicaciones.", ex);
            }
        }
        //public void Actualizar(int id, string nombreArchivo, byte[] archivoFoto)
        //{
        //    try
        //    {
        //        FileInfo infoArchivo = new FileInfo(nombreArchivo);

        //        string rutaFotos = ConfigurationManager.AppSettings["RutaFotos"];
        //        string nuevoNombreArchivo = id.ToString() + infoArchivo.Extension;

        //        using (FileStream archivo = File.Create(rutaFotos + nuevoNombreArchivo))
        //        {
        //            archivo.Write(archivoFoto, 0, archivoFoto.Length);
        //            archivo.Close();
        //        }

        //        using (SqlConnection conexion = ConexionDA.ObtenerConexion())
        //        {
        //            using (SqlCommand comando = new SqlCommand("UsuarioActualizarFoto", conexion))
        //            {
        //                comando.CommandType = CommandType.StoredProcedure;
        //                SqlCommandBuilder.DeriveParameters(comando);

        //                comando.Parameters["@UsuarioID"].Value = id;
        //                comando.Parameters["@UsuarioFoto"].Value = nuevoNombreArchivo;
        //                comando.ExecuteNonQuery();
        //            }

        //            conexion.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ExcepcionDA("Se produjo un error al actualizar la foto.", ex);
        //    }
        //}

        //public bool ExisteEmail(string email)
        //{
        //    try
        //    {
        //        bool existeEmail;

        //        using (SqlConnection conexion = ConexionDA.ObtenerConexion())
        //        {
        //            using (SqlCommand comando = new SqlCommand("UsuarioBuscarEmail", conexion))
        //            {
        //                comando.CommandType = CommandType.StoredProcedure;
        //                SqlCommandBuilder.DeriveParameters(comando);

        //                comando.Parameters["@UsuarioEmail"].Value = email.Trim();
        //                existeEmail = Convert.ToBoolean(comando.ExecuteScalar());
        //            }

        //            conexion.Close();
        //        }

        //        return existeEmail;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ExcepcionDA("Se produjo un error al buscar por email.", ex);
        //    }
        //}

        //public GrupoEntity BuscarGrupo(string nombre)
        //{
        //    try
        //    {
        //        UsuarioEntity usuario = null;

        //        using (SqlConnection conexion = ConexionDA.ObtenerConexion())
        //        {
        //            using (SqlCommand comando = new SqlCommand("UsuarioBuscarPorEmailPassword", conexion))
        //            {
        //                comando.CommandType = CommandType.StoredProcedure;
        //                SqlCommandBuilder.DeriveParameters(comando);

        //                comando.Parameters["@UsuarioEmail"].Value = email.Trim();
        //                comando.Parameters["@UsuarioPassword"].Value = password.Trim();

        //                using (SqlDataReader cursor = comando.ExecuteReader())
        //                {
        //                    if (cursor.Read())
        //                    {
        //                        usuario = CrearUsuario(cursor);
        //                    }

        //                    cursor.Close();
        //                }
        //            }

        //            conexion.Close();
        //        }

        //        return usuario;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ExcepcionDA("Se produjo un error al buscar por email y contraseña.", ex);
        //    }
        //}
        #endregion Métodos Públicos
    }
}
