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
    public class MensajeDA
    {
        public MensajeDA()
        {
        }

        #region Métodos Privados
        private MensajeEntity CrearMensaje(SqlDataReader cursor)
        {
            MensajeEntity mensaje = new MensajeEntity();
            mensaje.id = cursor.GetInt32(cursor.GetOrdinal("MensajeID"));
            mensaje.grupoID = cursor.GetInt32(cursor.GetOrdinal("GrupoID"));
            mensaje.usuarioID = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
            mensaje.fecha = cursor.GetDateTime(cursor.GetOrdinal("MensajeFecha"));
            mensaje.texto = cursor.GetString(cursor.GetOrdinal("MensajeTexto"));            
            
            return mensaje;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(MensajeEntity mensaje)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("MensajeInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@GrupoID"].Value = mensaje.grupoID;
                        comando.Parameters["@UsuarioID"].Value = mensaje.usuarioID;
                        comando.Parameters["@MensajeFecha"].Value = mensaje.fecha;
                        comando.Parameters["@MensajeTexto"].Value = mensaje.texto.Trim();
                        
                        comando.ExecuteNonQuery();
                        mensaje.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el mensaje.", ex);
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

