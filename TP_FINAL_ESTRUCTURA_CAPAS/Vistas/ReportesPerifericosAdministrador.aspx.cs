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
    public partial class ReportesPerifericosAdministrador : System.Web.UI.Page
    {
        protected NegocioPeriferico nPeriferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();
        protected DataTable tabla = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDDLTipoDePerifericos();
            }
        }

        public void cargarGridViewStock(int opc)
        {
            grd_ReporteS.DataSource = nPeriferico.StockOrdenadoPerifericos(opc);
            grd_ReporteS.DataBind();
        }

        public void cargarGridViewTipoPerifericos(int opc, DateTime fechaInicio, DateTime fechaFin, int codTipPerif)
        {
            grdReporteTipoPerifericos.DataSource = nPeriferico.porcentajeTipoPerifericosVendidos(opc, fechaInicio, fechaFin, codTipPerif);
            grdReporteTipoPerifericos.DataBind();
        }

        public void cargarDDLTipoDePerifericos()
        {
            tabla = nPeriferico.tablaTipoPerifericos();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlTipoDePerifericos.Items.Add(item);
            }

            ddlTipoDePerifericos.DataTextField = "T_Nombre";
            ddlTipoDePerifericos.DataValueField = "T_Codigo_TipoPerif";
            ddlTipoDePerifericos.DataBind();
            ddlTipoDePerifericos.Items.Insert(0, new ListItem("--Seleccione Periferico--", "0"));
            ddlTipoDePerifericos.SelectedValue = "0";

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }
        protected void chk_Stock_CheckedChanged(object sender, EventArgs e)
        {
            chk_TipoDePeriferico.Checked = false;
        }

        protected void chk_Genero_CheckedChanged(object sender, EventArgs e)
        {
            chk_Stock.Checked = false;
        }

        protected void btn_FiltrarS_Click(object sender, EventArgs e)
        {
            if (chk_Stock.Checked == true)
            {
                cargarGridViewStock(1);
            }
            if (chk_TipoDePeriferico.Checked == true)
            {
                cargarGridViewStock(2);
            }
        }
        protected void chk_TodosTiposDeGeneros_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_TodosTiposDeGeneros.Checked == true)
            {
                ddlTipoDePerifericos.Enabled = false;
            }
            else
            {
                ddlTipoDePerifericos.Enabled = true;
            }

        }

        protected void btn_LimpiarS_Click(object sender, EventArgs e)
        {
            chk_Stock.Checked = false;
            chk_TipoDePeriferico.Checked = false;
            grd_ReporteS.DataSource = null;
            grd_ReporteS.DataBind();
        }

        protected void btn_LimpiarG_Click(object sender, EventArgs e)
        {
            txtFechaFinalGeneros.Text = "";
            txtFechaInicialGeneros.Text = "";
            chk_TodosTiposDeGeneros.Checked = false;
            ddlTipoDePerifericos.Enabled = true;
            ddlTipoDePerifericos.SelectedIndex = 0;
            lblMensajeAclarativoGrdGeneros.Text = "";
            grdReporteTipoPerifericos.DataSource = null;
            grdReporteTipoPerifericos.DataBind();
        }

        protected void btn_FiltrarG_Click(object sender, EventArgs e)
        {
            lblMensajeErrorDDLTipoPerifericos.Text = "";
            if (!chk_TodosTiposDeGeneros.Checked)
            {
                if (Convert.ToInt32(ddlTipoDePerifericos.SelectedValue) == 0)
                {
                    lblMensajeErrorDDLTipoPerifericos.Text = "Ingrese un tipo de periferico";
                }
                else
                {
                    cargarGridViewTipoPerifericos(1, Convert.ToDateTime(txtFechaInicialGeneros.Text), Convert.ToDateTime(txtFechaFinalGeneros.Text), Convert.ToInt32(ddlTipoDePerifericos.SelectedValue));
                    lblMensajeAclarativoGrdGeneros.Text = "El valor de cada columna corresponde al porcentaje sobre 100 de la cantidad de perifericos vendidos de cada Tipo de Periferico";
                }

            }
            else
            {
                cargarGridViewTipoPerifericos(2, Convert.ToDateTime(txtFechaInicialGeneros.Text), Convert.ToDateTime(txtFechaFinalGeneros.Text), 1);
                lblMensajeAclarativoGrdGeneros.Text = "El valor de cada columna corresponde al porcentaje sobre 100 de la cantidad de perifericos vendidos de cada Tipo de Periferico";
            }
        }
    }
}