using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class EmailExcepcion : ValidacionExcepcionAbstract
    {
        public EmailExcepcion() : base("El email es inválido.")
        {
        }
    }
}
