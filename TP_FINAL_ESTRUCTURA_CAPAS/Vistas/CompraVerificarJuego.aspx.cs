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
    public partial class CompraVerificarJuego : System.Web.UI.Page
    {
        protected NegocioJuego Neg_Juego = new NegocioJuego();
        protected Juego juego = new Juego();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                juego = (Juego)Session["JuegoSeleccionado"];
                img_Imagen.ImageUrl = juego.Imagen_Url;
                lbl_Nombre.Text = juego.Nombre;
                lbl_Precio.Text = Convert.ToString(juego.Precio_Unitario);
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
            if (Session["CarritoJuegos"] == null)
            {
                Session["CarritoJuegos"] = CrearTabla();
            }

            if(VerificarJuego()==true)
            {
                ModificarCantidad(txt_Cantidad.Text);
            }
            else
            {
                AgregarFila(txt_Cantidad.Text);
            }
            Session["CantidadComprada"] = txt_Cantidad.Text;
            Response.Redirect("CompraMensajeJuego.aspx");
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
            DataRow NuevaFila = ((DataTable)Session["CarritoJuegos"]).NewRow();

            NuevaFila["Codigo"] = juego.Codigo_Juego;
            NuevaFila["Imagen"] = juego.Imagen_Url;
            NuevaFila["Nombre"] = juego.Nombre;
            NuevaFila["Precio"] = juego.Precio_Unitario;
            NuevaFila["Cantidad"] = Cantidad;

            ((DataTable)Session["CarritoJuegos"]).Rows.Add(NuevaFila);
        }

        public void ModificarCantidad(String Cantidad)
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoJuegos"]).Rows)
            {
                if (fila["Codigo"].ToString() == juego.Codigo_Juego.ToString())
                {
                    fila["Cantidad"] = (int.Parse(fila["Cantidad"].ToString()) + int.Parse(Cantidad));

                    return;
                }
            }
        }

        public bool VerificarJuego()
        {
            foreach (DataRow fila in ((DataTable)Session["CarritoJuegos"]).Rows)
            {
                if(fila["Codigo"].ToString() == juego.Codigo_Juego.ToString())
                {
                    return true;
                }
            }
            return false;
        }
    }
}