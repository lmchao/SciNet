using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    public class GrupoUsuarioBO
    {
        private GrupoUsuarioDA daGrupoUsuario;

        public GrupoUsuarioBO()
        {
            daGrupoUsuario = new GrupoUsuarioDA();
        }

        
        public void Registrar(GrupoUsuarioEntity grupoUsuario)
        {
            try
            {

                grupoUsuario.ValidarDatos();

                daGrupoUsuario.Insertar(grupoUsuario);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del usuario en el grupo.", ex);
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
