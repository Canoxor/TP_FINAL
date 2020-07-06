using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Usuarios : System.Web.UI.Page
    {

        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
            setLabels();
            Session["CodigoUsuario"] = usuario.Codigo_Usuario;
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void setLabels()
        {
            lblBienvenida.Text = "Bienvenido a tu perfil " + usuario.Nombre + ", aqui encontraras informacion tuya como tambien acceso a tu carrito de compras y a tu historial de compras.";
            lblNombre.Text = "Nombre: " + usuario.Nombre;
            lblApellido.Text = "Apellido: " + usuario.Apellido;
            lblDni.Text = "DNI: " + usuario.Dni;
            lblDireccion.Text = "Direccion: " + usuario.Direccion;
            lblTelefono.Text = "Telefono: " + usuario.Telefono;
            lblEmail.Text = "Email: " + usuario.Email;
        }
    }
}