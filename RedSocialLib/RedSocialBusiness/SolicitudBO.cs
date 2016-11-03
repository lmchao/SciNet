using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    public class SolicitudBO
    {
        private SolicitudDA daSolicitud;

        public SolicitudBO()
        {
            daSolicitud = new SolicitudDA();
        }

        public static List<SolicitudEntity> Listar(UsuarioEntity usuario, Boolean propios)
        {
            try
            {                
                return SolicitudDA.BuscarSolicitudes(usuario,propios);                
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la busqueda de solicitudes.", ex);
            }
        }

        public void Registrar(SolicitudEntity solicitud)
        {
            try
            {
                solicitud.ValidarDatos();

                daSolicitud.Insertar(solicitud);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración de la solicitud.", ex);
            }
        }

        //public void save(UsuarioEntity usuario)
        //{
        //    try
        //    {
        //        daUsuario.Actualizar(usuario);
        //    }
        //    catch (ExcepcionDA ex)
        //    {
        //        throw new ExcepcionBO("No se pudieron guardar los cambios.", ex);
        //    }

        //}

        //public void ActualizarFoto(int id, string nombreArchivo, byte[] archivoFoto)
        //{
        //    try
        //    {
        //        daUsuario.ActualizarFoto(id, nombreArchivo, archivoFoto);
        //    }
        //    catch (ExcepcionDA ex)
        //    {
        //        throw new ExcepcionBO("No se pudo actualizar la foto.", ex);
        //    }
        //}
    }
}

