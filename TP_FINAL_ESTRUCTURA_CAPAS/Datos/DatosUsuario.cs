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
    public class DatosUsuario
    {
        AccesoDatos ds = new AccesoDatos();

        public Usuario ObtenerUsuario(Usuario E_Usuario)
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "select * from Usuarios where U_Codigo_Usuario ="+ E_Usuario.Codigo_Usuario);
            E_Usuario.Dni = Convert.ToInt32(tabla.Rows[0][1].ToString());
            E_Usuario.Nombre = tabla.Rows[0][2].ToString();
            E_Usuario.Apellido = tabla.Rows[0][3].ToString();
            E_Usuario.Direccion = tabla.Rows[0][4].ToString();
            E_Usuario.Telefono = Convert.ToInt32(tabla.Rows[0][5].ToString());
            E_Usuario.Admin = Convert.ToBoolean(tabla.Rows[0][6].ToString());

            return E_Usuario;
        }

        public Usuario getUsuarioLogin(Usuario u)
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "select * from Usuarios where U_Email = '" + u.Email + "' and U_Contrasenia = '" + u.Contraseña + "'");
            u.Codigo_Usuario = Convert.ToInt32(tabla.Rows[0][0].ToString());
            u.Dni = Convert.ToInt32(tabla.Rows[0][1].ToString());
            u.Nombre = tabla.Rows[0][2].ToString();
            u.Apellido = tabla.Rows[0][3].ToString();
            u.Direccion = tabla.Rows[0][4].ToString();
            u.Telefono = Convert.ToInt32(tabla.Rows[0][5].ToString());
            u.Admin = Convert.ToBoolean(tabla.Rows[0][6].ToString());
            return u;
        }

        public bool existeUsuario(Usuario u)
        {
            String consulta = "Select * from Usuarios where U_Email ='" + u.Email + "' and U_Contrasenia = '" + u.Contraseña + "'";
            return ds.existe(consulta);
        }

        public bool existeDniUsuario(Usuario u)
        {
            String consulta = "Select * from Usuarios where U_Dni_Usuario ='" + u.Dni + "'";
            return ds.existe(consulta);
        }

        public bool existeEmailUsuario(Usuario u)
        {
            String consulta = "Select * from Usuarios where U_Email = '" + u.Email + "'";
            return ds.existe(consulta);
        }

        public DataTable getTablaUsuarios()
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "select * from Usuarios");
            return tabla;
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int editarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioAgregar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioEliminar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarUsuario(Usuario u)
        {
            u.Codigo_Usuario = ds.ObtenerUltimoId("Select max(U_Codigo_Usuario) from Usuarios") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioAgregar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "NombreProcedimiento");
        }

        private void armarParametrosUsuarioEliminar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOUSUARIO", SqlDbType.Int);
            sqlParametros.Value = u.Codigo_Usuario;
        }

        private void armarParametrosUsuarioAgregar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@CODIGOUSUARIO", SqlDbType.Int);
            sqlParametros.Value = u.Codigo_Usuario;
            sqlParametros = comando.Parameters.Add("@DNI", SqlDbType.Int);
            sqlParametros.Value = u.Dni;
            sqlParametros = comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParametros.Value = u.Nombre;
            sqlParametros = comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            sqlParametros.Value = u.Apellido;
            sqlParametros = comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            sqlParametros.Value = u.Direccion;
            sqlParametros = comando.Parameters.Add("@TELEFONO", SqlDbType.Int);
            sqlParametros.Value = u.Telefono;
            sqlParametros = comando.Parameters.Add("@ADMIN", SqlDbType.Bit);
            sqlParametros.Value = u.Admin;
            sqlParametros = comando.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            sqlParametros.Value = u.Email;
            sqlParametros = comando.Parameters.Add("@CONTRASENIA", SqlDbType.VarChar);
            sqlParametros.Value = u.Contraseña;
        }
      
    }
}
