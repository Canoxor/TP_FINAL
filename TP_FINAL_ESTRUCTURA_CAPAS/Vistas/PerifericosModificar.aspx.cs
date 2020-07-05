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
    public partial class PerifericosModificar : System.Web.UI.Page
    {

        protected NegocioPeriferico N_Periferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                periferico = (Periferico)Session["pModificar"];
                setTextBox();
                estaActivo();
               
            }
            estaActivo();
            periferico = (Periferico)Session["pModificar"];
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerifericosAdministrador.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            setValores();
            if (N_Periferico.editarPeriferico(periferico))
            {
                lblMensaje.Text = "Se Actualizo con exito";
                Session["pModificar"] = periferico;
            } else{
                lblMensaje.Text = "No se pudo Actualizar, intente nuevamente";
            }
        }

        protected void setTextBox()
        {
            lbl_CodigoSeleccionado.Text = periferico.Codigo_Periferico.ToString();
            txtPrecio.Text = periferico.Precio_Unitario.ToString();
            txtStock.Text = periferico.Stock.ToString();
        }

        protected void setValores()
        {
            periferico.Precio_Unitario = Convert.ToInt32(txtPrecio.Text);
            periferico.Stock = Convert.ToInt32(txtStock.Text);
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if(N_Periferico.BajaPeriferico(periferico.Codigo_Periferico) == true)
            {
                lblMensaje.Text = "El Periferico se elimino correctamente";
            }
           
        }

        protected void estaActivo()
        {
            if(N_Periferico.estaActivo(periferico) == true)
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
            if (N_Periferico.activarPeriferico(periferico) == true)
            {
                lblMensaje.Text = "Se Activo correctamente";
                estaActivo();


            } else
            {
                lblMensaje.Text = "No se pudo activar";
            }
        }
    }
}