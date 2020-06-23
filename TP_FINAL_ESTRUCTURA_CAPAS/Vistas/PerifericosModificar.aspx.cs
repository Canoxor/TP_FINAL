using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class PerifericosModificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_CodigoSeleccionado.Text = ((Label)PreviousPage.FindControl("lbl_Codigo")).Text;
            }
        }
    }
}