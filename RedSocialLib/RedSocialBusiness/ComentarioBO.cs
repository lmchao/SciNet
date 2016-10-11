using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    public class ComentarioBO
    {
        private ComentarioDA daComentario;

        public ComentarioBO()
        {
            daComentario = new ComentarioDA();
        }

        //public ComentarioEntity Autenticar(string email, string password)
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

        public void Registrar(ComentarioEntity comentario)
        {
            try
            {
                comentario.ValidarDatos();

                daComentario.Insertar(comentario);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del comentario.", ex);
            }
        }

        //public void ActualizarFoto(int id, string nombreArchivo, byte[] archivoFoto)
        //{
        //    try
        //    {
        //        daUsuario.Actualizar(id, nombreArchivo, archivoFoto);
        //    }
        //    catch (ExcepcionDA ex)
        //    {
        //        throw new ExcepcionBO("No se pudo actualizar la foto.", ex);
        //    }
        //}
    }
}
