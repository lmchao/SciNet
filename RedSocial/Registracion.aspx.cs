using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialBusiness;
using RedSocialEntity;
using RedSocialComun;
using RedSocialWebUtil;

public partial class Registracion : System.Web.UI.Page
{
    private UsuarioBO boUsuario = new UsuarioBO();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionHelper.UsuarioAutenticado != null) SessionHelper.LogOut();
        if (!Page.IsPostBack)
        {
            for (int i = 1; i < 32; i++)
            {
                ddlDia.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            for (int i = DateTime.Now.Year; i > 1904; i--)
            {
                ddlAnio.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
    }

    protected void btnRegistrate_Click(object sender, EventArgs e)
    {
        try
        {
            UsuarioEntity usuario = new UsuarioEntity();
            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Email = txtEmail.Text;
            usuario.Password = txtPassword.Text;
            usuario.FechaNacimiento = Util.ObtenerFecha(
                int.Parse(ddlAnio.SelectedValue),
                int.Parse(ddlMes.SelectedValue),
                int.Parse(ddlDia.SelectedValue));
            usuario.Sexo = (ControlsHelper.RadioSeleccionado("Debe seleccionar el sexo.", radMujer, radHombre) == radMujer ? 'F' : 'M');

            boUsuario.Registrar(usuario, txtEmailVerificacion.Text);

            SessionHelper.AlmacenarUsuarioAutenticado(boUsuario.Autenticar(txtEmail.Text, txtPassword.Text));
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.UsuarioAutenticado.Email, false);
        }
        catch (ValidacionExcepcionAbstract ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
    }
}