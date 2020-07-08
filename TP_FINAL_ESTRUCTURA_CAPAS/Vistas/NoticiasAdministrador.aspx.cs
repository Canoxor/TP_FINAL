using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class NoticiasAdministrador : System.Web.UI.Page
    {
        protected NegocioNoticia N_Noticia = new NegocioNoticia();
        protected Noticia noticia = new Noticia();
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            setLabelUsuario();
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }
        protected void btn_Modificar_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            noticia = N_Noticia.ObtenerNoticia(id_seleccionado);
            Session["nModificar"] = noticia;
            Response.Redirect("NoticiaModificar.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnFiltrarPorJuegos_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 1 ORDER BY N_Codigo_Juego ASC";
        }


        protected void btnFiltrarActivas_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 1";
        }

        protected void btnFiltrarInactivas_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 0";
        }

        protected void btnAgregarNoticia_Click(object sender, EventArgs e)
        {
            Response.Redirect("NoticiasAgregar.aspx");
        }
    }
}