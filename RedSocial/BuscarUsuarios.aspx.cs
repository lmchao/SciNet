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
        if (!IsPostBack)
        {
            if (SessionHelper.UsuarioAutenticado != null)
            {
                rptUsuarios.DataSource = UsuarioBO.BuscarUsuariosParaAmistad(SessionHelper.UsuarioAutenticado, (Request.QueryString["id"] == null) ? "" : Request.QueryString["id"]);
                rptUsuarios.DataBind();

                //rptPublicaciones.DataSource =
            }
        }
    }

    protected void rptUsuarios_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Contactar")
        {
            //SolicitudBO.Crear(SessionHelper.UsuarioAutenticado.id, e.CommandArgument);
        }
    }
}