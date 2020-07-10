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
    public partial class ReportesUsuariosAdministrador : System.Web.UI.Page
    {
            NegocioUsuario neg_Usuario = new NegocioUsuario();
            Usuario usuario = new Usuario();
            /*
             * SP_ComprasRealizadas_Usuario - 1
             * 
             * SP_ComprasPorUsuario_Ord_FechaASC - 21
             * 
             * SP_ComprasPorUsuario_Ord_FechaDESC - 22
             * 
             * SP_UsuariosCreados_FechaASC - 31
             * 
             * SP_UsuariosCreados_FechaDESC - 32
             */

            protected void Page_Load(object sender, EventArgs e)
            {

            }

            protected void btnCerrarSesion_Click(object sender, EventArgs e)
            {
                Session["usuarioLogedIn"] = null;
                Response.Redirect("LandingPage.aspx");
            }

            protected void btn_Filtrar_1_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_1.DataSource = null;
                int Opcion = 1;

                CargarGridView_1(Opcion);
            }

            protected void btn_Filtrar_2_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_2.DataSource = null;
                int Opcion;

                if (int.Parse(txtOrden_2.Text) == 1)
                {
                    Opcion = 21;
                    CargarGridView_2(Opcion);
                }
                else if (int.Parse(txtOrden_2.Text) == 2)
                {
                    Opcion = 22;
                    CargarGridView_2(Opcion);
                }
                else
                {
                    lblMensajeAclarativoGrd_2.Text = "El orden es incorrecto.";
                }
            }

            protected void btn_Filtrar_3_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_3.DataSource = null;
                int Opcion;

                if (int.Parse(txtOrden_3.Text) == 1)
                {
                    Opcion = 31;
                    CargarGridView_3(Opcion);
                }
                else if (int.Parse(txtOrden_3.Text) == 2)
                {
                    Opcion = 32;
                    CargarGridView_3(Opcion);
                }
                else
                {
                    lblMensajeAclarativoGrd_3.Text = "El orden es incorrecto.";
                }
            }

            public void CargarGridView_1(int Opcion)
            {
                int Codigo;
                DateTime FechaInicio, FechaFin;

                Codigo = int.Parse(txtCodigoUsuario_1.Text);
                FechaInicio = Convert.ToDateTime(txtFechaInicial_1.Text);
                FechaFin = Convert.ToDateTime(txtFechaFinal_1.Text);
                grdReporteUsuarios_1.DataSource = neg_Usuario.Procedimientos(Opcion, Codigo, FechaInicio, FechaFin);
                grdReporteUsuarios_1.DataBind();
            }
            public void CargarGridView_2(int Opcion)
            {
                int Codigo;
                DateTime FechaInicio, FechaFin;

                Codigo = 0;
                FechaInicio = Convert.ToDateTime(txtFechaInicial_2.Text);
                FechaFin = Convert.ToDateTime(txtFechaFinal_2.Text);
                grdReporteUsuarios_2.DataSource = neg_Usuario.Procedimientos(Opcion, Codigo, FechaInicio, FechaFin);
            grdReporteUsuarios_2.DataBind();
            }
            public void CargarGridView_3(int Opcion)
            {
                int Codigo;
                DateTime FechaInicio, FechaFin;

                Codigo = 0;
                FechaInicio = Convert.ToDateTime(txtFechaInicial_3.Text);
                FechaFin = Convert.ToDateTime(txtFechaFinal_3.Text);
                grdReporteUsuarios_3.DataSource = neg_Usuario.Procedimientos(Opcion, Codigo, FechaInicio, FechaFin);
            grdReporteUsuarios_3.DataBind();
            }

            protected void btn_Limpiar_1_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_1.DataSource = null;
                grdReporteUsuarios_1.DataBind();
            }
            protected void btn_Limpiar_2_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_2.DataSource = null;
                grdReporteUsuarios_1.DataBind();
            }
            protected void btn_Limpiar_3_Click(object sender, EventArgs e)
            {
                grdReporteUsuarios_3.DataSource = null;
                grdReporteUsuarios_1.DataBind();
            }

            protected void btn_Menu_Click(object sender, EventArgs e)
            {
                Response.Redirect("ReportesAdministrador.aspx");
            }
        protected void GridView_2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReporteUsuarios_2.PageIndex = e.NewPageIndex;
            int Opcion;

            if (int.Parse(txtOrden_2.Text) == 1)
            {
                Opcion = 21;
                CargarGridView_2(Opcion);
            }
            else if (int.Parse(txtOrden_2.Text) == 2)
            {
                Opcion = 22;
                CargarGridView_2(Opcion);
            }
        }
        protected void GridView_3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReporteUsuarios_3.PageIndex = e.NewPageIndex;
            int Opcion;

            if (int.Parse(txtOrden_3.Text) == 1)
            {
                Opcion = 31;
                CargarGridView_3(Opcion);
            }
            else if (int.Parse(txtOrden_3.Text) == 2)
            {
                Opcion = 32;
                CargarGridView_3(Opcion);
            }
        }
       

        }
}