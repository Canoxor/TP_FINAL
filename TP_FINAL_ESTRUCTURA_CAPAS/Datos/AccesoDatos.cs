using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    class AccesoDatos
    {
        String rutaBDParcial = "Data Source=localhost\\sqlexpress;Initial Catalog=PARCIAL_LAB_3_Version_10;Integrated Security=True";

        public AccesoDatos()
        {

        }


        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaBDParcial);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter Adaptador = ObtenerAdaptador(Sql, Conexion);
            Adaptador.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }


        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        

        //Para Preguntar en la BD si existe el usuario, Email, o lo que sea.

        public Boolean existe(String Consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(Consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }

        //Para cuando un usuario crea una cuenta, o nosotros agregamos un producto

        public int ObtenerUltimoId(String consulta)
        {
            int Ultimo = 0;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                Ultimo = Convert.ToInt32(datos[0].ToString());
            }
            return Ultimo;
        }

    }
}
