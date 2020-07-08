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
        protected Usuario usuario = new Usuario();
        protected NegocioFactura N_Factura = new NegocioFactura();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
                setLabelUsuario();
            }
            cargarGridView();
            setLabelUsuario();
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public void cargarGridView()
        {
            grd_Historial.DataSource = N_Factura.traerFacturasUsuario(usuario.Codigo_Usuario);
            grd_Historial.DataBind();
        }

        protected void grd_Historial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "eventoDetalle")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                cargarGridView();
                int Codigo = Convert.ToInt32(((Label)grd_Historial.Rows[fila].FindControl("lbl_Codigo")).Text);                
                Session["FacturaSeleccionada"] = Codigo;
                Response.Redirect("DetalleFactura.aspx");
            }
                
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void grd_Historial_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_Historial.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

    }
}