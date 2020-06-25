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

        public Periferico llenarCamposPeriferico(Periferico E_Periferico)
        {
            DataTable tabla = ds.ObtenerTabla("Periferico", "Select * from Perifericos where PE_Codigo_Periferico=" + E_Periferico.Codigo_Periferico);
            E_Periferico.Codigo_TipoPerif = (Convert.ToInt32(tabla.Rows[0][1].ToString()));
            E_Periferico.Codigo_Marca = (Convert.ToInt32(tabla.Rows[0][2].ToString()));
            E_Periferico.Nombre = (tabla.Rows[0][3].ToString());
            E_Periferico.Descripcion = (tabla.Rows[0][4].ToString());
            E_Periferico.Stock = (Convert.ToInt32(tabla.Rows[0][5].ToString()));
            E_Periferico.Precio_Unitario = (Convert.ToInt32(tabla.Rows[0][6].ToString()));
            E_Periferico.Imagen_Url = (tabla.Rows[0][7].ToString());

            return E_Periferico;
        }

        public bool existePeriferico(Periferico E_Periferico)
        {
            String consulta = "Select * from Perifericos where PE_Nombre='" + E_Periferico.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoAgregar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEliminar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarPeriferico(Periferico p)
        {
            p.Codigo_Periferico = ds.ObtenerUltimoId("Select max(PE_Codigo_Periferico) from Perifericos") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoAgregar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        private void armarParametrosPerifericoEliminar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOPERIFERICO", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Periferico;
        }

        private void armarParametrosPerifericoAgregar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOPERIFERICO", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Periferico;
            sqlParametros = comando.Parameters.Add("@CODIGOTIPOPERIF", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_TipoPerif;
            sqlParametros = comando.Parameters.Add("@CODIGOMARCA", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Marca;
            sqlParametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParametros.Value = p.Nombre;
            sqlParametros = comando.Parameters.Add("@DESCRIPCION", SqlDbType.VarChar);
            sqlParametros.Value = p.Descripcion;
            sqlParametros = comando.Parameters.Add("@STOCK", SqlDbType.Int);
            sqlParametros.Value = p.Stock;
            sqlParametros = comando.Parameters.Add("@PRECIOUNITARIO", SqlDbType.Decimal);
            sqlParametros.Value = p.Precio_Unitario;
            sqlParametros = comando.Parameters.Add("@IMAGEN", SqlDbType.VarChar);
            sqlParametros.Value = p.Imagen_Url;
        }
    }
}
