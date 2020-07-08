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
    public partial class NoticiasAgregar : System.Web.UI.Page
    {
        
        protected NegocioNoticia N_Noticia = new NegocioNoticia();
        protected Noticia noticia = new Noticia();
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
        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }
        protected void cargarInfo()
        {
            cargarDDLJuegos();
            lblCodigoNoticia.Text = ((N_Noticia.getUltimoID()) + 1).ToString();
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

        }
        
        protected void setJuego()
        {
            noticia.Codigo_Juego = Convert.ToInt32(ddlJuego.SelectedValue);
            noticia.Nombre = txtNombre.Text;
            noticia.Descripcion = txtDescripcion.Text;
            noticia.Imagen_Url = txtURL.Text;

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            setJuego();
            if (N_Noticia.agregarNoticia(noticia))
            {

                lblMensaje.Text = "La noticia se creó con exito";
            }
            else
            {
                lblMensaje.Text = "Ya existe una noticia con el mismo titulo, intente con otro";
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
    }
}