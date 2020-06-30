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
                lbl_Codigo.Text = ((Label)PreviousPage.FindControl("lbl_Codigo")).Text;

                NegocioPeriferico Neg_Perif = new NegocioPeriferico();

                Periferico Perif = new Periferico();

                Perif = Neg_Perif.ObtenerPeriferico(Convert.ToInt32(lbl_Codigo.Text));

                img_Imagen.ImageUrl = Perif.Imagen_Url;
                lbl_Nombre.Text = Perif.Nombre;
                lbl_Precio.Text = Convert.ToString(Perif.Precio_Unitario);
                lbl_Cantidad.Text = "$ " + ((TextBox)PreviousPage.FindControl("txt_Cantidad")).Text;

                lbl_Monto.Text = Convert.ToString(float.Parse(lbl_Precio.Text) * int.Parse(lbl_Cantidad.Text));
            }
        }
    }
}