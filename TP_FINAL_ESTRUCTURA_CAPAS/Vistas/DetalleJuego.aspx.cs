using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class DetalleJuego : System.Web.UI.Page
    {
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Codigo = ((Juego)Session["JuegoSeleccionado"]).Codigo_Juego;
                DS_Detalle.SelectCommand = "SELECT[J_Imagen], [J_Nombre], [J_Descripcion], [J_PrecioUnitario], [J_Codigo_Juego] FROM[Juegos] WHERE [J_Codigo_Juego] ='" + Codigo + "'";
            }
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
        }

        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("CompraVerificarJuego.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }
    }
}