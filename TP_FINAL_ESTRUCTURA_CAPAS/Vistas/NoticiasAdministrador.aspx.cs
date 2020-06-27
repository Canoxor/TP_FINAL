using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class NoticiasAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Modificar_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            Session["CodNoticia"] = id_seleccionado;
            lbl_Codigo.Text = Session["CodNoticia"].ToString();
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

        protected void btnFiltrarFecha_Click(object sender, EventArgs e)
        {
            // SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 1 ORDER BY N_Codigo_Juego ASC";
        }

        protected void btnFiltrarActivas_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 1";
        }

        protected void btnFiltrarInactivas_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Noticia FROM Noticias WHERE N_Estado = 0";
        }
    }
}