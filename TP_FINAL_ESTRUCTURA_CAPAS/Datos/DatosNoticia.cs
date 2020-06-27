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
    public class DatosNoticia
    {
        AccesoDatos ds = new AccesoDatos();

        public bool existeNoticia(Noticia n)
        {
            String consulta = "Select * from Noticias where N_Nombre='" + n.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarNoticia(Noticia n)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaEliminar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Noticias");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarNoticia(Noticia n)
        {
            n.Codigo_Noticia = ds.ObtenerUltimoId("Select max(N_Codigo_Noticia) from Noticias") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaAgregar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Noticias");
        }

        private void armarParametrosNoticiaEliminar(ref SqlCommand comando, Noticia n)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@N_Codigo_Noticia", SqlDbType.VarChar);
            sqlParametros.Value = n.Codigo_Noticia;
        }

        private void armarParametrosNoticiaAgregar(ref SqlCommand comando, Noticia n)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@N_Codigo_Noticia", SqlDbType.VarChar);
            sqlParametros.Value = n.Codigo_Noticia;
            sqlParametros = comando.Parameters.Add("@N_Codigo_Juego", SqlDbType.VarChar);
            sqlParametros.Value = n.Codigo_Juego;
            sqlParametros = comando.Parameters.Add("@N_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = n.Nombre;
            sqlParametros = comando.Parameters.Add("@N_Descripcion", SqlDbType.VarChar);
            sqlParametros.Value = n.Descripcion;
            sqlParametros = comando.Parameters.Add("@N_Imagen", SqlDbType.VarChar);
            sqlParametros.Value = n.Imagen_Url;
        }
    }
}
