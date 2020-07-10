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
    public class DatosJuego
    {
        AccesoDatos ds = new AccesoDatos();
        public Juego traerJuego(Juego E_Juego)
        {
            DataTable tabla = ds.ObtenerTabla("Juego", "Select * from Juegos where J_Codigo_Juego=" + E_Juego.Codigo_Juego);
            E_Juego.Codigo_Genero = (Convert.ToInt32(tabla.Rows[0][1].ToString()));
            E_Juego.Codigo_PEGI = (Convert.ToInt32(tabla.Rows[0][2].ToString()));
            E_Juego.Nombre = (tabla.Rows[0][3].ToString());
            E_Juego.Descripcion = (tabla.Rows[0][4].ToString());
            E_Juego.Stock = (Convert.ToInt32(tabla.Rows[0][5].ToString()));
            E_Juego.Precio_Unitario = (float.Parse(tabla.Rows[0][6].ToString()));
            E_Juego.Imagen_Url = (tabla.Rows[0][7].ToString());

            return E_Juego;
        }

        public int ultimoId()
        {
            int ultimo = ds.ObtenerUltimoId("select top 1 * from Juegos ORDER BY CASE WHEN ISNUMERIC(J_Codigo_Juego) = 1 THEN CONVERT(INT, J_Codigo_Juego) ELSE 9999999 END DESC");

            return ultimo;
        }

        public bool estaActivo(Juego juego)
        {
            String consulta = "Select * From Juegos where J_Codigo_Juego = '" + juego.Codigo_Juego + "' and J_Estado = '1'";
            return ds.existe(consulta);
        }

        public DataTable traerJuegos()
        {
            DataTable tabla = ds.ObtenerTabla("Juegos", "Select * from Juegos");
            return tabla;
        }

        public DataTable traerPegi()
        {
            DataTable tabla = ds.ObtenerTabla("PEGI", "Select * from PEGI");
            return tabla;
        }

        public DataTable traerGeneros()
        {
            DataTable tabla = ds.ObtenerTabla("Generos", "Select * from Generos");
            return tabla;
        }

        public bool existeJuego(Juego juegoBuscado)
        {
            String consulta = "Select * from Juegos where J_Nombre='" + juegoBuscado.Nombre + "'";
            return ds.existe(consulta);
        }


        public int editarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEditar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Juegos");
        }


        public int eliminarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEliminar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Juegos");

        }
        public int activarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEliminar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Activate_Juegos");

        }


        public int agregarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoAgregar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Juegos");
        }

        //Procedimientos Reporte

        public DataTable reporteVerificarStockOrdenado(int opc)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    tabla =  ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_VerificarStock_Juegos_OrdenStock", "StockOrdenadoStock");
                    break;
                case 2:
                    tabla =  ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_VerificarStock_Juegos_OrdenGenero", "StockOrdenadoGenero");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        public DataTable reportePorcentajeGeneroVendido(int opc, DateTime fechaMinima, DateTime fechaMaxima, int codGenero)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    armarParametrosPorcentajeGenero(ref comando, fechaMinima, fechaMaxima, codGenero);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_Porcentaje_Genero_Cantidad", "GeneroPorID");
                    break;
                case 2:
                    armarParametrosPorcentajeTodosLosGeneros(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_Porcentaje_TodosGeneros_Cantidad", "TodosLosGeneros");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        public DataTable reportePorcentajeJuegosVendidos(int opc, DateTime fechaMinima, DateTime fechaMaxima, int codJuego)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    armarParametrosPorcentajeJuegos(ref comando, fechaMinima, fechaMaxima, codJuego);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_Porcentaje_Juego_Cantidad", "PorcentajeCantidadJuego");
                    break;
                case 2:
                    armarParametrosPorcentajeJuegos(ref comando, fechaMinima, fechaMaxima, codJuego);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_Porcentaje_Juego_Monto", "PorcentajeMontoJuego");
                    break;
                case 3:
                    armarParametrosPorcentajeTodosLosGeneros(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_TotalRecaudado_TodosJuegos", "TotalRecaudadoTodosJuegos");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        //FIN

        private void armarParametrosPorcentajeTodosLosGeneros(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_Minima", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_Maxima", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
        }

        private void armarParametrosJuegoEliminar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@J_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Juego;
        }

        private void armarParametrosPorcentajeGenero(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima, int codGenero)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_Minima", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_Maxima", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
            sqlParametros = comando.Parameters.Add("@Genero", SqlDbType.VarChar);
            sqlParametros.Value = codGenero;
        }

        private void armarParametrosPorcentajeJuegos(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima, int codJuego)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_Minima", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_Maxima", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
            sqlParametros = comando.Parameters.Add("@Juego", SqlDbType.VarChar);
            sqlParametros.Value = codJuego;
        }

        private void armarParametrosJuegoEditar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@J_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Juego; 
            sqlParametros = comando.Parameters.Add("@J_Codigo_Genero", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Genero;
            sqlParametros = comando.Parameters.Add("@J_Codigo_PEGI", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_PEGI;
            sqlParametros = comando.Parameters.Add("@J_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = j.Nombre;
            sqlParametros = comando.Parameters.Add("@J_Descripcion", SqlDbType.VarChar);
            sqlParametros.Value = j.Descripcion;
            sqlParametros = comando.Parameters.Add("@J_Stock", SqlDbType.Int);
            sqlParametros.Value = j.Stock;
            sqlParametros = comando.Parameters.Add("@J_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = j.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@J_Imagen", SqlDbType.VarChar);
            sqlParametros.Value = j.Imagen_Url;
        }


        private void armarParametrosJuegoAgregar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@J_Codigo_Genero", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Genero;            
            sqlParametros = comando.Parameters.Add("@J_Codigo_PEGI", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_PEGI;
            sqlParametros = comando.Parameters.Add("@J_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = j.Nombre;            
            sqlParametros = comando.Parameters.Add("@J_Descripcion", SqlDbType.VarChar);
            sqlParametros.Value = j.Descripcion;
            sqlParametros = comando.Parameters.Add("@J_Stock", SqlDbType.Int);
            sqlParametros.Value = j.Stock;         
            sqlParametros = comando.Parameters.Add("@J_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = j.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@J_Imagen", SqlDbType.VarChar);
            sqlParametros.Value = j.Imagen_Url;
        }
        
    }
}
