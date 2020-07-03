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
                lbl_Codigo.Text = ((Label)PreviousPage.FindControl("lbl_Codigo")).Text;

                NegocioPeriferico Neg_Perif = new NegocioPeriferico();

                Periferico Perif = new Periferico();

                Perif = Neg_Perif.ObtenerPeriferico(Convert.ToInt32(lbl_Codigo.Text));

                img_Imagen.ImageUrl = Perif.Imagen_Url;
                lbl_Nombre.Text = Perif.Nombre;
                lbl_Precio.Text = Convert.ToString(Perif.Precio_Unitario);
                lbl_Monto.Text = "";

                Session["PerifSeleccionado"] = Perif;
            }
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            int Cantidad;

            Cantidad = int.Parse(txt_Cantidad.Text);

            if(Cantidad!=0)
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
            if (Session["CarritoPeriferico"] == null)
            {
                Session["CarritoPeriferico"] = CrearTabla();
            }

            if (VerificarPeriferico() == true)
            {
                ModificarCantidad(txt_Cantidad.Text);
            }
            else
            {
                AgregarFila(txt_Cantidad.Text);
            }
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
            DataRow NuevaFila = ((DataTable)Session["CarritoPeriferico"]).NewRow();

            NuevaFila["Codigo"] = ((Periferico)Session["PerifSeleccionado"]).Codigo_Periferico;
            NuevaFila["Imagen"] = ((Periferico)Session["PerifSeleccionado"]).Imagen_Url;
            NuevaFila["Nombre"] = ((Periferico)Session["PerifSeleccionado"]).Nombre;
            NuevaFila["Precio"] = ((Periferico)Session["PerifSeleccionado"]).Precio_Unitario;
            NuevaFila["Cantidad"] = Cantidad;

            ((DataTable)Session["CarritoPeriferico"]).Rows.Add(NuevaFila);
        }

        public void ModificarCantidad(String Cantidad)
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoPeriferico"]).Rows)
            {
                if (fila["Codigo"].ToString() == ((Periferico)Session["PerifSeleccionado"]).Codigo_Periferico.ToString())
                {
                    fila["Cantidad"] = (int.Parse(fila["Cantidad"].ToString()) + int.Parse(Cantidad));
                    return;
                }
            }
        }

        public bool VerificarPeriferico()
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoPeriferico"]).Rows)
            {
                if (fila["Codigo"].ToString() == ((Periferico)Session["PerifSeleccionado"]).Codigo_Periferico.ToString())
                {
                    return true;
                }
            }
            return false;
        }

    }
}