using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class DetallePeriferico : System.Web.UI.Page
    {
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Codigo = ((Periferico)Session["PerifericoSeleccionado"]).Codigo_Periferico;
                DS_Detalle.SelectCommand = "SELECT[PE_Imagen], [PE_Nombre], [PE_Descripcion], [PE_PrecioUnitario], [PE_Codigo_Periferico] FROM[Perifericos] WHERE [PE_Codigo_Periferico] ='" + Codigo + "'";
            }
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
        }

        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("CompraVerificarPeriferico.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

    }
}