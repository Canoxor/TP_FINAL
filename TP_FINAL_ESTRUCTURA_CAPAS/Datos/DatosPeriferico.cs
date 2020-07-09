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
    public class DatosPeriferico
    {

        AccesoDatos ds = new AccesoDatos();

        public Periferico traerPeriferico(Periferico E_Periferico)
        {

            DataTable tabla = ds.ObtenerTabla("Periferico", "Select * from Perifericos where PE_Codigo_Periferico=" + E_Periferico.Codigo_Periferico);
            E_Periferico.Codigo_TipoPerif = (Convert.ToInt32(tabla.Rows[0][1].ToString()));
            E_Periferico.Codigo_Marca = (Convert.ToInt32(tabla.Rows[0][2].ToString()));
            E_Periferico.Nombre = (tabla.Rows[0][3].ToString());
            E_Periferico.Descripcion = (tabla.Rows[0][4].ToString());
            E_Periferico.Stock = (Convert.ToInt32(tabla.Rows[0][5].ToString()));
            E_Periferico.Precio_Unitario = (float.Parse(tabla.Rows[0][6].ToString()));
            E_Periferico.Imagen_Url = (tabla.Rows[0][7].ToString());

            return E_Periferico;
        }

        public int ultimoId()
        {
            int ultimo = ds.ObtenerUltimoId("select top 1 * from Perifericos ORDER BY CASE WHEN ISNUMERIC(PE_Codigo_Periferico) = 1 THEN CONVERT(INT, PE_Codigo_Periferico) ELSE 9999999 END DESC");

            return ultimo;
        }

        public DataTable traerMarcas()
        {
            DataTable tabla = ds.ObtenerTabla("Marcas", "Select * from Marcas");
            return tabla;
        }

        public DataTable traerTipoPeriferico()
        {
            DataTable tabla = ds.ObtenerTabla("TipoPerif", "Select * from TipoPerif");
            return tabla;
        }

        public bool existePeriferico(Periferico E_Periferico)
        {
            String consulta = "Select * From Perifericos where PE_Nombre = '" + E_Periferico.Nombre + "'";
            return ds.existe(consulta);
        }

        public bool estaActivo(Periferico periferico)
        {
            String consulta = "Select * From Perifericos where PE_Codigo_Periferico = '" + periferico.Codigo_Periferico + "' and PE_Estado = '1'";
            return ds.existe(consulta);
        }


        public int editarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEditar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Perifericos");
        }


        public int eliminarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEliminar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Perifericos");

        }

        public int activarrPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEliminar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Activate_Perifericos");
        }


        public int agregarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoAgregar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Perifericos");
        }
        //Procedimientos Reporte

        public DataTable reporteVerificarStockOrdenado(int opc)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_VerificarStock_Perifericos_OrdenStock", "StockOrdenadoStock");
                    break;
                case 2:
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_VerificarStock_Perifericos_OrdenTipo", "StockOrdenadoTipoPerif");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        public DataTable reportePorcentajeTipoPerifericosVendido(int opc, DateTime fechaMinima, DateTime fechaMaxima, int codPerif)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    armarParametrosPorcentajeTipoPeriferico(ref comando, fechaMinima, fechaMaxima, codPerif);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_PorcentajeTipo_Periferico", "TipoPerifericoPorID");
                    break;
                case 2:
                    armarParametrosPorcentajeTodosLosTipoPeriferico(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_PorcentajeTipo_Periferico_TodosTipos", "TodosLosTipoPerifericos");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        //FIN

        private void armarParametrosPerifericoEliminar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Periferico", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_Periferico;
        }
        

        private void armarParametrosPorcentajeTipoPeriferico(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima, int tipoPerif)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_Minima", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_Maxima", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
            sqlParametros = comando.Parameters.Add("@TipoPerif", SqlDbType.VarChar);
            sqlParametros.Value = tipoPerif;
        }

        private void armarParametrosPorcentajeTodosLosTipoPeriferico(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_Minima", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_Maxima", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
        }

        private void armarParametrosPerifericoEditar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Periferico", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_Periferico;
            sqlParametros = comando.Parameters.Add("@PE_Codigo_TipoPerif", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_TipoPerif;
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Marca", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_Marca;
            sqlParametros = comando.Parameters.Add("@PE_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = p.Nombre;
            sqlParametros = comando.Parameters.Add("@PE_Descripcion", SqlDbType.VarChar);
            sqlParametros.Value = p.Descripcion;
            sqlParametros = comando.Parameters.Add("@PE_Stock", SqlDbType.Int);
            sqlParametros.Value = p.Stock;
            sqlParametros = comando.Parameters.Add("@PE_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = p.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@PE_Imagen", SqlDbType.VarChar);
            sqlParametros.Value = p.Imagen_Url;
        }

        private void armarParametrosPerifericoAgregar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_TipoPerif", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_TipoPerif;
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Marca", SqlDbType.VarChar);
            sqlParametros.Value = p.Codigo_Marca;
            sqlParametros = comando.Parameters.Add("@PE_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = p.Nombre;
            sqlParametros = comando.Parameters.Add("@PE_Descripcion", SqlDbType.VarChar);
            sqlParametros.Value = p.Descripcion;
            sqlParametros = comando.Parameters.Add("@PE_Stock", SqlDbType.Int);
            sqlParametros.Value = p.Stock;
            sqlParametros = comando.Parameters.Add("@PE_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = p.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@PE_Imagen", SqlDbType.VarChar);
            sqlParametros.Value = p.Imagen_Url;
        }
    }
}
