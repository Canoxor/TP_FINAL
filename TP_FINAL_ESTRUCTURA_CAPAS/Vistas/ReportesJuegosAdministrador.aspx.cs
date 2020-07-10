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
    public partial class ReportesJuegosAdministrador : System.Web.UI.Page
    {

        protected DataTable tabla = new DataTable();
        protected NegocioJuego neg_Juego = new NegocioJuego();
        protected Juego juego = new Juego();
        protected NegocioNoticia N_Noticia = new NegocioNoticia();
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarTodosLosDDL();
                setLabelUsuario();
            }
            setLabelUsuario();
        }

        public void cargarGridViewStock(int opc)
        {
            grd_ReporteS.DataSource = neg_Juego.StockOrdenadoJuegos(opc);
            grd_ReporteS.DataBind();
        }

        public void cargarGridViewGeneros(int opc, DateTime fechaInicio, DateTime fechaFin, int codGenero)
        {
            grdReporteGeneros.DataSource = neg_Juego.porcentajeGenerosVendidos(opc, fechaInicio, fechaFin, codGenero);
            grdReporteGeneros.DataBind();
        }

        public void cargarGridViewJuegos(int opc, DateTime fechaInicio, DateTime fechaFin, int codJuego, GridView grd)
        {
            grd.DataSource = neg_Juego.reportePorcentajeJuegosVendidos(opc, fechaInicio, fechaFin, codJuego);
            grd.DataBind();
        }

        public void cargarDDLGeneros()
        {
            tabla = neg_Juego.tablaGenero();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlGeneros.Items.Add(item);
            }

            ddlGeneros.DataTextField = "G_Nombre";
            ddlGeneros.DataValueField = "G_Codigo_Genero";
            ddlGeneros.DataBind();
            ddlGeneros.Items.Insert(0, new ListItem("--Seleccione Genero--", "0"));
            ddlGeneros.SelectedValue = "0";
            
        }

        protected void cargarTodosLosDDL()
        {
            cargarDDLGeneros();
            cargarDDLJuegos(ddlJuegosCantVendidos);
            cargarDDLJuegos(ddlJuegosPorcentajeMonto);
        }

        protected void cargarDDLJuegos(DropDownList ddlJuego)
        {

            tabla = N_Noticia.tablaJuegos();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][3].ToString(), tabla.Rows[i][0].ToString());
                ddlJuego.Items.Add(item);
            }

            ddlJuego.DataTextField = "J_Nombre";
            ddlJuego.DataValueField = "J_Codigo_Juego";
            ddlJuego.DataBind();
            ddlJuego.Items.Insert(0, new ListItem("--Seleccione Juego--", "0"));
            ddlJuego.SelectedValue = "0";
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
                ddlGeneros.Enabled = false;
            }
            else
            {
                ddlGeneros.Enabled = true;
            }

        }

        protected void btn_LimpiarS_Click(object sender, EventArgs e)
        {
            chk_Stock.Checked = false;
            chk_Genero.Checked = false;
            grd_ReporteS.DataSource = null;
            grd_ReporteS.DataBind();
        }

        protected void btn_LimpiarG_Click(object sender, EventArgs e)
        {
            txtFechaFinalGeneros.Text = "";
            txtFechaInicialGeneros.Text = "";
            chk_TodosGeneros.Checked = false;
            ddlGeneros.SelectedIndex = 0;
            lblMensajeAclarativoGrdGeneros.Text = "";
            grdReporteGeneros.DataSource = null;
            grdReporteGeneros.DataBind();
        }

        protected void btn_FiltrarG_Click(object sender, EventArgs e)
        {
            lblMensajeErrorDDLGeneros.Text = "";
            if (!chk_TodosGeneros.Checked)
            {
                if (Convert.ToInt32(ddlGeneros.SelectedValue) == 0)
                {
                    lblMensajeErrorDDLGeneros.Text = "Ingrese un genero";
                }
                else
                {
                    cargarGridViewGeneros(1, Convert.ToDateTime(txtFechaInicialGeneros.Text), Convert.ToDateTime(txtFechaFinalGeneros.Text), Convert.ToInt32(ddlGeneros.SelectedValue));
                    lblMensajeAclarativoGrdGeneros.Text = "El valor de cada columna corresponde al porcentaje sobre 100 de la cantidad de titulos vendidos de cada genero";
                }
                
            }
            else
            {
                cargarGridViewGeneros(2, Convert.ToDateTime(txtFechaInicialGeneros.Text), Convert.ToDateTime(txtFechaFinalGeneros.Text), 1);
                lblMensajeAclarativoGrdGeneros.Text = "El valor de cada columna corresponde al porcentaje sobre 100 de la cantidad de titulos vendidos de cada genero";
            }
        }

        protected void btnFiltrarCantJuegosVendidos_Click(object sender, EventArgs e)
        {
            cargarGridViewJuegos(1, Convert.ToDateTime(txtFechaInicialCantVendidos.Text), Convert.ToDateTime(txtFechaFinalCantVendidos.Text), Convert.ToInt32(ddlJuegosCantVendidos.SelectedValue), grdCantJuegosVendidos);
        }

        protected void btnLimpiarFiltrosCantJuegosVendidos_Click(object sender, EventArgs e)
        {
            txtFechaInicialCantVendidos.Text = "";
            txtFechaFinalCantVendidos.Text = "";
            ddlJuegosCantVendidos.SelectedIndex = 0;
            grdCantJuegosVendidos.DataSource = null;
            grdCantJuegosVendidos.DataBind();
        }

        protected void btnFiltrarPorcentajeMonto_Click(object sender, EventArgs e)
        {
            lblMensajeAclarativoMontoJuego.Text = "";
            lblValidacionDDLJuegos.Text = "";
            if (!cb_JuegosMonto.Checked)
            {
                if (Convert.ToInt32(ddlJuegosPorcentajeMonto.SelectedValue) == 0)
                {
                    lblValidacionDDLJuegos.Text = "Ingrese un Juego";
                }
                else
                {
                    cargarGridViewJuegos(2, Convert.ToDateTime(txtFechaInicialPorcentajeMonto.Text), Convert.ToDateTime(txtFechaFinalPorcentajeMonto.Text), Convert.ToInt32(ddlJuegosPorcentajeMonto.SelectedValue), grdPorcentajeMontoJuego);
                    lblMensajeAclarativoMontoJuego.Text = "El Porcentaje de recaudacion que se muestra en pantalla corresponde a la ganancia obtenida de este juego por sobre el total facturado (Juegos + Perifericos)";
                }

            }
            else
            {
                cargarGridViewJuegos(3, Convert.ToDateTime(txtFechaInicialPorcentajeMonto.Text), Convert.ToDateTime(txtFechaFinalPorcentajeMonto.Text), 1, grdPorcentajeMontoJuego);
                lblMensajeAclarativoMontoJuego.Text = "El Porcentaje de recaudacion que se muestra en pantalla corresponde a la ganancia obtenida de los juegos por sobre el total facturado (Juegos + Perifericos)";
            }
        }

        protected void btnLimpiarFiltrosPorcentajeMonto_Click(object sender, EventArgs e)
        {
            txtFechaInicialPorcentajeMonto.Text = "";
            txtFechaFinalPorcentajeMonto.Text = "";
            lblMensajeAclarativoMontoJuego.Text = "";
            lblValidacionDDLJuegos.Text = "";
            ddlJuegosPorcentajeMonto.SelectedIndex = 0;
            grdPorcentajeMontoJuego.DataSource = null;
            grdPorcentajeMontoJuego.DataBind();
        }

        protected void cb_JuegosMonto_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_JuegosMonto.Checked == true)
            {
                ddlJuegosPorcentajeMonto.Enabled = false;
            }
            else
            {
                ddlJuegosPorcentajeMonto.Enabled = true;
            }
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }

    }
}