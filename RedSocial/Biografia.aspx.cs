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
            rptPublicaciones.DataSource = PublicacionDA.BuscarPublicaciones(SessionHelper.UsuarioAutenticado);
            rptPublicaciones.DataBind();

            //rptPublicaciones.DataSource =
        }
    }
        
}