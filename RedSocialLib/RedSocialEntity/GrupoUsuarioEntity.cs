using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class GrupoUsuarioEntity
    {
        public GrupoUsuarioEntity()
        {
            grupoID = 0;
            usuarioID = 0;
        }

        public int grupoID { get; set; }

        public int usuarioID { get; set; }

        public void ValidarDatos()
        {
            if (grupoID < 1 || usuarioID < 1)
            {
                throw new DatosObligatoriosExcepcion();
            }
        }
    }
}
