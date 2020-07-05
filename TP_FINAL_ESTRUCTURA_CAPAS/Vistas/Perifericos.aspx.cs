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
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();

        protected NegocioPeriferico Negocio_P = new NegocioPeriferico();
        protected Periferico Entidad_P = new Periferico();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogedIn();
            lblNavbarUsuario.Text = usuario.Nombre;


        }
        protected void btnInfo_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            Entidad_P = Negocio_P.ObtenerPeriferico(id_seleccionado);
            Session["PerifericoSeleccionado"] = Entidad_P;
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
            Sql_DataSource.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1 ORDER BY PE_Codigo_Marca ASC";
        }

        protected void btnFiltrarTipoPeriferico_Click(object sender, EventArgs e)
        {
            Sql_DataSource.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1 ORDER BY PE_Codigo_TipoPerif ASC";
        }

        protected void btnBuscarPerifericos_Click(object sender, EventArgs e)
        {
            if (txtBusquedaPerifericos.Text == "")
            {

                Sql_DataSource.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1";
            }
            else
            {
                Sql_DataSource.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Nombre = '" + txtBusquedaPerifericos.Text + "' AND PE_Estado = 1";
            }
        }
    }
}