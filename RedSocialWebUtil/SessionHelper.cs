using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using RedSocialEntity;

namespace RedSocialWebUtil
{
    public class SessionHelper
    {
        private SessionHelper()
        {
        }

        public static void AlmacenarUsuarioAutenticado(UsuarioEntity usuario)
        {
            HttpContext.Current.Session.Add("UsuarioAutenticado", usuario);
        }

        public static void LogOut()
        {
            HttpContext.Current.Session.Remove("UsuarioAutenticado");
        }

        public static UsuarioEntity UsuarioAutenticado
        {
            get
            {
                return (UsuarioEntity)HttpContext.Current.Session["UsuarioAutenticado"];
            }
        }

        public static void AlmacenarGrupo(GrupoEntity grupo)
        {
            HttpContext.Current.Session.Add("Grupo", grupo);
        }

        public static void LimpiarGrupo()
        {
            HttpContext.Current.Session.Remove("Grupo");
        }

        public static GrupoEntity Grupo
        {
            get
            {
                return (GrupoEntity)HttpContext.Current.Session["Grupo"];
            }
        }
    }
}
