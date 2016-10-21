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
    private GrupoBO boGrupo = new GrupoBO();
    private GrupoUsuarioBO boGrupoUsuario = new GrupoUsuarioBO();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //for (int i = 1; i < 32; i++)
            //{
            //    ddlDia.Items.Add(new ListItem(i.ToString(), i.ToString()));
            //}

            //for (int i = DateTime.Now.Year; i > 1904; i--)
            //{
            //    ddlAnio.Items.Add(new ListItem(i.ToString(), i.ToString()));
            //}
        }
    }

    protected void btnCrearGrupo_Click(object sender, EventArgs e)
    {
        try
        {
            GrupoEntity grupo = new GrupoEntity();
            grupo.nombre = txtNombre.Text;            
            grupo.descripcion = txtDescripcion.Text;
            boGrupo.Registrar(grupo);

            GrupoUsuarioEntity grupoUsuario = new GrupoUsuarioEntity();
            grupoUsuario.grupoID = grupo.id;
            grupoUsuario.usuarioID = SessionHelper.UsuarioAutenticado.id;
            boGrupoUsuario.Registrar(grupoUsuario);

            //SessionHelper.AlmacenarUsuarioAutenticado(boUsuario.Autenticar(txtEmail.Text, txtPassword.Text));
            //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.UsuarioAutenticado.Email, false);
        }
        catch (ValidacionExcepcionAbstract ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
    }
}