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
                rptGrupos.DataSource = GrupoBO.Listar(SessionHelper.UsuarioAutenticado, false);
                rptGrupos.DataBind();
            }
        }
    }

    protected void rptGrupos_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Inscribirse")
        {
            GrupoUsuarioEntity grupoUsuario = new GrupoUsuarioEntity();
            grupoUsuario.grupoID = Convert.ToInt32(e.CommandArgument);
            grupoUsuario.usuarioID = SessionHelper.UsuarioAutenticado.id;
            new GrupoUsuarioBO().Registrar(grupoUsuario);
                        
            Response.Redirect("Biografia.aspx");
        }
    }
}