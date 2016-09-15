using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class GrupoEntity
    {
        public GrupoEntity()
        {
            id = 0;
            nombre = "";
            descripcion = "";
            fechaCreacion = DateTime.Now;
            fechaActualizacion = DateTime.Now;
        }

        public int id { get; set; }

        public string nombre { get; set; }

        public string descripcion { get; set; }

        public DateTime fechaCreacion { get; set; }

        public DateTime fechaActualizacion { get; set; }

        public void ValidarDatos()
        {
            if (nombre.Trim() == "" ||
                descripcion.Trim() == "")
            {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}
