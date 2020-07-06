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

        protected void inflarUsuario()
        {
            usuario.Dni = Convert.ToInt32(txtDni_SignIn.Text);
            usuario.Nombre = txtNombre_SignIn.Text;
            usuario.Apellido = txtApellido_SignIn.Text;
            usuario.Direccion = "";
            usuario.Telefono = -1;
            usuario.Admin = false;
            usuario.Email = txtEmail_SignIn.Text;
            usuario.Contraseña = txtPassword_SignIn.Text;

        }
        
        private bool crearCuenta()
        {
            inflarUsuario();
            return N_Usuario.agregarUsuario(usuario);
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