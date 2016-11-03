using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialEntity
{
    public class SolicitudEntity
    {
        public SolicitudEntity()
        {
            id = 0;
            usuarioID = 0;
            usuarioIDSolicita = 0;
            solicitudEstadoID = 1;
            fechaAlta = DateTime.MinValue;
            fechaActualizacion = DateTime.MinValue;            
        }

        public int id { get; set; }
        public int usuarioID { get; set; }
        public int usuarioIDSolicita { get; set; }
        public int solicitudEstadoID { get; set; }
        public DateTime fechaAlta { get; set; }
        public DateTime fechaActualizacion { get; set; }
        

        public void ValidarDatos()
        {
            if (usuarioID < 1 || usuarioIDSolicita < 1)
            {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}

