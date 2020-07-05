using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class PerifericosAdministrador : System.Web.UI.Page
    {

        protected NegocioPeriferico N_Periferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Detalle_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            periferico = N_Periferico.ObtenerPeriferico(id_seleccionado);
            Session["pModificar"] = periferico;
            Response.Redirect("PerifericosModificar.aspx");
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnFiltrarMarcas_Click(object sender, EventArgs e)
        {
            DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos ORDER BY PE_Codigo_Marca ASC";
        }

        protected void btnFiltrarTipo_Click(object sender, EventArgs e)
        {
            DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos ORDER BY PE_Codigo_TipoPerif ASC";
        }

        protected void btnFiltrarPerifericosActivos_Click(object sender, EventArgs e)
        {
            DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 1";
        }

        protected void btnFiltrarPerifericosInactivos_Click(object sender, EventArgs e)
        {
            DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Estado = 0";
        }

        protected void btnBuscarPerifericos_Click(object sender, EventArgs e)
        {
            if (txtBusquedaPerifericos.Text == "")
            {

                DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos";
            }
            else
            {
                DS_PerifericoAdmin.SelectCommand = "SELECT PE_Imagen, PE_Nombre, PE_PrecioUnitario, PE_Codigo_Periferico FROM Perifericos WHERE PE_Nombre = '" + txtBusquedaPerifericos.Text + "'";
            }
        }

        protected void btnAgregarPeriferico_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerifericosAgregar.aspx");
        }
    }
}