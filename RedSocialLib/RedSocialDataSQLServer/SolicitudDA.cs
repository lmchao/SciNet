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
    public class SolicitudDA
    {
        public SolicitudDA()
        {
        }

        #region Métodos Privados
        private SolicitudEntity CrearSolicitud(SqlDataReader cursor)
        {
            SolicitudEntity solicitud = new SolicitudEntity();
            solicitud.id = cursor.GetInt32(cursor.GetOrdinal("SolicitudID"));
            solicitud.usuarioID = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
            solicitud.usuarioIDSolicita = cursor.GetInt32(cursor.GetOrdinal("UsuarioIDSolicita"));
            solicitud.solicitudEstadoID = cursor.GetInt32(cursor.GetOrdinal("SolicitudEstadoID"));
            solicitud.fechaAlta = cursor.GetDateTime(cursor.GetOrdinal("FechaAlta"));
            solicitud.fechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("FechaModificacion"));            

            return solicitud;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(SolicitudEntity solicitud)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("SolicitudInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioID"].Value = solicitud.usuarioID;
                        comando.Parameters["@UsuarioIDSolicita"].Value = solicitud.usuarioIDSolicita;
                        comando.Parameters["@SolicitudEstadoID"].Value = solicitud.solicitudEstadoID;
                        comando.Parameters["@FechaAlta"].Value = solicitud.fechaAlta;
                        comando.Parameters["@FechaModificacion"].Value = solicitud.fechaActualizacion;

                        comando.ExecuteNonQuery();
                        solicitud.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar la solicitud.", ex);
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

        public SolicitudEntity BuscarSolicitud(int usuarioID)
        {
            try
            {
                SolicitudEntity solicitud = null;

                solicitud = BuscarSolicitud("SolicitudBuscarPorUsuarioID", usuarioID);
                
                return solicitud;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar solicitud.", ex);
            }
        }

        public SolicitudEntity BuscarSolicitud(int usuarioIDSolicita, Boolean solicita)
        {
            try
            {
                SolicitudEntity solicitud = null;

                solicitud = BuscarSolicitud("SolicitudBuscarPorUsuarioIDSolicita", usuarioIDSolicita);

                return solicitud;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar solicitud por usuario que solicita.", ex);
            }
        }

        public SolicitudEntity BuscarSolicitud(string comandoSQL, int usuarioID)
        {
            try
            {
                SolicitudEntity solicitud = null;

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(comandoSQL, conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioID"].Value = usuarioID;
                        comando.Parameters["@SolicitudEstadoID"].Value = 1;

                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            if (cursor.Read())
                            {
                                solicitud = CrearSolicitud(cursor);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return solicitud;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar solicitud con Store Procedure: " + comandoSQL, ex);
            }
        }

        public static List<SolicitudEntity> BuscarSolicitudes(UsuarioEntity usuario, Boolean propios)
        {
            try
            {
                string query = "SELECT * FROM Solicitud WHERE ";
                string parameterID = "";
                List<SolicitudEntity> solicitudes = new List<SolicitudEntity>();

                parameterID = usuario.id.ToString();

                if (propios) {                    
                    query += "UsuarioIDSolicita = @Parameter_ID";
                }else{
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
                                SolicitudEntity solicitud = new SolicitudEntity();
                                solicitud.id = (int)cursor["SolicitudID"];
                                solicitud.usuarioID = (int)cursor["UsuarioID"];
                                solicitud.usuarioIDSolicita = (int)cursor["UsuarioIDSolicita"];
                                solicitud.fechaAlta = (DateTime)cursor["FechaAlta"];
                                solicitud.fechaActualizacion = (DateTime)cursor["FechaModificacion"];

                                solicitudes.Add(solicitud);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return solicitudes;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar la lista de publicaciones.", ex);
            }
        }
        #endregion Métodos Públicos
    }
}
