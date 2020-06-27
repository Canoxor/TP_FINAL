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
            E_Juego.Precio_Unitario = (Convert.ToInt32(tabla.Rows[0][6].ToString()));
            E_Juego.Imagen_Url = (tabla.Rows[0][7].ToString());

            return E_Juego;
        }

        public bool existeJuego(Juego juegoBuscado)
        {
            String consulta = "Select * from Juegos where J_Nombre='" + juegoBuscado.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEditar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Juegos");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarJuego(Juego j)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoEliminar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Juegos");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarJuego(Juego j)
        {
            j.Codigo_Juego = ds.ObtenerUltimoId("Select max(J_Codigo_Juego) from Juegos") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosJuegoAgregar(ref comando, j);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Juegos");
        }

        private void armarParametrosJuegoEliminar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@J_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Juego;
        }
        
        private void armarParametrosJuegoEditar(ref SqlCommand comando, Juego j)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@J_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = j.Codigo_Juego;
            sqlParametros = comando.Parameters.Add("@J_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = j.Precio_Unitario;
        }


        private void armarParametrosJuegoAgregar(ref SqlCommand comando, Juego j)
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
        
    }
}
