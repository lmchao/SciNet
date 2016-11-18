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
            usuario.id = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
            usuario.Nombre = cursor.GetString(cursor.GetOrdinal("UsuarioNombre"));
            usuario.Apellido = cursor.GetString(cursor.GetOrdinal("UsuarioApellido"));
            usuario.Email = cursor.GetString(cursor.GetOrdinal("UsuarioEmail"));
            usuario.Password = cursor.GetString(cursor.GetOrdinal("UsuarioPassword"));
            usuario.FechaNacimiento = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaNacimiento"));
            usuario.Sexo = cursor.GetString(cursor.GetOrdinal("UsuarioSexo"))[0];

            if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFoto")))
                usuario.Foto = cursor.GetString(cursor.GetOrdinal("UsuarioFoto"));

            if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFotoActual")))
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
                        usuario.id = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }
                    
                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar el usuario.", ex);
            }
        }

        public void ActualizarFoto(int id, string nombreArchivo, byte[] archivoFoto)
        {
            try
            {
                FileInfo infoArchivo = new FileInfo(nombreArchivo);
                
                string rutaFotos = ConfigurationManager.AppSettings["RutaFotos"];
                string nuevoNombreArchivo = id.ToString() + infoArchivo.Extension;
                /*
                using (FileStream archivo = File.Create(rutaFotos + nuevoNombreArchivo))
                {
                    archivo.Write(archivoFoto, 0, archivoFoto.Length);
                    archivo.Close();
                }
                */
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

        public void Actualizar(UsuarioEntity usuario)
        {
            try
            {
                string query = "UPDATE USUARIO SET " 
                               + "UsuarioNombre = @NOMBRE, "
                               + "UsuarioApellido = @APELLIDO, "
                               + "UsuarioFechaNacimiento = @FECHANACIMIENTO, "
                               + "UsuarioSexo = @SEXO, "
                               + "UsuarioFoto = @FOTO, "
                               + "UsuarioFechaActualizacion = GETDATE(), "
                               + "UsuarioFotoActual = @FOTOACTUAL " 
                               + "WHERE UsuarioID = @ID";
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@ID", usuario.id.ToString());
                        comando.Parameters.AddWithValue("@NOMBRE", usuario.Nombre);
                        comando.Parameters.AddWithValue("@APELLIDO", usuario.Apellido);
                        comando.Parameters.AddWithValue("@FECHANACIMIENTO", usuario.FechaNacimiento);
                        comando.Parameters.AddWithValue("@SEXO", usuario.Sexo);
                        comando.Parameters.AddWithValue("@FOTO", usuario.Foto);
                        comando.Parameters.AddWithValue("@FOTOACTUAL", usuario.FotoActual);
                        comando.Parameters.AddWithValue("@UsuarioFotoActual", usuario.FotoActual);
                        
                        comando.ExecuteNonQuery();
                    }

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

        public static List<UsuarioEntity> BuscarUsuariosParaAmistad(UsuarioEntity usuario, string nombre)
        {
            try
            {
                string query = "SELECT * FROM Usuario AS U WHERE NOT EXISTS (SELECT UsuarioID FROM Solicitud WHERE UsuarioIDSolicita = ";

                query += usuario.id.ToString();

                query += " AND UsuarioID = U.UsuarioID) AND NOT EXISTS (SELECT UsuarioID FROM Amigo WHERE UsuarioID = ";

                query += usuario.id.ToString();

                query += " AND UsuarioIDAmigo = U.UsuarioID) AND U.UsuarioID != ";

                query += usuario.id.ToString();

                if (nombre != "")
                {
                    nombre.Replace(" ", "%");
                    query += " AND UsuarioNombre LIKE '%" + nombre + "%' ORDER BY UsuarioNombre";
                }

                List<UsuarioEntity> usuarios = new List<UsuarioEntity>();

                //string parameterID = "";
                
                //parameterID = usuario.id.ToString();

                //if (propios)
                //{
                //    query += "UsuarioIDSolicita = @Parameter_ID";
                //}
                //else
                //{
                //    query += "UsuarioID = @Parameter_ID";
                //}

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        //comando.Parameters.AddWithValue("@Parameter_ID", parameterID);
                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            while (cursor != null && cursor.Read())
                            {
                                UsuarioEntity usuarioAux = new UsuarioEntity();

                                usuarioAux.id = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
                                usuarioAux.Nombre = cursor.GetString(cursor.GetOrdinal("UsuarioNombre"));
                                usuarioAux.Apellido = cursor.GetString(cursor.GetOrdinal("UsuarioApellido"));
                                usuarioAux.Email = cursor.GetString(cursor.GetOrdinal("UsuarioEmail"));
                                usuarioAux.Password = cursor.GetString(cursor.GetOrdinal("UsuarioPassword"));
                                usuarioAux.FechaNacimiento = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaNacimiento"));
                                usuarioAux.Sexo = cursor.GetString(cursor.GetOrdinal("UsuarioSexo"))[0];

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFoto")))
                                    usuarioAux.Foto = cursor.GetString(cursor.GetOrdinal("UsuarioFoto"));

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFotoActual")))
                                    usuarioAux.FotoActual = (byte[])cursor["UsuarioFotoActual"];

                                usuarioAux.FechaRegistracion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaRegistracion"));

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFechaActualizacion")))
                                    usuarioAux.FechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaActualizacion"));
                                usuarios.Add(usuarioAux);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return usuarios;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar la lista de usuarios.", ex);
            }
        }

        public static List<UsuarioEntity> BuscarUsuariosAmigos(UsuarioEntity usuario)
        {
            try
            {
                string query = "SELECT u1.* from usuario as U ";
                query += "inner join Amigo as a on(u.UsuarioID = a.UsuarioID or u.UsuarioID = a.UsuarioIDAmigo) ";
                query += "inner join usuario as u1 on(u1.UsuarioID = a.UsuarioID or u1.UsuarioID = a.UsuarioIDAmigo) ";
                query += "where u.UsuarioID = ";
                query += usuario.id.ToString();
                query += " and u1.UsuarioID <> ";
                query += usuario.id.ToString();

                List<UsuarioEntity> usuarios = new List<UsuarioEntity>();

                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        //comando.Parameters.AddWithValue("@Parameter_ID", parameterID);
                        using (SqlDataReader cursor = comando.ExecuteReader())
                        {
                            while (cursor != null && cursor.Read())
                            {
                                UsuarioEntity usuarioAux = new UsuarioEntity();

                                usuarioAux.id = cursor.GetInt32(cursor.GetOrdinal("UsuarioID"));
                                usuarioAux.Nombre = cursor.GetString(cursor.GetOrdinal("UsuarioNombre"));
                                usuarioAux.Apellido = cursor.GetString(cursor.GetOrdinal("UsuarioApellido"));
                                usuarioAux.Email = cursor.GetString(cursor.GetOrdinal("UsuarioEmail"));
                                usuarioAux.Password = cursor.GetString(cursor.GetOrdinal("UsuarioPassword"));
                                usuarioAux.FechaNacimiento = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaNacimiento"));
                                usuarioAux.Sexo = cursor.GetString(cursor.GetOrdinal("UsuarioSexo"))[0];

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFoto")))
                                    usuarioAux.Foto = cursor.GetString(cursor.GetOrdinal("UsuarioFoto"));

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFotoActual")))
                                    usuarioAux.FotoActual = (byte[])cursor["UsuarioFotoActual"];

                                usuarioAux.FechaRegistracion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaRegistracion"));

                                if (!cursor.IsDBNull(cursor.GetOrdinal("UsuarioFechaActualizacion")))
                                    usuarioAux.FechaActualizacion = cursor.GetDateTime(cursor.GetOrdinal("UsuarioFechaActualizacion"));
                                usuarios.Add(usuarioAux);
                            }

                            cursor.Close();
                        }
                    }

                    conexion.Close();
                }

                return usuarios;
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al buscar la lista de usuarios.", ex);
            }
        }
        #endregion Métodos Públicos
    }
}
