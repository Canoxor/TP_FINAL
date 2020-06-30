﻿using System;
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

        public bool existePeriferico(Periferico E_Periferico)
        {
            String consulta = "Select * from Perifericos where PE_Nombre='" + E_Periferico.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEditar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Perifericos");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarPeriferico(Periferico p)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoEliminar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Perifericos");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarPeriferico(Periferico p)
        {
            p.Codigo_Periferico = ds.ObtenerUltimoId("Select max(PE_Codigo_Periferico) from Perifericos") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosPerifericoAgregar(ref comando, p);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Perifericos");
        }

        private void armarParametrosPerifericoEliminar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Periferico", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Periferico;
        }

        private void armarParametrosPerifericoEditar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Periferico", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Periferico;
            sqlParametros = comando.Parameters.Add("@PE_PrecioUnitario", SqlDbType.Decimal);
            sqlParametros.Value = p.Precio_Unitario;
        }

        private void armarParametrosPerifericoAgregar(ref SqlCommand comando, Periferico p)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Periferico", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_Periferico;
            sqlParametros = comando.Parameters.Add("@PE_Codigo_TipoPerif", SqlDbType.Int);
            sqlParametros.Value = p.Codigo_TipoPerif;
            sqlParametros = comando.Parameters.Add("@PE_Codigo_Marca", SqlDbType.Int);
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
