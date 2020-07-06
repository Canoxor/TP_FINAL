using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class HistorialFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void grd_Historial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
                int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);

                String Codigo = ((Label)grd_Historial.Rows[FilaSeleccionada].FindControl("lbl_Codigo")).Text;

                Session["FacturaSeleccionada"] = Codigo;

                Response.Redirect("DetalleFactura.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }
    }
}