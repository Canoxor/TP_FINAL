using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DatosFactura
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable traerFacturas()
        {
            DataTable tabla = ds.ObtenerTabla("Facturas", "Select * from Factura");
            return tabla;
        }


        public DataTable traerFacturaFiltro(int opc)
        {
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    tabla = ds.ObtenerTabla("Facturas", "Select * from Factura Order By F_Fecha DESC");
                    break;
                case 2:
                    tabla = ds.ObtenerTabla("Facturas", "Select * from Factura Order By F_Fecha ASC");
                    break;
                case 3:
                    tabla = ds.ObtenerTabla("Facturas", "Select * from Factura Order By F_MontoTotal DESC");
                    break;
                case 4:
                    tabla = ds.ObtenerTabla("Facturas", "Select * from Factura Order By F_MontoTotal ASC");
                    break;
                case 5:
                    tabla = ds.ObtenerTabla("Facturas", "Select * from Factura Order By F_Codigo_Usuario");
                    break;
                default:
                    tabla = traerFacturas();
                    break;
            }
            return tabla;
        }

        public DataTable traerFacturasUsuario(int id)
        {
            DataTable tabla = ds.ObtenerTabla("Factura", "select* from Factura WHERE F_Codigo_Usuario = '" + id + "'");
            return tabla;
        }

        public DataTable traerDetalleFacturaJuegosUsuario(int id)
        {
            DataTable tabla = ds.ObtenerTabla("DetalleFacturaJuegos", "SELECT J_Imagen,J_Nombre,DJ_Cantidad,DJ_PrecioUnitario,F_Fecha FROM Factura INNER JOIN DetalleFactura_Juegos ON DJ_Codigo_Factura = F_Codigo_Factura INNER JOIN Juegos ON DJ_Codigo_Juego = J_Codigo_Juego WHERE F_Codigo_Factura = '" + id + "'");
            return tabla;
        }
        public DataTable traerDetalleFacturaPerifericosUsuario(int id)
        {
            DataTable tabla = ds.ObtenerTabla("DetalleFacturaPerifericos", "SELECT PE_Imagen,PE_Nombre,DP_Cantidad,DP_PrecioUnitario,F_Fecha FROM Factura INNER JOIN DetalleFactura_Perifericos ON DP_Codigo_Factura = F_Codigo_Factura INNER JOIN Perifericos ON DP_Codigo_Periferico = PE_Codigo_Periferico WHERE F_Codigo_Factura = '" + id + "'");
            return tabla;
        }

        public int agregarFactura(FacturaProductos f)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosFacturaAgregar(ref comando, f);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Factura");
        }
        public int agregarDetalleJuego(DetalleFacturaJuego dj)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosDetalleJuegoAgregar(ref comando, dj);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Detalle_Juego");
        }
        public int agregarDetallePeriferico(DetalleFacturaPeriferico dp)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosDetallePerifericoAgregar(ref comando, dp);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Detalle_Periferico");
        }

        private void armarParametrosFacturaAgregar(ref SqlCommand comando, FacturaProductos f)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@F_Codigo_Usuario", SqlDbType.VarChar);
            sqlParametros.Value = f.Codigo_Usuario;
            sqlParametros = comando.Parameters.Add("@F_Codigo_CodDescuento", SqlDbType.VarChar);
            sqlParametros.Value = f.Codigo_CodDescuento;
            sqlParametros = comando.Parameters.Add("@F_MontoTotal", SqlDbType.Decimal);
            sqlParametros.Value = f.Monto_Total;
            sqlParametros = comando.Parameters.Add("@F_Fecha", SqlDbType.Date);
            sqlParametros.Value = f.Fecha;
        }

        private void armarParametrosDetalleJuegoAgregar(ref SqlCommand comando, DetalleFacturaJuego dj)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@DJ_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = dj.CodigoJuego;
            sqlParametros = comando.Parameters.Add("@DJ_Cantidad", SqlDbType.Int);
            sqlParametros.Value = dj.Cantidad;
            sqlParametros = comando.Parameters.Add("@DJ_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = dj.PrecioUnitario;
        }

        private void armarParametrosDetallePerifericoAgregar(ref SqlCommand comando, DetalleFacturaPeriferico dp)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@DP_Codigo_Periferico", SqlDbType.VarChar);
            sqlParametros.Value = dp.CodigoPeriferico;
            sqlParametros = comando.Parameters.Add("@DP_Cantidad", SqlDbType.Int);
            sqlParametros.Value = dp.Cantidad;
            sqlParametros = comando.Parameters.Add("@DP_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = dp.PrecioUnitario;
        }

    }
}
