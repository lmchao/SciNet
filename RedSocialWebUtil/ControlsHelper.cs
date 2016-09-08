using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace RedSocialWebUtil
{
    public class ControlsHelper
    {
        private ControlsHelper()
        {
        }

        public static RadioButton RadioSeleccionado(string mensaje, params RadioButton[] radios)
        {
            foreach (RadioButton radioButton in radios)
            {
                if (radioButton.Checked)
                    return radioButton;
            }

            throw new WebUtilExcepcion(mensaje);
        }
    }
}
