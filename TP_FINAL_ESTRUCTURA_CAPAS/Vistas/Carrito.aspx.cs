using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["CarritoJuegos"] !=null)
                {
                    CargarGrid_Juegos();
                }

                if (Session["CarritoPeriferico"] != null)
                {
                    CargarGrid_Perifericos();
                }
            }
        }

        public void CargarGrid_Juegos()
        {
            grd_Carrito_Juego.DataSource = (DataTable)Session["CarritoJuegos"];
            grd_Carrito_Juego.DataBind();
        }

        public void CargarGrid_Perifericos()
        {
            grd_Carrito_Periferico.DataSource = (DataTable)Session["CarritoPeriferico"];
            grd_Carrito_Periferico.DataBind();
        }

        protected void grd_Carrito_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Visible = false;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Visible = false;
            }
        }

        protected void grd_Carrito_Juego_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if(e.CommandName == "Ver_Juego_Event")
            {
                // Se quiere ir al juego
                int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);

                String Codigo = grd_Carrito_Juego.Rows[FilaSeleccionada].Cells[0].Text;

                lbl_Codigo.Text = Codigo;

                Server.Transfer("DetalleJuego.aspx");
            }
            else
            {
                if(e.CommandName == "Borrar_Juego_Event")
                {
                    int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);
                    
                    String Codigo = grd_Carrito_Juego.Rows[FilaSeleccionada].Cells[0].Text;

                    DataRow[] Fila;
                    Fila = ((DataTable)Session["CarritoJuegos"]).Select("Codigo='" + Codigo + "'");

                    foreach (DataRow row in Fila)
                        ((DataTable)Session["CarritoJuegos"]).Rows.Remove(row);

                    CargarGrid_Juegos();
                }
            }
        }

        protected void grd_Carrito_Periferico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ver_Periferico_Event")
            {
                // Se quiere ir al perif
                int Fila = Convert.ToInt32(e.CommandArgument);

                String Codigo = grd_Carrito_Periferico.Rows[Fila].Cells[0].Text;

                lbl_Codigo.Text = Codigo;

                Server.Transfer("DetallePeriferico.aspx");
            }
            else
            {
                if (e.CommandName == "Borrar_Periferico_Event")
                {
                    int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);

                    String Codigo = grd_Carrito_Periferico.Rows[FilaSeleccionada].Cells[0].Text;

                    DataRow[] Fila;
                    Fila = ((DataTable)Session["CarritoPeriferico"]).Select("Codigo='" + Codigo + "'");

                    foreach (DataRow row in Fila)
                        ((DataTable)Session["CarritoPeriferico"]).Rows.Remove(row);

                    CargarGrid_Perifericos();
                }
            }
        }
    }
}