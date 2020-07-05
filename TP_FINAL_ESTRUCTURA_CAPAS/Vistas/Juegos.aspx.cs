﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Juegos : System.Web.UI.Page
    {
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();

        protected NegocioJuego Negocio_J = new NegocioJuego();
        protected Juego Entidad_J = new Juego();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogedIn();
            lblNavbarUsuario.Text = usuario.Nombre;


        }
        protected void btnInfo_Command(object sender, CommandEventArgs e)
        {
            int id_seleccionado = Int32.Parse(e.CommandArgument.ToString());
            Entidad_J = Negocio_J.ObtenerJuego(id_seleccionado);
            Session["JuegoSeleccionado"] = Entidad_J;
            Response.Redirect("DetalleJuego.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        private void usuarioLogedIn()
        {
            if (Session["usuarioLogedIn"] == null)
            {
                Response.Redirect("LogIn.aspx");
            } 
            else
            {
                usuario = (Usuario)Session["usuarioLogedIn"];
                if (usuario.Admin)
                {
                    Response.Redirect("JuegosAdministrador.aspx");
                }
            }
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text == "")
            {

                Sql_DataSource.SelectCommand = "SELECT J_Imagen, J_Nombre, J_PrecioUnitario, J_Codigo_Juego FROM Juegos WHERE J_Estado = 1";
            }
            else
            {
                Sql_DataSource.SelectCommand = "SELECT J_Imagen, J_Nombre, J_PrecioUnitario, J_Codigo_Juego FROM Juegos WHERE J_Nombre = '" + txtBuscar.Text + "' AND J_Estado = 1";
            }
        }
        protected void btnFiltroCategoria_Click(object sender, EventArgs e)
        {
            Sql_DataSource.SelectCommand = "SELECT J_Imagen, J_Nombre, J_PrecioUnitario, J_Codigo_Juego FROM Juegos WHERE J_Estado = 1 ORDER BY J_Codigo_Genero ASC";
        }
        protected void btnFiltroDesarrollador_Click(object sender, EventArgs e)
        {
            Sql_DataSource.SelectCommand = "SELECT J_Imagen, J_Nombre, J_PrecioUnitario, J_Codigo_Juego FROM Juegos inner join Prov_X_Juego ON J_Codigo_Juego = PJ_Codigo_Juego WHERE J_Estado = 1 ORDER BY PJ_Codigo_Proveedor ASC";
        }
        protected void btnFiltroPegi_Click(object sender, EventArgs e)
        {
            Sql_DataSource.SelectCommand = "SELECT J_Imagen, J_Nombre, J_PrecioUnitario, J_Codigo_Juego FROM Juegos WHERE J_Estado = 1 ORDER BY J_Codigo_PEGI ASC";
        }
            
    }
}