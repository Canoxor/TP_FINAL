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
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTodosLosDDL();
                setLabelUsuario();
            }
            setLabelUsuario();
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
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

        public void cargarGridViewPeriferico(int opc, DateTime fechaInicio, DateTime fechaFin, int codPeriferico, GridView grd)
        {
            grd.DataSource = nPeriferico.reportePorcentajePerifericosVendidos(opc, fechaInicio, fechaFin, codPeriferico);
            grd.DataBind();
        }


        protected void cargarTodosLosDDL()
        {
            cargarDDLTipoDePerifericos();
            cargarDDLPerifericos(ddlPerifericosCantVendidos);
            cargarDDLPerifericos(ddlPerifericosPorcentajeMonto);
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

        //---------------------------------------------------------NEW----------------------------------------------------

        protected void cargarDDLPerifericos(DropDownList ddlPerifericos)
        {

            tabla = nPeriferico.tablaPerifericos();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][3].ToString(), tabla.Rows[i][0].ToString());
                ddlPerifericos.Items.Add(item);
            }

            ddlPerifericos.DataTextField = "PE_Nombre";
            ddlPerifericos.DataValueField = "PE_Codigo_Periferico";
            ddlPerifericos.DataBind();
            ddlPerifericos.Items.Insert(0, new ListItem("--Seleccione Periferico--", "0"));
            ddlPerifericos.SelectedValue = "0";
        }

        protected void btnFiltrarCantJuegosVendidos_Click(object sender, EventArgs e)
        {
            cargarGridViewPeriferico(1, Convert.ToDateTime(txtFechaInicialCantVendidos.Text), Convert.ToDateTime(txtFechaFinalCantVendidos.Text), Convert.ToInt32(ddlPerifericosCantVendidos.SelectedValue), grdCantPerifericosVendidos);
        }

        protected void btnLimpiarFiltrosCantJuegosVendidos_Click(object sender, EventArgs e)
        {
            txtFechaInicialCantVendidos.Text = "";
            txtFechaFinalCantVendidos.Text = "";
            ddlPerifericosCantVendidos.SelectedIndex = 0;
            grdCantPerifericosVendidos.DataSource = null;
            grdCantPerifericosVendidos.DataBind();
        }

        protected void btnFiltrarPorcentajeMonto_Click(object sender, EventArgs e)
        {
            lblMensajeAclarativoMontoPeriferico.Text = "";
            lblMensajeAclarativoMontoPeriferico.Text = "";
            if (!cb_PerifericosMonto.Checked)
            {
                if (Convert.ToInt32(ddlPerifericosPorcentajeMonto.SelectedValue) == 0)
                {
                    lblValidacionDDLPerifericos.Text = "Ingrese un Periferico";
                }
                else
                {
                    cargarGridViewPeriferico(2, Convert.ToDateTime(txtFechaInicialPorcentajeMonto.Text), Convert.ToDateTime(txtFechaFinalPorcentajeMonto.Text), Convert.ToInt32(ddlPerifericosPorcentajeMonto.SelectedValue), grdPorcentajeMontoPeriferico);
                    lblMensajeAclarativoMontoPeriferico.Text = "El Porcentaje de recaudacion que se muestra en pantalla corresponde a la ganancia obtenida de este periferico por sobre el total facturado (Juegos + Perifericos)";
                }

            }
            else
            {
                cargarGridViewPeriferico(3, Convert.ToDateTime(txtFechaInicialPorcentajeMonto.Text), Convert.ToDateTime(txtFechaFinalPorcentajeMonto.Text), 1, grdPorcentajeMontoPeriferico);
                lblMensajeAclarativoMontoPeriferico.Text = "El Porcentaje de recaudacion que se muestra en pantalla corresponde a la ganancia obtenida de los perifericos por sobre el total facturado (Juegos + Perifericos)";
            }
        }

        protected void btnLimpiarFiltrosPorcentajeMonto_Click(object sender, EventArgs e)
        {
            txtFechaInicialPorcentajeMonto.Text = "";
            txtFechaFinalPorcentajeMonto.Text = "";
            lblMensajeAclarativoMontoPeriferico.Text = "";
            lblValidacionDDLPerifericos.Text = "";
            ddlPerifericosPorcentajeMonto.SelectedIndex = 0;
            grdPorcentajeMontoPeriferico.DataSource = null;
            grdPorcentajeMontoPeriferico.DataBind();
        }

        protected void cb_JuegosMonto_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_PerifericosMonto.Checked == true)
            {
                ddlPerifericosPorcentajeMonto.Enabled = false;
            }
            else
            {
                ddlPerifericosPorcentajeMonto.Enabled = true;
            }
        }

    }
}