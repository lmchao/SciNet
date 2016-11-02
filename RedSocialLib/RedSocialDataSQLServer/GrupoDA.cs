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
    public class GrupoDA
    {
        public GrupoDA()
        {
        }

        #region Métodos Privados
        private GrupoEntity CrearGrupo(SqlDataReader cursor)
        {
            GrupoEntity grupo = new GrupoEntity();
            grupo.id = cursor.GetInt32(cursor.GetOrdinal("GrupoID"));
            grupo.nombre = cursor.GetString(cursor.GetOrdinal("GrupoNombre"));
            grupo.descripcion = cursor.GetString(cursor.GetOrdinal("GrupoDescripcion"));
            grupo.fechaCreacion = cursor.GetDateTime(cursor.GetOrdinal("GrupoFechaCreacion"));
            grupo.fechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("GrupoFechaActualizacion"));

            
            return grupo;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(GrupoEntity grupo)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("GrupoInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@GrupoNombre"].Value = grupo.nombre.Trim();
                        comando.Parameters["@GrupoDescripcion"].Value = grupo.descripcion.Trim();
                        comando.Parameters["@GrupoFechaCreacion"].Value = grupo.fechaCreacion;
                        comando.Parameters["@GrupoFechaActualizacion"].Value = grupo.fechaActualizacion;
                        comando.ExecuteNonQuery();
                        grupo.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }



                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el grupo.", ex);
            }
        }

        public static List<GrupoEntity> BuscarGrupos(UsuarioEntity usuario, Boolean propios)
        {
            try
            {
                string query = "SELECT * FROM Grupo G LEFT JOIN GrupoUsuario GU ON (G.GrupoID = GU.GrupoID) WHERE GU.UsuarioID ";
                string parameterID = "";
                List<GrupoEntity> grupos = new List<GrupoEntity>();
                
                parameterID = ((UsuarioEntity)usuario).id.ToString();

                if (propios) {
                    query += " = ";
                } else  {
                    query += " <> ";
                }

                query += " @Parameter_ID";                

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@Parameter_ID", parameterID);
                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            while (cursor != null && cursor.Read())
                            {
                                GrupoEntity grupo = new GrupoEntity();
                                grupo.id = (int)cursor["GrupoID"];
                                grupo.nombre = (string)cursor["GrupoNombre"];
                                grupo.descripcion = (string)cursor["GrupoDescripcion"];
                                grupo.fechaCreacion = (DateTime)cursor["GrupoFechaCreacion"];
                                grupo.fechaActualizacion = (DateTime)cursor["GrupoFechaActualizacion"];
                                
                                grupos.Add(grupo);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return grupos;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar la lista de grupos.", ex);
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
