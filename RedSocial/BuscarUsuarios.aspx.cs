using RedSocialBusiness;
using RedSocialDataSQLServer;
using RedSocialEntity;
using RedSocialWebUtil;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Biografia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionHelper.UsuarioAutenticado != null)
        {
            rptUsuarios.DataSource = UsuarioBO.BuscarUsuariosParaAmistad(SessionHelper.UsuarioAutenticado,"");
            rptUsuarios.DataBind();                                  

            //rptPublicaciones.DataSource =
        }
    }

    //protected void CargarFotoPerfil(object sender, EventArgs e)
    //{
    //    if (SessionHelper.UsuarioAutenticado != null)
    //    {
    //        Byte[] foto = SessionHelper.UsuarioAutenticado.FotoActual;
    //        if (foto != null)
    //        {
    //            string base64String = Convert.ToBase64String(foto, 0, foto.Length);
    //            imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;
    //        }
    //    }
    //}

}