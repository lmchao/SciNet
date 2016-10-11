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
public partial class actualizardatos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            UsuarioBO usuarioNegocio = new UsuarioBO();
            Stream fs = fupCargarFotoPerfil.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            usuarioNegocio.ActualizarFoto(SessionHelper.UsuarioAutenticado.id, fupCargarFotoPerfil.FileName, bytes);
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            imgFotoPerfil.ImageUrl = "data:image/png;base64," + base64String;
        }
    }
}