using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class JuegosAgregar : System.Web.UI.Page
    {
        protected NegocioJuego N_Juego = new NegocioJuego();
        protected Juego juego = new Juego();
        protected DataTable tabla = new DataTable();
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarInfo();
                setLabelUsuario();
            }
            setLabelUsuario();
        }
        protected void cargarInfo()
        {
            cargarDDLPegi();
            cargarDDLGenero();
            lblCodigoJuego.Text = ((N_Juego.getUltimoID()) + 1).ToString();
        }
        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
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
    }
}
