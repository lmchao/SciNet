using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class MensajeEntity
    {
        public MensajeEntity()
        {
            id = 0;
            grupoID = 0;
            usuarioID = 0;
            texto = "";
            fecha = DateTime.Now;
            
        }

        public int id { get; set; }

        public int grupoID { get; set; }

        public int usuarioID { get; set; }

        public string texto { get; set; }
        
        public DateTime fecha { get; set; }

        public void ValidarDatos()
        {
            if (texto.Trim() == "" || grupoID < 1 || usuarioID < 1) {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}
