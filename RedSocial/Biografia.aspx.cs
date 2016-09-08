using RedSocialBusiness;
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

    }

    protected void CargarFotoPerfil(object sender, EventArgs e)
    {
        Byte[] foto = SessionHelper.UsuarioAutenticado.FotoActual;
        string base64String = Convert.ToBase64String(foto, 0, foto.Length);
        imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;

    }

    protected void btnCargarFotoPerfil_Click(object sender, EventArgs e)
    {
        if (fupCargarFotoPerfil.HasFile)
        {
            

            UsuarioBO usuarioNegocio = new UsuarioBO();
            
            
            Stream fs = fupCargarFotoPerfil.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);

            usuarioNegocio.ActualizarFoto(SessionHelper.UsuarioAutenticado.Id, fupCargarFotoPerfil.FileName, bytes);

            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;
            

        }
    }
}