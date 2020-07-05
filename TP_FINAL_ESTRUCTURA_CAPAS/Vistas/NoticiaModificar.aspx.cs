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
    public partial class NoticiaModificar : System.Web.UI.Page
    {
        protected NegocioNoticia N_Noticia = new NegocioNoticia();
        protected Noticia noticia = new Noticia();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                noticia = (Noticia)Session["nModificar"];
                setLabels();
                estaActivo();

            }
            estaActivo();
            noticia = (Noticia)Session["nModificar"];
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NoticiasAdministrador.aspx");
        }

        protected void setLabels()
        {
            lbl_CodigoSeleccionado.Text = noticia.Codigo_Noticia.ToString();
            lblTitulo.Text = noticia.Nombre;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (N_Noticia.BajaNoticia(noticia.Codigo_Noticia) == true)
            {
                lblMensaje.Text = "La Noticia se elimino correctamente";
            } else
            {
                lblMensaje.Text = "La Noticia no se pudo eliminar correctamente, intentelo nuevamente";
            }

        }

        protected void estaActivo()
        {
            if (N_Noticia.estaActivo(noticia) == true)
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
            if (N_Noticia.activarNoticia(noticia) == true)
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