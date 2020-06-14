using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_Integrador_Grupo_4
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearCuenta_LogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearNuevaCuenta.aspx");
        }
    }
}