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
    public partial class JuegosModificar : System.Web.UI.Page
    {
        protected NegocioJuego N_Juego = new NegocioJuego();
        protected Juego juego = new Juego();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                juego = (Juego)Session["jModificar"];
                setTextBox();
                estaActivo();

            }
            estaActivo();
            juego = (Juego)Session["jModificar"];
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("JuegosAdministrador.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            setValores();
            if (N_Juego.editarJuego(juego))
            {
                lblMensaje.Text = "Se Actualizo con exito";
                Session["jModificar"] = juego;
            }
            else
            {
                lblMensaje.Text = "No se pudo Actualizar, intente nuevamente";
            }
        }

        protected void setTextBox()
        {
            lbl_CodigoSeleccionado.Text = juego.Codigo_Juego.ToString();
            txtPrecio.Text = juego.Precio_Unitario.ToString();
            txtStock.Text = juego.Stock.ToString();
        }

        protected void setValores()
        {
            juego.Precio_Unitario = Convert.ToInt32(txtPrecio.Text);
            juego.Stock = Convert.ToInt32(txtStock.Text);

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (N_Juego.BajaJuego(juego.Codigo_Juego) == true)
            {
                lblMensaje.Text = "El Periferico se elimino correctamente";
            } else
            {
                lblMensaje.Text = "No se pudo eliminar correctamente, intentelo nuevamente";
            }

        }

        protected void estaActivo()
        {
            if (N_Juego.estaActivo(juego) == true)
            {
                btnActivar.Enabled = false;
                btnActivar.Visible = false;
                btnEliminar.Enabled = true;
                btnEliminar.Visible = true;
            }
            else
            {
                btnEliminar.Enabled = false;
                btnEliminar.Visible = false;
                btnActivar.Enabled = true;
                btnActivar.Visible = true;
            }
        }

        protected void btnActivar_Click(object sender, EventArgs e)
        {
            if (N_Juego.activarJuego(juego) == true)
            {
                lblMensaje.Text = "Se Activo correctamente";
                estaActivo();

            }
            else
            {
                lblMensaje.Text = "No se pudo activar";
            }
        }
    }
}