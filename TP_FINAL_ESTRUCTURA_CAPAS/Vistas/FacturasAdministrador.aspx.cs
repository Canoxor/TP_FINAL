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
    public partial class FacturasAdministrador : System.Web.UI.Page
    {
        protected Usuario usuario = new Usuario();
        protected NegocioFactura nf = new NegocioFactura();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["filtroElegido"] = 0;
                cargarGridView((int)Session["filtroElegido"]);
                cargarLabels();
            }
            cargarGridView((int)Session["filtroElegido"]);
            cargarLabels();
        }

        public void cargarGridView(int opc)
        {
            grdFacturas.DataSource = nf.traerFacturaFiltro(opc);
            grdFacturas.DataBind();
        }

        public void cargarGridViewBusqueda(int id)
        {
            grdFacturas.DataSource = nf.traerFacturasUsuario(id);
            grdFacturas.DataBind();
        }


        public void cargarLabels()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnFiltrarFechaReciente_Click(object sender, EventArgs e)
        {
            Session["filtroElegido"] = 1;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void btnFiltrarFechaMenosReciente_Click(object sender, EventArgs e)
        {
            Session["filtroElegido"] = 2;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void btnFiltrarMontoDesc_Click(object sender, EventArgs e)
        {
            Session["filtroElegido"] = 3;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void btnFiltrarMontoAsc_Click(object sender, EventArgs e)
        {
            Session["filtroElegido"] = 4;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void btnFiltrarUsuarios_Click(object sender, EventArgs e)
        {
            Session["filtroElegido"] = 5;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void grdFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFacturas.PageIndex = e.NewPageIndex;
            cargarGridView((int)Session["filtroElegido"]);
        }

        protected void btnBuscarFactura_Click(object sender, EventArgs e)
        {
            if(txtBusquedaFactura.Text == "")
            {
                cargarGridView((int)Session["filtroElegido"]);
            }
            else
            {
                cargarGridViewBusqueda(Convert.ToInt32(txtBusquedaFactura.Text));
            }
        }
    }
}