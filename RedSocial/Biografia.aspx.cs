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
            List<PublicacionEntity> listPublicaciones = PublicacionBO.Listar(SessionHelper.UsuarioAutenticado);
            

            rptPublicaciones.DataSource = listPublicaciones ;
            rptPublicaciones.DataBind();

            rptGrupos.DataSource = GrupoBO.Listar(SessionHelper.UsuarioAutenticado,true);
            rptGrupos.DataBind();

            

            //rptPublicaciones.DataSource =
        }
    }


    protected void rptPublicaciones_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            PublicacionEntity publicacion = (PublicacionEntity)e.Item.DataItem;

            Image imgUsuarioPost = (Image)e.Item.FindControl("imgPubUsuarioPost");
            Label lblNombreUsuario = (Label)e.Item.FindControl("lblPubNombreUsuario");
            Label lblPubMensaje = (Label)e.Item.FindControl("lblPubMensaje");
            Image imgPubImagen = (Image)e.Item.FindControl("imgPubImagen");
            Label lblPubFecha = (Label)e.Item.FindControl("lblPubFecha");
            Label imgPubRanking = (Label)e.Item.FindControl("imgPubRanking");

            Repeater rptComentarios = (Repeater)e.Item.FindControl("rptComentarios");
            
            lblNombreUsuario.Text = publicacion.usuarioID.ToString() ;
            lblPubMensaje.Text = publicacion.descripcion;
            if (publicacion.imagen != null)
            {
                imgPubImagen.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(publicacion.imagen, 0, publicacion.imagen.Length); ;                
            }
            lblPubFecha.Text = publicacion.actualizacion.ToShortTimeString();

            imgPubRanking.Text = publicacion.calificacion.ToString();


            rptComentarios.DataSource = publicacion.listaComentarios;
            rptComentarios.DataBind();

        }
    }

    protected void rptComentarios_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ComentarioEntity comentario = (ComentarioEntity)e.Item.DataItem;

            Label lblComNombre = (Label)e.Item.FindControl("lblComNombre");
            Label lblComTexto = (Label)e.Item.FindControl("lblComTexto");
            Label lblComFecha = (Label)e.Item.FindControl("lblComFecha");
            Label lblComPuntos = (Label)e.Item.FindControl("lblComPuntos");

            lblComNombre.Text = comentario.usuarioID.ToString();
            lblComTexto.Text = comentario.texto;
            lblComFecha.Text = comentario.fechaActualizacion.ToShortTimeString();
            lblComPuntos.Text = comentario.calificacion.ToString();
        }
    }
}