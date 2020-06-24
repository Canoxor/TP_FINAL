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

        public bool existeJuego(Juego juegoBuscado)
        {
            String consulta = "Select * from Juegos where J_Nombre='" + juegoBuscado.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoAgregar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEliminar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarJuego(Juego j)
        {
            j.Codigo_Juego = ds.ObtenerUltimoId("Select max(J_Codigo_Juego) from Juegos") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoAgregar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        private void armarParametrosJuegoEliminar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOJUEGO", SqlDbType.Int);
            sqlParametros.Value = j.Codigo_Juego;
        }

        private void armarParametrosJuegoAgregar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOJUEGO", SqlDbType.Int);
            sqlParametros.Value = j.Codigo_Juego; 
            sqlParametros = comando.Parameters.Add("@CODIGOGENERO", SqlDbType.Int);
            sqlParametros.Value = j.Codigo_Genero;            
            sqlParametros = comando.Parameters.Add("@CODIGOPEGI", SqlDbType.Int);
            sqlParametros.Value = j.Codigo_PEGI;
            sqlParametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParametros.Value = j.Nombre;            
            sqlParametros = comando.Parameters.Add("@DESCRIPCION", SqlDbType.VarChar);
            sqlParametros.Value = j.Descripcion;
            sqlParametros = comando.Parameters.Add("@STOCK", SqlDbType.Int);
            sqlParametros.Value = j.Stock;         
            sqlParametros = comando.Parameters.Add("@PRECIOUNITARIO", SqlDbType.Decimal);
            sqlParametros.Value = j.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@IMAGEN", SqlDbType.VarChar);
            sqlParametros.Value = j.Imagen_Url;
        }
        
    }
}
