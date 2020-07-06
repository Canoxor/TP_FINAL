using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Carrito : System.Web.UI.Page
    {
        NegocioJuego Negocio_J = new NegocioJuego();
        NegocioPeriferico Negocio_P = new NegocioPeriferico();
        Juego juego = new Juego();
        Periferico periferico = new Periferico();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_Comprar.Visible = false;
                btn_CompraAceptar.Visible = false;
                btn_CompraCancelar.Visible = false;
                float MontoTotal = 0;

                if (Session["CarritoJuegos"] != null)
                {
                    CargarGrid_Juegos();
                    btn_Comprar.Visible = true;
                    MontoTotal += CalcularMontoTotal_Juego();
                }
                if (Session["CarritoPerifericos"] != null)
                {
                    CargarGrid_Perifericos();
                    btn_Comprar.Visible = true;
                    MontoTotal += CalcularMontoTotal_Periferico();
                }
                if (MontoTotal != 0)
                {
                    lbl_Total.Text = "<strong>Monto total:</strong> $ " + MontoTotal.ToString();
                }
                else
                {
                    lbl_Total.Text = "<strong>No se ha agregado ningun producto al carrito</strong>";
                }
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public void CargarGrid_Juegos()
        {
            grd_Carrito_Juego.DataSource = (DataTable)Session["CarritoJuegos"];
            grd_Carrito_Juego.DataBind();
        }

        public void CargarGrid_Perifericos()
        {
            grd_Carrito_Periferico.DataSource = (DataTable)Session["CarritoPerifericos"];
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

                juego = Negocio_J.ObtenerJuego(int.Parse(Codigo));

                Session["JuegoSeleccionado"] = juego;

                Response.Redirect("DetalleJuego.aspx");
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
                int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);

                String Codigo = grd_Carrito_Periferico.Rows[FilaSeleccionada].Cells[0].Text;

                periferico = Negocio_P.ObtenerPeriferico(int.Parse(Codigo));

                Session["PerifericoSeleccionado"] = periferico;

                Response.Redirect("DetallePeriferico.aspx");
            }
            else
            {
                if (e.CommandName == "Borrar_Periferico_Event")
                {
                    int FilaSeleccionada = Convert.ToInt32(e.CommandArgument);

                    String Codigo = grd_Carrito_Periferico.Rows[FilaSeleccionada].Cells[0].Text;

                    DataRow[] Fila;
                    Fila = ((DataTable)Session["CarritoPerifericos"]).Select("Codigo='" + Codigo + "'");

                    foreach (DataRow row in Fila)
                        ((DataTable)Session["CarritoPerifericos"]).Rows.Remove(row);

                    CargarGrid_Perifericos();
                }
            }
        }
        public float CalcularMontoTotal_Juego()
        {
            float Precio, PrecioTotal = 0;
            int Cantidad;

            for (int i = 0; i < ((DataTable)Session["CarritoJuegos"]).Rows.Count; i++)
            {
                Precio = float.Parse(((DataTable)Session["CarritoJuegos"]).Rows[i]["Precio"].ToString());
                Cantidad = int.Parse(((DataTable)Session["CarritoJuegos"]).Rows[i]["Cantidad"].ToString());
                PrecioTotal += Precio * Cantidad;
            }

            return PrecioTotal;
        }
        public float CalcularMontoTotal_Periferico()
        {
            float Precio, PrecioTotal = 0;
            int Cantidad;

            for (int i = 0; i < ((DataTable)Session["CarritoPerifericos"]).Rows.Count; i++)
            {
                Precio = float.Parse(((DataTable)Session["CarritoPerifericos"]).Rows[i]["Precio"].ToString());
                Cantidad = int.Parse(((DataTable)Session["CarritoPerifericos"]).Rows[i]["Cantidad"].ToString());
                PrecioTotal += Precio * Cantidad;
            }

            return PrecioTotal;
        }

        protected void btn_Comprar_Click(object sender, EventArgs e)
        {
            btn_CompraAceptar.Visible = true;
            btn_CompraCancelar.Visible = true;
            btn_Comprar.Visible = false;
        }

        protected void btn_CompraCancelar_Click(object sender, EventArgs e)
        {
            btn_CompraAceptar.Visible = false;
            btn_CompraCancelar.Visible = false;
            btn_Comprar.Visible = true;
        }

        protected void btn_CompraAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Factura.aspx");
     
        }
    }
}