using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas
{
    public partial class NoticiaModificar : System.Web.UI.Page
    {
        protected NegocioNoticia N_Noticia = new NegocioNoticia();
        protected Noticia noticia = new Noticia();
        protected DataTable tabla = new DataTable();
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setValores();
                cargarDDLJuegos();
                estaActivo();
            }
            setValores();
            estaActivo();
        }
        protected void setValores()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
            noticia = (Noticia)Session["nModificar"];
            lblCodigoNoticia.Text = noticia.Codigo_Noticia.ToString();
            txtDescripcion.Text = noticia.Descripcion;
            txtNombre.Text = noticia.Nombre;
            txtURL.Text = noticia.Imagen_Url;
        }

        protected void cargarDDLJuegos()
        {

            tabla = N_Noticia.tablaJuegos();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][3].ToString(), tabla.Rows[i][0].ToString());
                ddlJuego.Items.Add(item);
            }

            ddlJuego.DataTextField = "J_Nombre";
            ddlJuego.DataValueField = "J_Codigo_Juego";
            ddlJuego.DataBind();
            ddlJuego.Items.Insert(0, new ListItem("--Seleccione Juego--", "0"));
            ddlJuego.SelectedValue = "0";
            ddlJuego.SelectedIndex = noticia.Codigo_Juego;

        }

        protected void setNoticia()
        {
            noticia.Codigo_Juego = Convert.ToInt32(ddlJuego.SelectedValue);
            noticia.Nombre = txtNombre.Text;
            noticia.Descripcion = txtDescripcion.Text;
            noticia.Imagen_Url = txtURL.Text;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            setNoticia();
            if (N_Noticia.editarNoticia(noticia))
            {

                lblMensaje.Text = "La noticia se edito correctamente";
            }
            else
            {
                lblMensaje.Text = "No se pudo editar la noticia, intentelo nuevamente";
            }

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