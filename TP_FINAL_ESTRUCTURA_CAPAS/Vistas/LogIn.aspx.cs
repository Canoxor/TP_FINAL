using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class LogIn : System.Web.UI.Page
    {

        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogedIn();
        }
        protected void btnCrearCuenta_LogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearNuevaCuenta.aspx");
        }

        protected void btnInicio_LogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            if (N_Usuario.ExisteUsuario(txtEmail_LogIn.Text, txtContraseña_LogIn.Text))
            {
                usuario = N_Usuario.ObtenerUsuarioLogin(txtEmail_LogIn.Text, txtContraseña_LogIn.Text);
                Session["usuarioLogedIn"] = usuario;
                if(usuario.Admin == true)
                {
                    Response.Redirect("LandingPageAdministrador.aspx");
                } else
                {
                    Response.Redirect("Juegos.aspx");
                }
            }
        }

        private void usuarioLogedIn()
        {
            if (Session["usuarioLogedIn"] != null)
            {
                usuario = (Usuario)Session["usuarioLogedIn"];
                if (usuario.Admin == true)
                {
                    Response.Redirect("LandingPageAdministrador.aspx");
                }
                else
                {
                    Response.Redirect("Juegos.aspx");
                }
            }
        }
    }
}