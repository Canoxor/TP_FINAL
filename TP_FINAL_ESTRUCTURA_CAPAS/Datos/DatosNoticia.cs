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

        public Noticia llenarCamposNoticia(Noticia E_Noticia)
        {
            if (E_Noticia.Codigo_Juego == 0)
            {
                DataTable tabla = ds.ObtenerTabla("Noticia", "Select * from Noticias where N_Codigo_Juego = MAX(N_Codigo_Juego)");
                E_Noticia.Nombre = (tabla.Rows[0][1].ToString());
                E_Noticia.Descripcion = (tabla.Rows[0][2].ToString());
                E_Noticia.Imagen_Url = (tabla.Rows[0][3].ToString());
            }
            else
            {
                DataTable tabla = ds.ObtenerTabla("Noticia", "Select * from Noticias where N_Codigo_Juego =" + E_Noticia.Codigo_Juego);
                E_Noticia.Nombre = (tabla.Rows[0][1].ToString());
                E_Noticia.Descripcion = (tabla.Rows[0][2].ToString());
                E_Noticia.Imagen_Url = (tabla.Rows[0][3].ToString());
            }
            return E_Noticia;
        }

        public bool existeNoticia(Noticia n)
        {
            String consulta = "Select * from Noticias where N_Nombre='" + n.Nombre + "'";
            return ds.existe(consulta);
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarNoticia(Noticia n)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaAgregar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarNoticia(Noticia n)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaEliminar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarNoticia(Noticia n)
        {
            n.Codigo_Noticia = ds.ObtenerUltimoId("Select max(N_Codigo_Noticia) from Noticias") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosNoticiaAgregar(ref comando, n);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        private void armarParametrosNoticiaEliminar(ref SqlCommand comando, Noticia n)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGONOTICIA", SqlDbType.Int);
            sqlParametros.Value = n.Codigo_Noticia;
        }

        private void armarParametrosNoticiaAgregar(ref SqlCommand comando, Noticia n)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGONOTICIA", SqlDbType.Int);
            sqlParametros.Value = n.Codigo_Noticia;
            sqlParametros = comando.Parameters.Add("@CODIGOJUEGO", SqlDbType.Int);
            sqlParametros.Value = n.Codigo_Juego;
            sqlParametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParametros.Value = n.Nombre;
            sqlParametros = comando.Parameters.Add("@DESCRIPCION", SqlDbType.VarChar);
            sqlParametros.Value = n.Descripcion;
            sqlParametros = comando.Parameters.Add("@IMAGEN", SqlDbType.VarChar);
            sqlParametros.Value = n.Imagen_Url;
        }
    }
}
