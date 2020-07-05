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
        protected Noticia noticia = new Noticia();

        public Noticia traerNoticia(int id)
        {
            DataTable tabla = ds.ObtenerTabla("Noticias", "Select * from Noticias where N_Codigo_Noticia =" + id);
            noticia.Codigo_Noticia = id;
            noticia.Codigo_Juego = (Convert.ToInt32(tabla.Rows[0][1].ToString()));
            noticia.Nombre = (tabla.Rows[0][2].ToString());
            noticia.Descripcion = (tabla.Rows[0][3].ToString());
            noticia.Imagen_Url = (tabla.Rows[0][4].ToString());

            return noticia;
        }

        public int ultimoId()
        {
            int ultimo = ds.ObtenerUltimoId("select top 1 * from Noticias ORDER BY CASE WHEN ISNUMERIC(N_Codigo_Noticia) = 1 THEN CONVERT(INT, N_Codigo_Noticia) ELSE 9999999 END DESC");

            return ultimo;
        }

        public bool existeNoticia(Noticia n)
        {
            String consulta = "Select * from Noticias where N_Nombre='" + n.Nombre + "'";
            return ds.existe(consulta);
        }

        public bool estaActivo(Noticia noticia)
        {
            String consulta = "Select * From Noticias where N_Codigo_Noticia = '" + noticia.Codigo_Noticia + "' and N_Estado = '1'";
            return ds.existe(consulta);
        }

        public int eliminarNoticia(Noticia n)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaEliminar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Noticias");

        }

        public int activarNoticia(Noticia n)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaEliminar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Activate_Noticias");

        }


        public int agregarNoticia(Noticia n)
        {
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
