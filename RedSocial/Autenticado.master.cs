using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;
using RedSocialWebUtil;

[PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
public partial class Autenticado : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        usuario.Text = SessionHelper.UsuarioAutenticado.Nombre + " " + SessionHelper.UsuarioAutenticado.Apellido;
    }
    protected void CargarFotoPerfil(object sender, EventArgs e)
    {
        if (SessionHelper.UsuarioAutenticado != null)
        {
            Byte[] foto = SessionHelper.UsuarioAutenticado.FotoActual;
            if (foto != null)
            {
                string base64String = Convert.ToBase64String(foto, 0, foto.Length);
                imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
    }
}
