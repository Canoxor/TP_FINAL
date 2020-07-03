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
    public partial class UsuariosModificar : System.Web.UI.Page
    {
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usuario = (Usuario)Session["usuarioLogedIn"];
                setTextBox();             
            }

            usuario = (Usuario)Session["usuarioLogedIn"];
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if(puedeActualizar()==true)
            {
                setNuevosValoresUsuario();
                if (N_Usuario.editarUsuario(usuario))
                {
                    lblMensaje.Text = "Su informacion se actualizo correctamente";
                    Session["usuarioLogedIn"] = usuario;
                } else
                {
                    lblMensaje.Text = "Hubo un error, no pudimos actualizar su informacion";
                }
                
            }
        }

        protected void setTextBox()
        {
            lblIntro.Text = usuario.Nombre + ", Aqui usted podra editar su información personal";
            txtNombre.Text = usuario.Nombre;
            txtApellido.Text = usuario.Apellido;
            txtDireccion.Text = usuario.Direccion;
            txtDni.Text = usuario.Dni + "";
            txtTelefono.Text = usuario.Telefono + "";
            txtEmail.Text = usuario.Email;
            txtContraseniaActual.Text = usuario.Contraseña;
            txtContraseniaNueva.Text = usuario.Contraseña;
        }

        protected bool verificarDniEmail()
        {
            bool existe = false; 

            if (N_Usuario.verificarDni(Convert.ToInt32(txtDni.Text)) == true)
            {
                existe = true;
                lblDni.Text = "Ya Existe este DNI, pruebe con otro";
            }

            if (N_Usuario.verificarEmail(txtEmail.Text) == true)
            {
                existe = true;
                lblEmail.Text = "Ya Existe este Email, pruebe con otro";
            }

            return existe;
        }

        protected bool puedeActualizar()
        {

            if(verificarDniEmail() == false)
            {
                String contraseñaUsuario = usuario.Contraseña;
                String contraseñaIngresada = txtContraseniaActual.Text;
                if (contraseñaUsuario.Equals(contraseñaIngresada))
                {
                    return true;
                }
                else
                {
                    lblContraseña.Text = "La contraseña no coincide con la suya actual, intente con otra";
                }
            }

            return false;
            
        }

        protected void setNuevosValoresUsuario()
        {
            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Dni = Convert.ToInt32(txtDni.Text);
            usuario.Direccion = txtDireccion.Text;
            usuario.Telefono = Convert.ToInt32(txtTelefono.Text);
            usuario.Email = txtEmail.Text;
            usuario.Contraseña = txtContraseniaNueva.Text;
        }
    }
}