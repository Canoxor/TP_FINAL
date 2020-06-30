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

            AgregarFila((DataTable)Session["CarritoPeriferico"], lbl_Codigo.Text, txt_Cantidad.Text);
        }

        public DataTable CrearTabla()
        {
            DataTable Tabla = new DataTable();
            DataColumn Columna_Codigo = new DataColumn("CodigoPeriferico", System.Type.GetType("System.String"));
            DataColumn Columna_Cantidad = new DataColumn("CantidadPeriferico", System.Type.GetType("System.String"));

            Tabla.Columns.Add(Columna_Codigo);
            Tabla.Columns.Add(Columna_Cantidad);

            return Tabla;
        }

        public void AgregarFila(DataTable Tabla, String Codigo, String Cantidad)
        {
            DataRow NuevaFila = Tabla.NewRow();

            NuevaFila["CodigoJuego"] = Codigo;
            NuevaFila["CantidadJuego"] = Cantidad;

            Tabla.Rows.Add(NuevaFila);
        }

    }
}