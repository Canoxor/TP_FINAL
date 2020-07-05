using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class CompraMensajePeriferico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                img_Imagen.ImageUrl = ((Periferico)Session["PerifericoSeleccionado"]).Imagen_Url;
                lbl_Nombre.Text = ((Periferico)Session["PerifericoSeleccionado"]).Nombre;
                lbl_Precio.Text = Convert.ToString(((Periferico)Session["PerifericoSeleccionado"]).Precio_Unitario);
                lbl_Cantidad.Text = Session["CantidadComprada"].ToString();
                lbl_Monto.Text = "$ " + (Convert.ToString(float.Parse(lbl_Precio.Text) * int.Parse(lbl_Cantidad.Text)));
            }
        }
    }
}