using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialBusiness;
using RedSocialDataSQLServer;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialComun;

public partial class actualizardatos : System.Web.UI.Page
{
    private UsuarioBO boUsuario = new UsuarioBO();
    protected void Page_Load(object sender, EventArgs e)
    {
       
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

            if (SessionHelper.UsuarioAutenticado != null)
            {
                UsuarioEntity usuario = SessionHelper.UsuarioAutenticado;
                txtNombre.Text = usuario.Nombre;
                txtApellido.Text = usuario.Apellido;
                txtPassword.Text = usuario.Password;
                ddlAnio.SelectedValue = usuario.FechaNacimiento.Year.ToString();
                ddlMes.SelectedValue = usuario.FechaNacimiento.Month.ToString();
                ddlDia.SelectedValue = usuario.FechaNacimiento.Day.ToString();

                //usuario.Sexo = (ControlsHelper.RadioSeleccionado("Debe seleccionar el sexo.", radMujer, radHombre) == radMujer ? 'F' : 'M');

            }

            
        }
        txtPassword.Attributes["type"] = "password";
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

    protected void btnCargarFotoPerfil_Click(object sender, EventArgs e)
    {
        if (fupCargarFotoPerfil.HasFile)
        {
            Stream fs = fupCargarFotoPerfil.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            //boUsuario.ActualizarFoto(SessionHelper.UsuarioAutenticado.id, fupCargarFotoPerfil.FileName, bytes);
            SessionHelper.UsuarioAutenticado.FotoActual = bytes;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;
        }
    }
    protected void btnRegistrate_Click(object sender, EventArgs e)
    {
        try
        {
            UsuarioEntity usuario = SessionHelper.UsuarioAutenticado;
            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Password = txtPassword.Text;
            usuario.FechaNacimiento = Util.ObtenerFecha(
                int.Parse(ddlAnio.SelectedValue),
                int.Parse(ddlMes.SelectedValue),
                int.Parse(ddlDia.SelectedValue));
            usuario.Sexo = (ControlsHelper.RadioSeleccionado("Debe seleccionar el sexo.", radMujer, radHombre) == radMujer ? 'F' : 'M');

            boUsuario.save(usuario);

            //SessionHelper.AlmacenarUsuarioAutenticado(boUsuario.Autenticar(txtEmail.Text, txtPassword.Text));
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.UsuarioAutenticado.Email, false);
        }
        catch (ValidacionExcepcionAbstract ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
    }
}