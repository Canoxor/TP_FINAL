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
    public partial class Factura : System.Web.UI.Page
    {
        protected FacturaProductos factura = new FacturaProductos();
        protected DetalleFacturaJuego detalleJuego = new DetalleFacturaJuego();
        protected DetalleFacturaPeriferico detallePeriferico = new DetalleFacturaPeriferico();
        protected NegocioFactura NegocioFactura = new NegocioFactura();
        protected Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["Factura"] == null)
                {
                    Session["Factura"] = CrearTabla();
                }
                if (Session["CarritoJuegos"] != null)
                {
                    Session["CarritoJuegosSeleccionados"] = Session["CarritoJuegos"];
                    ((DataTable)Session["Factura"]).Merge(((DataTable)Session["CarritoJuegos"]));
                }
                if (Session["CarritoPerifericos"] != null)
                {
                    Session["CarritoPerifericosSeleccionados"] = Session["CarritoPerifericos"];
                    ((DataTable)Session["Factura"]).Merge(((DataTable)Session["CarritoPerifericos"]));
                }
                CargarGrid();
                usuario = (Usuario)Session["usuarioLogedIn"];
                lblNavbarUsuario.Text = usuario.Nombre;
                lbl_Nombre.Text = usuario.Nombre;
                lbl_DNI.Text = usuario.Dni.ToString();
                lbl_NumeroFac.Text = "Ultima Factura";

                CalcularMontoTotal();
            }
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblNavbarUsuario.Text = usuario.Nombre;
        }

        public void CalcularMontoTotal()
        {
            float Precio, PrecioTotal=0;
            int Cantidad;

            for (int i = 0; i < ((DataTable)Session["Factura"]).Rows.Count; i++)
            {
                Precio = float.Parse(((DataTable)Session["Factura"]).Rows[i]["Precio"].ToString());
                Cantidad = int.Parse(((DataTable)Session["Factura"]).Rows[i]["Cantidad"].ToString());
                PrecioTotal += Precio * Cantidad;
            }

            lbl_MontoTotal.Text = PrecioTotal.ToString();
        }

        public void CargarGrid()
        {
            grd_Factura.DataSource = (DataTable)Session["Factura"];
            grd_Factura.DataBind();
        }

        protected void grd_Factura_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Visible = false;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Visible = false;
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        public DataTable CrearTabla()
        {
            DataTable Tabla = new DataTable();
            DataColumn Columna_Codigo = new DataColumn("Codigo", System.Type.GetType("System.String"));
            DataColumn Columna_ImagenURL = new DataColumn("Imagen", System.Type.GetType("System.String"));
            DataColumn Columna_Nombre = new DataColumn("Nombre", System.Type.GetType("System.String"));
            DataColumn Columna_Precio = new DataColumn("Precio", System.Type.GetType("System.String"));
            DataColumn Columna_Cantidad = new DataColumn("Cantidad", System.Type.GetType("System.String"));

            Tabla.Columns.Add(Columna_Codigo);
            Tabla.Columns.Add(Columna_ImagenURL);
            Tabla.Columns.Add(Columna_Nombre);
            Tabla.Columns.Add(Columna_Precio);
            Tabla.Columns.Add(Columna_Cantidad);
            
            return Tabla;
        }

        public bool cargarFactura()
        {
            factura.Codigo_Usuario = usuario.Codigo_Usuario;
            factura.Codigo_CodDescuento = 0;
            factura.Fecha = DateTime.Now;
            factura.Monto_Total = float.Parse(lbl_MontoTotal.Text);

            if (NegocioFactura.agregarFactura(factura))
            {
                return true;
            } else
            {
                return false;
            }
        }

        public bool cargarDetalleJuego()
        {

                bool sePudo = false;
                for(int i = 0; i < ((DataTable)Session["CarritoJuegosSeleccionados"]).Rows.Count; i++)
                {
                    detalleJuego.Cantidad = int.Parse(((DataTable)Session["CarritoJuegosSeleccionados"]).Rows[i]["Cantidad"].ToString());
                    detalleJuego.CodigoJuego = int.Parse(((DataTable)Session["CarritoJuegosSeleccionados"]).Rows[i]["Codigo"].ToString());
                    detalleJuego.PrecioUnitario = float.Parse(((DataTable)Session["CarritoJuegosSeleccionados"]).Rows[i]["Precio"].ToString());

                    sePudo = NegocioFactura.agregarDetalleJuego(detalleJuego);
                }
                Session["CarritoJuegosSeleccionados"] = null;
                return sePudo;
            
        }

        public bool cargarDetallePeriferico()
        {

                bool sePudo = false;
                for(int i = 0; i < ((DataTable)Session["CarritoPerifericosSeleccionados"]).Rows.Count; i++)
                {
                    detallePeriferico.Cantidad = int.Parse(((DataTable)Session["CarritoPerifericosSeleccionados"]).Rows[i]["Cantidad"].ToString());
                    detallePeriferico.CodigoPeriferico = int.Parse(((DataTable)Session["CarritoPerifericosSeleccionados"]).Rows[i]["Codigo"].ToString());
                    detallePeriferico.PrecioUnitario = float.Parse(((DataTable)Session["CarritoPerifericosSeleccionados"]).Rows[i]["Precio"].ToString());

                    sePudo = NegocioFactura.agregarDetallePeriferico(detallePeriferico);
                }
                Session["CarritoPerifericosSeleccionados"] = null;

                return sePudo;
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            bool seCargo = false;
            if(Session["Factura"] != null)
            {
                seCargo = cargarFactura();
                if (Session["CarritoJuegosSeleccionados"] != null)
                {
                    seCargo = cargarDetalleJuego();
                }

                if (Session["CarritoPerifericosSeleccionados"] != null)
                {
                    seCargo = cargarDetallePeriferico();
                }
                if (seCargo)
                {
                    lblMensaje.Text = "La Factura se cargo correctamente";
                    Session["Factura"] = null;
                    CargarGrid();
                }
                else
                {
                    lblMensaje.Text = "No se pudo cargar la factura, intentelo nuevamente";
                }

            }
            else
            {
                lblMensaje.Text = "No hay ninguna factura para cargar";
            }
            
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }
    }
}