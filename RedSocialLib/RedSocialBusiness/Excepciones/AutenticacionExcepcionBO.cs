using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialBusiness
{
    public class AutenticacionExcepcionBO : ExcepcionBO
    {
        public AutenticacionExcepcionBO() : base("Combinación incorrecta de correo electrónico/contraseña.")
        {
        }
    }
}
