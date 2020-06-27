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

        public bool existeUsuario(String Email, String Contraseña)
        {
            String consulta = "Select * from Usuarios where U_Email ='" + Email + "' and U_Contrasenia = '" + Contraseña + "'";
            return ds.existe(consulta);
        }

        public bool existeDniUsuario(int Dni)
        {
            String consulta = "Select * from Usuarios where U_Dni_Usuario ='" + Dni + "'";
            return ds.existe(consulta);
        }

        public bool existeEmailUsuario(String Email)
        {
            String consulta = "Select * from Usuarios where U_Email = '" + Email + "'";
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
            armarParametrosUsuarioEditar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Usuarios");
        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int eliminarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioEliminar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Usuarios");

        }

        //Hay que cambiarle el nombre del procedimiento almacenado por el real

        public int agregarUsuario(Usuario u)
        {
            u.Codigo_Usuario = ds.ObtenerUltimoId("Select max(U_Codigo_Usuario) from Usuarios") + 1;
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioAgregar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Usuarios");
        }

        private void armarParametrosUsuarioEliminar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@U_Codigo_Usuario", SqlDbType.Int);
            sqlParametros.Value = u.Codigo_Usuario;
        }

        private void armarParametrosUsuarioEditar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@U_Codigo_Usuario", SqlDbType.Int);
            sqlParametros.Value = u.Codigo_Usuario;
            sqlParametros = comando.Parameters.Add("@U_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = u.Nombre;
            sqlParametros = comando.Parameters.Add("@U_Apellido", SqlDbType.VarChar);
            sqlParametros.Value = u.Apellido;
            sqlParametros = comando.Parameters.Add("@U_Direccion", SqlDbType.VarChar);
            sqlParametros.Value = u.Direccion;
            sqlParametros = comando.Parameters.Add("@U_Telefono", SqlDbType.Int);
            sqlParametros.Value = u.Telefono;
            sqlParametros = comando.Parameters.Add("@U_Admin", SqlDbType.Bit);
            sqlParametros.Value = u.Admin;
            sqlParametros = comando.Parameters.Add("@U_Email", SqlDbType.VarChar);
            sqlParametros.Value = u.Email;
            sqlParametros = comando.Parameters.Add("@U_Contrasenia", SqlDbType.VarChar);
            sqlParametros.Value = u.Contraseña;
        }

        private void armarParametrosUsuarioAgregar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@U_Codigo_Usuario", SqlDbType.Int);
            sqlParametros.Value = u.Codigo_Usuario;
            sqlParametros = comando.Parameters.Add("@U_Dni_Usuario", SqlDbType.Int);
            sqlParametros.Value = u.Dni;
            sqlParametros = comando.Parameters.Add("@U_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = u.Nombre;
            sqlParametros = comando.Parameters.Add("@U_Apellido", SqlDbType.VarChar);
            sqlParametros.Value = u.Apellido;
            sqlParametros = comando.Parameters.Add("@U_Direccion", SqlDbType.VarChar);
            sqlParametros.Value = u.Direccion;
            sqlParametros = comando.Parameters.Add("@U_Telefono", SqlDbType.Int);
            sqlParametros.Value = u.Telefono;
            sqlParametros = comando.Parameters.Add("@U_Admin", SqlDbType.Bit);
            sqlParametros.Value = u.Admin;
            sqlParametros = comando.Parameters.Add("@U_Email", SqlDbType.VarChar);
            sqlParametros.Value = u.Email;
            sqlParametros = comando.Parameters.Add("@U_Contrasenia", SqlDbType.VarChar);
            sqlParametros.Value = u.Contraseña;
        }
      
    }
}
