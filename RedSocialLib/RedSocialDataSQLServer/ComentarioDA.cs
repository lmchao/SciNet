﻿using System;
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
        private GrupoEntity CrearComentario(SqlDataReader cursor)
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
