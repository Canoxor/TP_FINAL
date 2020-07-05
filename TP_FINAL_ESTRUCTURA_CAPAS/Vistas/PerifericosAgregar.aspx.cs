using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class PerifericosAgregar : System.Web.UI.Page
    {
        protected NegocioPeriferico N_Periferico = new NegocioPeriferico();
        protected Periferico periferico = new Periferico();
        protected DataTable tabla = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarInfo();
            }
        }

        protected void cargarInfo()
        {
            cargarDDLMarcas();
            cargarDDLTipoPeriferico();
            lblCodigoPeriferico.Text = ((N_Periferico.getUltimoID()) + 1).ToString();
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            setPeriferico();
            if(N_Periferico.agregarPeriferico(periferico))
            {
               
                lblMensaje.Text = "Se creo el periferico con exito";
            }
            else
            {
                lblMensaje.Text = "El periferico ya existe, intente con otro titulo";
            }

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
    }
}