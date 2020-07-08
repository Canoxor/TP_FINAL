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
    public partial class JuegosModificar : System.Web.UI.Page
    {
        protected NegocioJuego N_Juego = new NegocioJuego();
        protected Juego juego = new Juego();
        protected DataTable tabla = new DataTable();
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setValores();
                cargarDDL();
                estaActivo();
            }
            setValores();
            estaActivo();
        }
        protected void cargarDDL()
        {
            cargarDDLPegi();
            cargarDDLGenero();
        }

        protected void setValores()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
            juego = (Juego)Session["jModificar"];
            lblCodigoJuego.Text = juego.Codigo_Juego.ToString();
            txtDescripcion.Text = juego.Descripcion;
            txtNombre.Text = juego.Nombre;
            txtPrecio.Text = juego.Precio_Unitario.ToString();
            txtStock.Text = juego.Stock.ToString();
            txtURL.Text = juego.Imagen_Url;
        }

        protected void cargarDDLPegi()
        {

            tabla = N_Juego.tablaPegi();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlPegi.Items.Add(item);
            }

            ddlPegi.DataTextField = "PG_Nombre";
            ddlPegi.DataValueField = "PG_Codigo_PEGI";
            ddlPegi.DataBind();
            ddlPegi.Items.Insert(0, new ListItem("--Seleccione PEGI--", "0"));
            ddlPegi.SelectedValue = "0";
            ddlPegi.SelectedIndex = juego.Codigo_PEGI;

        }
        protected void cargarDDLGenero()
        {

            tabla = N_Juego.tablaGenero();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlGenero.Items.Add(item);
            }

            ddlGenero.DataTextField = "G_Nombre";
            ddlGenero.DataValueField = "G_Codigo_Genero";
            ddlGenero.DataBind();
            ddlGenero.Items.Insert(0, new ListItem("--Seleccione Genero--", "0"));
            ddlGenero.SelectedValue = "0";
            ddlGenero.SelectedIndex = juego.Codigo_Genero;
        }

        protected void setJuego()
        {
            juego.Codigo_Genero = Convert.ToInt32(ddlPegi.SelectedValue);
            juego.Codigo_PEGI = Convert.ToInt32(ddlGenero.SelectedValue);
            juego.Nombre = txtNombre.Text;
            juego.Descripcion = txtDescripcion.Text;
            juego.Precio_Unitario = float.Parse(txtPrecio.Text);
            juego.Stock = Convert.ToInt32(txtStock.Text);
            juego.Imagen_Url = txtURL.Text;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            setJuego();

            if (N_Juego.agregarJuego(juego))
            {

                lblMensaje.Text = "Se creo el juego con exito";
            }
            else
            {
                lblMensaje.Text = "El juego ya existe, intente con otro titulo";
            }

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
            setJuego();
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