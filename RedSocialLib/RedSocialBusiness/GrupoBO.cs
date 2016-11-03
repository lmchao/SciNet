using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    public class GrupoBO
    {
        private GrupoDA daGrupo;

        public GrupoBO()
        {
            daGrupo = new GrupoDA();
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

        public void Registrar(GrupoEntity grupo)
        {
            try
            {
                if (daGrupo.Existe(grupo))
                {
                    throw new GrupoExisteExcepcionBO(); 
                }
                grupo.ValidarDatos();
                daGrupo.Insertar(grupo);

            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del grupo.", ex);
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

        public static List<GrupoEntity> Listar(UsuarioEntity usuario, Boolean propios)
        {
            try
            {

                return GrupoDA.BuscarGrupos(usuario, propios);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la busqueda de grupos.", ex);
            }
        }
    }

   
}
