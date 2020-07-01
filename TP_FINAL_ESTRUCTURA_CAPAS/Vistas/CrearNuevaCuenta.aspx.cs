using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class CrearNuevaCuenta : System.Web.UI.Page
    {
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            estaLogedIn();
        }
        protected void btnCuentaExistente_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            if(verificarDniEmail() == false)
            {
                crearCuenta();
                usuario = N_Usuario.ObtenerUsuarioLogin(txtEmail_SignIn.Text, txtPassword_SignIn.Text);
                Session["usuarioLogedIn"] = usuario;
                Response.Redirect("Juegos.aspx");
            }
        }

        private bool verificarDniEmail()
        {
            bool existe = false;
            if (N_Usuario.verificarDni(Convert.ToInt32(txtDni_SignIn.Text)))
            {
                lblDniExistente.Text = "Ya existe este dni en la base de datos, vuelva a intentar con otro";
                existe = true;
            }
            if (N_Usuario.verificarEmail(txtEmail_SignIn.Text))
            {
                lblEmailExistente.Text = "Este Email se encuentra activo, ingrese uno distinto";
                existe = true;
            }
            return existe;
        }
        
        private bool crearCuenta()
        {
            return N_Usuario.agregarUsuario(txtEmail_SignIn.Text, txtPassword_SignIn.Text, Convert.ToInt32(txtDni_SignIn.Text), txtNombre_SignIn.Text, txtApellido_SignIn.Text);
        }

        private void estaLogedIn()
        {
            if(Session["usuarioLogedIn"] != null)
            {
                usuario = (Usuario)Session["usuarioLogedIn"];
                if (usuario.Admin)
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