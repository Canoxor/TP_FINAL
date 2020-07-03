using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["JuegoSeleccionado"] != null)
                {
                    grd_Carrito_Juegos.DataSource = (DataTable)Session["CarritoJuegos"];
                    grd_Carrito_Juegos.DataBind();
                }
            }
        }

    }
}