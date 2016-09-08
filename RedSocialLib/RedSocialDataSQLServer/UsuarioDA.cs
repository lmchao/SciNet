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
    public class UsuarioDA
    {
        public UsuarioDA()
        {
        }

        #region Métodos Privados
        private UsuarioEntity CrearUsuario(SqlDataReader cursor)
        {
            UsuarioEntity usuario = new UsuarioEntity();
            usuario.Id = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
            usuario.Nombre = cursor.GetString(cursor.GetOrdinal("UsuarioNombre"));
            usuario.Apellido = cursor.GetString(cursor.GetOrdinal("UsuarioApellido"));
            usuario.Email = cursor.GetString(cursor.GetOrdinal("UsuarioEmail"));
            usuario.Password = cursor.GetString(cursor.GetOrdinal("UsuarioPassword"));
            usuario.FechaNacimiento = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaNacimiento"));
            usuario.Sexo = cursor.GetString(cursor.GetOrdinal("UsuarioSexo"))[0];

            if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFoto")))
                usuario.Foto = cursor.GetString(cursor.GetOrdinal("UsuarioFoto"));

            if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFotoActual")))
                //usuario.FotoActual = (byte[]) cursor.GetString(cursor.GetOrdinal("UsuarioFotoActual")).;
                usuario.FotoActual = (byte[])cursor["UsuarioFotoActual"];


                usuario.FechaRegistracion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaRegistracion"));

            if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFechaActualizacion")))
                usuario.FechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaActualizacion"));

            return usuario;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(UsuarioEntity usuario)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("UsuarioInsert", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioNombre"].Value = usuario.Nombre.Trim();
                        comando.Parameters["@UsuarioApellido"].Value = usuario.Apellido.Trim();
                        comando.Parameters["@UsuarioEmail"].Value = usuario.Email.Trim();
                        comando.Parameters["@UsuarioPassword"].Value = usuario.Password.Trim();
                        comando.Parameters["@UsuarioFechaNacimiento"].Value = usuario.FechaNacimiento;
                        comando.Parameters["@UsuarioSexo"].Value = usuario.Sexo;
                        comando.Parameters["@UsuarioFechaRegistracion"].Value = usuario.FechaRegistracion;
                        comando.ExecuteNonQuery();
                        usuario.Id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }
                    
                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el usuario.", ex);
            }
        }

        public void Actualizar(int id, string nombreArchivo, byte[] archivoFoto)
        {
            try
            {
                FileInfo infoArchivo = new FileInfo(nombreArchivo);
                
                string rutaFotos = ConfigurationManager.AppSettings["RutaFotos"];
                string nuevoNombreArchivo = id.ToString() + infoArchivo.Extension;

                using (FileStream archivo = File.Create(rutaFotos + nuevoNombreArchivo))
                {
                    archivo.Write(archivoFoto, 0, archivoFoto.Length);
                    archivo.Close();
                }
                
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("UsuarioActualizarFoto", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioID"].Value = id;
                        comando.Parameters["@UsuarioFoto"].Value = nuevoNombreArchivo;
                        comando.Parameters["@UsuarioFotoActual"].Value = archivoFoto;
                        comando.ExecuteNonQuery();
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al actualizar la foto.", ex);
            }
        }

        public bool ExisteEmail(string email)
        {
            try
            {
                bool existeEmail;

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("UsuarioBuscarEmail", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioEmail"].Value = email.Trim();
                        existeEmail = Convert.ToBoolean(comando.ExecuteScalar());
                    }

                    conexion.Close();
                }

                return existeEmail;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar por email.", ex);
            }
        }

        public UsuarioEntity BuscarUsuario(string email, string password)
        {
            try
            {
                UsuarioEntity usuario = null;
                
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("UsuarioBuscarPorEmailPassword", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@UsuarioEmail"].Value = email.Trim();
                        comando.Parameters["@UsuarioPassword"].Value = password.Trim();
                        
                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            if (cursor.Read())
                            {
                                usuario = CrearUsuario(cursor);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return usuario;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar por email y contraseña.", ex);
            }
        }
        #endregion Métodos Públicos
    }
}
