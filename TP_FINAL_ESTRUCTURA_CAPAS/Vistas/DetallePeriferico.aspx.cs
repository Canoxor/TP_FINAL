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
        protected Periferico periferico = new Periferico();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                periferico = (Periferico)Session["PerifericoSeleccionado"];
                inflarVista();
            }

            periferico = (Periferico)Session["PerifericoSeleccionado"];
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
            inflarVista();
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public void inflarVista()
        {
            DS_DetallePeriferico.SelectCommand = "SELECT [PE_Imagen], [PE_Nombre], [PE_Descripcion], [PE_PrecioUnitario] FROM [Perifericos] WHERE PE_Codigo_Periferico = '" + periferico.Codigo_Periferico + "'";
        }

    }
}