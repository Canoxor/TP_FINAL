﻿using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ReportesPerifericosAdministrador : System.Web.UI.Page
    {
        NegocioJuego neg_Juego = new NegocioJuego();
        Juego juego = new Juego();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // STOCK
                grd_ReporteS.Visible = false;
                // VENTAS
                grd_ReporteV.Visible = false;
            }
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
            }
        }

        protected void chk_TotosTipos_CheckedChanged(object sender, EventArgs e)
        {
            if(chk_TotosTipos.Checked == true)
            {
                txt_CodigoPerif.Text = "";
                txt_CodigoPerif.Enabled = false;
            }
            else
            {
                txt_CodigoPerif.Enabled = true;
            } 
        }
    }
}