using Negocio;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class DetalleFactura : System.Web.UI.Page
    {

        protected NegocioFactura NegocioFactura = new NegocioFactura();
        protected Usuario usuario = new Usuario();
        protected int codFactura = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
                setLabels();
            }
            cargarGridView();
            setLabels();
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public void setLabels()
        {
            codFactura = Convert.ToInt32(Session["FacturaSeleccionada"].ToString());
            lbl_NroFac.Text = codFactura.ToString();
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
        }

        public void cargarGridView()
        {
            grd_DetalleJuegos.DataSource = NegocioFactura.traerDetalleFacturaJuegosUsuario(codFactura);
            grd_DetalleJuegos.DataBind();
            grd_DetallePerifericos.DataSource = NegocioFactura.traerDetalleFacturaPerifericosUsuario(codFactura);
            grd_DetallePerifericos.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("HistorialFacturas.aspx");
        }

        protected void grd_DetalleJuegos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_DetalleJuegos.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void grd_DetallePerifericos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_DetallePerifericos.PageIndex = e.NewPageIndex;
            cargarGridView();
        }
    }
}