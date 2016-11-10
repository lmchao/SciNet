using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialEntity
{
    public class PublicacionEntity
    {
        public PublicacionEntity() {
            id = 0;
            usuarioID = 0;
            grupoID = 0;
            descripcion = "";
            actualizacion = DateTime.MinValue;
            calificacion = 0;
            imagen = null;
            listaComentarios = new List<ComentarioEntity>();
        }

        public int id { get; set; }
        public int usuarioID { get; set; }
        public int grupoID { get; set; }
        public string descripcion { get; set; }
        public DateTime actualizacion  { get; set; }
        public int calificacion { get; set; }
        public byte[] imagen { get; set; }

        public List<ComentarioEntity> listaComentarios { get; set; }

        public void ValidarDatos()
        {
            if (descripcion.Trim() == "" ||
                actualizacion == DateTime.MinValue)
            {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}
