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
    class DatosPeriferico
    {
        AccesoDatos ds = new AccesoDatos();

        public bool existePeriferico(Periferico p)
        {
            String consulta = "Select * from Perifericos where PE_Nombre='" + p.Nombre + "'";
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
