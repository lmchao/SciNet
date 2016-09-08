using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialBusiness;
using RedSocialEntity;
using RedSocialWebUtil;

public partial class SinAutenticar : System.Web.UI.MasterPage
{
    private UsuarioBO boUsuario = new UsuarioBO();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        try
        {
            SessionHelper.AlmacenarUsuarioAutenticado(boUsuario.Autenticar(txtEmail.Text, txtPassword.Text));
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.UsuarioAutenticado.Email, false);
        }
        catch (AutenticacionExcepcionBO ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
    }
}
