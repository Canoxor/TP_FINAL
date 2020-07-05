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
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Factura"] == null)
                {
                    Session["Factura"] = CrearTabla();
                }
                if (Session["CarritoJuegos"] != null)
                {
                    ((DataTable)Session["Factura"]).Merge(((DataTable)Session["CarritoJuegos"]));
                }
                if (Session["CarritoPerifericos"] != null)
                {
                    ((DataTable)Session["Factura"]).Merge(((DataTable)Session["CarritoPerifericos"]));
                }
                CargarGrid();

                lbl_Nombre.Text = ((Usuario)Session["usuarioLogedIn"]).Nombre;
                lbl_DNI.Text = ((Usuario)Session["usuarioLogedIn"]).Dni.ToString();
                lbl_NumeroFac.Text = "Ultima Factura";

                CalcularMontoTotal();
            }
        }

        public void CalcularMontoTotal()
        {
            float Precio, PrecioTotal=0;
            int Cantidad;

            for (int i = 0; i < ((DataTable)Session["Factura"]).Rows.Count; i++)
            {
                Precio = float.Parse(((DataTable)Session["Factura"]).Rows[i]["Precio"].ToString());
                Cantidad = int.Parse(((DataTable)Session["Factura"]).Rows[i]["Cantidad"].ToString());
                PrecioTotal += Precio * Cantidad;
            }

            lbl_MontoTotal.Text = PrecioTotal.ToString();
        }

        public void CargarGrid()
        {
            grd_Factura.DataSource = (DataTable)Session["Factura"];
            grd_Factura.DataBind();
        }

        protected void grd_Factura_RowDataBound(object sender, GridViewRowEventArgs e)
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
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public DataTable CrearTabla()
        {
            DataTable Tabla = new DataTable();
            DataColumn Columna_Codigo = new DataColumn("Codigo", System.Type.GetType("System.String"));
            DataColumn Columna_ImagenURL = new DataColumn("Imagen", System.Type.GetType("System.String"));
            DataColumn Columna_Nombre = new DataColumn("Nombre", System.Type.GetType("System.String"));
            DataColumn Columna_Precio = new DataColumn("Precio", System.Type.GetType("System.String"));
            DataColumn Columna_Cantidad = new DataColumn("Cantidad", System.Type.GetType("System.String"));

            Tabla.Columns.Add(Columna_Codigo);
            Tabla.Columns.Add(Columna_ImagenURL);
            Tabla.Columns.Add(Columna_Nombre);
            Tabla.Columns.Add(Columna_Precio);
            Tabla.Columns.Add(Columna_Cantidad);

            return Tabla;
        }
    }
}