using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ReportesJuegosAdministrador : System.Web.UI.Page
    {
        NegocioJuego neg_Juego = new NegocioJuego();
        Juego juego = new Juego();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }
        }

        public void cargarGridViewStock(int opc)
        {
            grd_ReporteS.DataSource = neg_Juego.StockOrdenadoJuegos(opc);
            grd_ReporteS.DataBind();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }
        protected void chk_Stock_CheckedChanged(object sender, EventArgs e)
        {
            chk_Genero.Checked = false;
        }

        protected void chk_Genero_CheckedChanged(object sender, EventArgs e)
        {
            chk_Stock.Checked = false;
        }

        protected void btn_FiltrarS_Click(object sender, EventArgs e)
        {
            if(chk_Stock.Checked==true)
            {
                cargarGridViewStock(1);
            }
            if(chk_Genero.Checked == true)
            {
                cargarGridViewStock(2);
            }
        }
        protected void chk_TodosGeneros_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_TodosGeneros.Checked == true)
            {
                txt_CodigoJuego.Text = "";
                txt_CodigoJuego.Enabled = false;
            }
            else
            {
                txt_CodigoJuego.Enabled = true;
            }

        }

        protected void btn_LimpiarS_Click(object sender, EventArgs e)
        {
            chk_Stock.Checked = false;
            chk_Genero.Checked = false;
            grd_ReporteS.DataSource = null;
            grd_ReporteS.DataBind();
        }
    }
}