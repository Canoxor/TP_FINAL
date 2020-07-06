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
