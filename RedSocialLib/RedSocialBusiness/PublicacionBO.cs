using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    public class PublicacionBO
    {
        private PublicacionDA daPublicacion;

        public PublicacionBO()
        {
            daPublicacion = new PublicacionDA();
        }

        //public UsuarioEntity Autenticar(string email, string password)
        //{
        //    try
        //    {
        //        UsuarioEntity usuario = daUsuario.BuscarUsuario(email, password);

        //        if (usuario == null)
        //            throw new AutenticacionExcepcionBO();

        //        return usuario;
        //    }
        //    catch (ExcepcionDA ex)
        //    {
        //        throw new ExcepcionBO("No se pudo realizar la registración del usuario.", ex);
        //    }
        //}

        public void Registrar(PublicacionEntity publicacion)
        {
            try
            {
                publicacion.ValidarDatos();

                daPublicacion.Insertar(publicacion);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración de la publicación.", ex);
            }
        }

        public void ActualizarFoto(int id, string nombreArchivo, byte[] archivoFoto)
        {
            try
            {
                daPublicacion.Actualizar(id, archivoFoto);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo actualizar la imagen de la publicación.", ex);
            }
        }

        public static List<PublicacionEntity> Listar(object filtro)
        {
            try
            {

                return PublicacionDA.BuscarPublicaciones(filtro);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la busqueda de publicaciones.", ex);
            }
        }

    }
}
