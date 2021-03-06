﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class JuegosAdministrador : System.Web.UI.Page
    {
        protected Usuario usuario = new Usuario();
        protected Juego juego = new Juego();
        protected NegocioJuego N_Juego = new NegocioJuego();
        protected void Page_Load(object sender, EventArgs e)
        {
            setLabelUsuario();
        }

        protected void btn_Modificar_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            juego = N_Juego.ObtenerJuego(id_seleccionado);
            Session["jModificar"] = juego;
            Response.Redirect("JuegosModificar.aspx");
        }
        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text == "")
            {

                SqlDataSource1.SelectCommand = "Select * from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero";
            }
            else
            {
                SqlDataSource1.SelectCommand = "Select* from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero WHERE J_Nombre = '" + txtBuscar.Text + "'";
            }
        }

        protected void btnFiltroCategoria_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select* from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero ORDER BY J_Codigo_Genero ASC";
        }

        protected void btnFiltroDesarrollador_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select* from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero inner join Prov_X_Juego ON J_Codigo_Juego = PJ_Codigo_Juego ORDER BY PJ_Codigo_Proveedor ASC";
        }

        protected void btnFiltroPegi_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select* from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero ORDER BY J_Codigo_PEGI ASC";
        }

        protected void btnFiltroJuegosActivos_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero WHERE J_Estado = 1";
        }

        protected void btnFiltroJuegosInactivos_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from Juegos inner join PEGI on J_Codigo_PEGI = PG_Codigo_PEGI inner join Generos on J_Codigo_Genero = G_Codigo_Genero WHERE J_Estado = 0";
        }

        protected void btnAgregarJuego_Click(object sender, EventArgs e)
        {
            Response.Redirect("JuegosAgregar.aspx");
        }
    }
}