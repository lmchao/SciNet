using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialWebUtil
{
    public class WebHelper
    {
        private WebHelper()
        {
        }

        public static void MostrarMensaje(System.Web.UI.Page page, string mensaje)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "Mensaje", "alert('" + mensaje + "');", true);
        }
    }
}
