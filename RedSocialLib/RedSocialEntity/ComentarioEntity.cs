using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class ComentarioEntity
    {
        public ComentarioEntity()
        {
            id = 0;
            publicacionID = 0;
            usuarioID = 0;
            nombreUsuario = "";
            texto = "";
            calificacion = 0;
            fechaActualizacion = DateTime.Now;
        }

        public int id { get; set; }

        public int publicacionID { get; set; }

        public int usuarioID { get; set; }

        public string texto { get; set; }

        public int calificacion { get; set; }

        public DateTime fechaActualizacion { get; set; }

        public string nombreUsuario { get; set; }

        public void ValidarDatos()
        {
            if (texto.Trim() == "" ||
                publicacionID < 1 || usuarioID < 1 )
            {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}
