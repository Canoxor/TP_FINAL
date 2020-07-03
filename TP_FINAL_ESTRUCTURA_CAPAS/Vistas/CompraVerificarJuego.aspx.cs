﻿using Entidades;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_Codigo.Text = ((Label)PreviousPage.FindControl("lbl_Mensaje")).Text;

                NegocioJuego Neg_Juego = new NegocioJuego();

                Juego Game = new Juego();

                Game = Neg_Juego.ObtenerJuego(Convert.ToInt32(lbl_Codigo.Text));

                img_Imagen.ImageUrl = Game.Imagen_Url;
                lbl_Nombre.Text = Game.Nombre;
                lbl_Precio.Text = Convert.ToString(Game.Precio_Unitario);
                lbl_Monto.Text = "";

                Session["JuegoSeleccionado"] = Game;
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

            AgregarFila(txt_Cantidad.Text);
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

            NuevaFila["Codigo"] = ((Juego)Session["JuegoSeleccionado"]).Codigo_Juego;
            NuevaFila["Imagen"] = ((Juego)Session["JuegoSeleccionado"]).Imagen_Url;
            NuevaFila["Nombre"] = ((Juego)Session["JuegoSeleccionado"]).Nombre;
            NuevaFila["Precio"] = ((Juego)Session["JuegoSeleccionado"]).Precio_Unitario;
            NuevaFila["Cantidad"] = Cantidad;

            ((DataTable)Session["CarritoJuegos"]).Rows.Add(NuevaFila);
        }
    }
}