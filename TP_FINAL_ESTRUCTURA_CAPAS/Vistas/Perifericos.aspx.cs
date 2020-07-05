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
    public partial class Perifericos : System.Web.UI.Page
    {
        protected Usuario usuario = new Usuario();
        protected NegocioPeriferico N_Periferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogedIn();
            lblNavbarUsuario.Text = usuario.Nombre;
        }
        protected void btn_Detalle_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            periferico = N_Periferico.ObtenerPeriferico(id_seleccionado);
            Session["PerifericoSeleccionado"] = periferico;
            Response.Redirect("DetallePeriferico.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
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
                    Response.Redirect("PerifericosAdministrador.aspx");
                }
            }

        }

        protected void btnFiltrarMarcas_Click(object sender, EventArgs e)
        {
            SqlDataPerifericos.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1 ORDER BY PE_Codigo_Marca ASC";
        }

        protected void btnFiltrarTipoPeriferico_Click(object sender, EventArgs e)
        {
            SqlDataPerifericos.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1 ORDER BY PE_Codigo_TipoPerif ASC";
        }

        protected void btnBuscarPerifericos_Click(object sender, EventArgs e)
        {
            if (txtBusquedaPerifericos.Text == "")
            {

                SqlDataPerifericos.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1";
            }
            else
            {
                SqlDataPerifericos.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Nombre = '" + txtBusquedaPerifericos.Text + "' AND PE_Estado = 1";
            }
        }
    }
}