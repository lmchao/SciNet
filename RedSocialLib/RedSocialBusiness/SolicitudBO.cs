﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;

namespace RedSocialBusiness
{
    class SolicitudBO
    {
        private SolicitudDA solicitudDA;  
        public void Crear(UsuarioEntity usuariosolicita, UsuarioEntity usuario)
        {
            try
            {
                SolicitudEntity solicitud = new SolicitudEntity();
                solicitud.usuarioID = usuario.id;
                solicitud.usuarioIDSolicita = usuariosolicita.id;
                solicitud.fechaAlta = DateTime.Now;
                solicitud.fechaActualizacion = DateTime.Now;
                solicitud.solicitudEstadoID = 1;
                solicitud.ValidarDatos();
                solicitudDA.Insertar(solicitud);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la solicitud de contacto.", ex);
            }
        }
        public void Aceptar(SolicitudEntity solicitud)
        {
            try
            {
                solicitudDA.Actualizar(solicitud, 2);
            }
            catch(ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se aceptar la solicitud.", ex);
            }
        }
        public void Rechazar(SolicitudEntity solicitud)
        {
            try
            {
                solicitudDA.Actualizar(solicitud, 3);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se rechazar la solicitud.", ex);
            }
        }
        public static List<SolicitudEntity> Listar(UsuarioEntity usuario, Boolean propios)
        {
            try
            {
                return SolicitudDA.BuscarSolicitudes(usuario, propios);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la busqueda de solicitudes.", ex);
            }
        }
    }
}
