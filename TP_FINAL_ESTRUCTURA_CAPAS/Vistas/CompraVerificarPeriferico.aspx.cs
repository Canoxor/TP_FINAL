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
    public partial class CompraVerificarPeriferico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                img_Imagen.ImageUrl = ((Periferico)Session["PerifericoSeleccionado"]).Imagen_Url;
                lbl_Nombre.Text = ((Periferico)Session["PerifericoSeleccionado"]).Nombre;
                lbl_Precio.Text = Convert.ToString(((Periferico)Session["PerifericoSeleccionado"]).Precio_Unitario);
                lbl_Monto.Text = "";
            }
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            int Cantidad;

            Cantidad = int.Parse(txt_Cantidad.Text);

            if (Cantidad != 0)
            {
                float Monto;

                Monto = Cantidad * (float.Parse(lbl_Precio.Text));

                lbl_Monto.Text = "$ " + Monto.ToString();
            }
            else
            {
                lbl_Monto.Text = "";
            }
        }

        protected void btn_Confirmar_Click(object sender, EventArgs e)
        {
            if (Session["CarritoPerifericos"] == null)
            {
                Session["CarritoPerifericos"] = CrearTabla();
            }

            if (VerificarJuego() == true)
            {
                ModificarCantidad(txt_Cantidad.Text);
            }
            else
            {
                AgregarFila(txt_Cantidad.Text);
            }
            Session["CantidadComprada"] = txt_Cantidad.Text;
            Response.Redirect("CompraMensajePeriferico.aspx");
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

        public void AgregarFila(String Cantidad)
        {
            DataRow NuevaFila = ((DataTable)Session["CarritoPerifericos"]).NewRow();

            NuevaFila["Codigo"] = ((Periferico)Session["PerifericoSeleccionado"]).Codigo_Periferico;
            NuevaFila["Imagen"] = ((Periferico)Session["PerifericoSeleccionado"]).Imagen_Url;
            NuevaFila["Nombre"] = ((Periferico)Session["PerifericoSeleccionado"]).Nombre;
            NuevaFila["Precio"] = ((Periferico)Session["PerifericoSeleccionado"]).Precio_Unitario;
            NuevaFila["Cantidad"] = Cantidad;

            ((DataTable)Session["CarritoPerifericos"]).Rows.Add(NuevaFila);
        }

        public void ModificarCantidad(String Cantidad)
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoPerifericos"]).Rows)
            {
                if (fila["Codigo"].ToString() == ((Periferico)Session["PerifericoSeleccionado"]).Codigo_Periferico.ToString())
                {
                    fila["Cantidad"] = (int.Parse(fila["Cantidad"].ToString()) + int.Parse(Cantidad));

                    return;
                }
            }
        }

        public bool VerificarJuego()
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoPerifericos"]).Rows)
            {
                if (fila["Codigo"].ToString() == ((Periferico)Session["PerifericoSeleccionado"]).Codigo_Periferico.ToString())
                {
                    return true;
                }
            }
            return false;
        }
    }
}