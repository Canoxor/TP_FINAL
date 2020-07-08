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
    public partial class PerifericosModificar : System.Web.UI.Page
    {

        protected NegocioPeriferico N_Periferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();
        protected Usuario usuario = new Usuario();
        protected DataTable tabla = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarInfo();
                cargarDDL();
                estaActivo();
            }
            estaActivo();
            cargarInfo();
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }

        protected void cargarDDL()
        {
            cargarDDLMarcas();
            cargarDDLTipoPeriferico();
        }
        protected void cargarInfo()
        {
            periferico = (Periferico)Session["pModificar"];
            setLabelUsuario();
            setValoresIniciales();
        }

        protected void setValoresIniciales()
        {
            lblCodigoPeriferico.Text = periferico.Codigo_Periferico.ToString();
            txtDescripcion.Text = periferico.Descripcion;
            txtNombre.Text = periferico.Nombre;
            txtPrecio.Text = periferico.Precio_Unitario.ToString();
            txtStock.Text = periferico.Stock.ToString();
            txtURL.Text = periferico.Imagen_Url;
        }

        protected void cargarDDLMarcas()
        {

            tabla = N_Periferico.tablaMarcas();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlMarca.Items.Add(item);
            }

            ddlMarca.DataTextField = "M_Nombre";
            ddlMarca.DataValueField = "M_Codigo_Marca";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("--Seleccione Marca--", "0"));
            ddlMarca.SelectedValue = "0";
            ddlMarca.SelectedIndex = periferico.Codigo_Marca;

        }
        protected void cargarDDLTipoPeriferico()
        {

            tabla = N_Periferico.tablaTipoPerifericos();

            for (int i = 0; i < tabla.Rows.Count; i++)
            {
                ListItem item = new ListItem(tabla.Rows[i][1].ToString(), tabla.Rows[i][0].ToString());
                ddlTipoPerif.Items.Add(item);
            }

            ddlTipoPerif.DataTextField = "T_Nombre";
            ddlTipoPerif.DataValueField = "T_Codigo_TipoPerif";
            ddlTipoPerif.DataBind();
            ddlTipoPerif.Items.Insert(0, new ListItem("--Seleccione Periferico--", "0"));
            ddlTipoPerif.SelectedValue = "0";
            ddlTipoPerif.SelectedIndex = periferico.Codigo_TipoPerif;
        }

        protected void setPeriferico()
        {
            periferico.Codigo_Marca = Convert.ToInt32(ddlMarca.SelectedValue);
            periferico.Codigo_TipoPerif = Convert.ToInt32(ddlTipoPerif.SelectedValue);
            periferico.Nombre = txtNombre.Text;
            periferico.Descripcion = txtDescripcion.Text;
            periferico.Precio_Unitario = float.Parse(txtPrecio.Text);
            periferico.Stock = Convert.ToInt32(txtStock.Text);
            periferico.Imagen_Url = txtURL.Text;

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
            setPeriferico();
            if (N_Periferico.editarPeriferico(periferico))
            {
                lblMensaje.Text = "Se Actualizo con exito";
                Session["pModificar"] = periferico;
            } else{
                lblMensaje.Text = "No se pudo Actualizar, intente nuevamente";
            }
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