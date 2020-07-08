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
    public partial class Noticias : System.Web.UI.Page
    {
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();

        protected NegocioJuego Negocio_J = new NegocioJuego();
        protected Juego juego = new Juego();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogedIn();
            lblNavbarUsuario.Text = usuario.Nombre;
        }
        protected void btn_VerMas_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());

            juego = Negocio_J.ObtenerJuego(id_seleccionado);

            Session["JuegoSeleccionado"] = juego;

            Response.Redirect("DetalleJuego.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnFiltrarPorJuegos_Click(object sender, EventArgs e)
        {
            SqlDataNoticias.SelectCommand = "SELECT N_Nombre, N_Imagen, N_Descripcion, N_Codigo_Juego FROM Noticias WHERE N_Estado = 1 ORDER BY N_Codigo_Juego ASC";
        }


        private void usuarioLogedIn()
        {
            if (Session["usuarioLogedIn"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                usuario = (Usuario)Session["usuarioLogedIn"];
                if (usuario.Admin)
                {
                    Response.Redirect("NoticiasAdministrador.aspx");
                }
            }

        }
    }
}