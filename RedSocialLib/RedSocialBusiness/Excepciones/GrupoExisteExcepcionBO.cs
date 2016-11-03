using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialBusiness
{
    public class GrupoExisteExcepcionBO : ExcepcionBO
    {
        public GrupoExisteExcepcionBO() : base("El grupo ya existe, seleccione otro nombre.") { }
    }
}
