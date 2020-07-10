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
            DataTable tabla = ds.ObtenerTabla("Usuarios", "select * from Usuarios where U_Email = '" + u.Email + "' and U_Contrasenia = '" + u.Contraseña + "'");
            u.Codigo_Usuario = Convert.ToInt32(tabla.Rows[0][0].ToString());
            u.Dni = Convert.ToInt32(tabla.Rows[0][1].ToString());
            u.Nombre = tabla.Rows[0][2].ToString();
            u.Apellido = tabla.Rows[0][3].ToString();
            u.Direccion = tabla.Rows[0][4].ToString();
            u.Telefono = Convert.ToInt32(tabla.Rows[0][5].ToString());
            u.Admin = Convert.ToBoolean(tabla.Rows[0][6].ToString());
            return u;
        }

        public Usuario getUsuarioByID(int id)
        {
            Usuario usuario = new Usuario();
            DataTable tabla = ds.ObtenerTabla("Usuarios", "select * from Usuarios where U_Codigo_Usuario = '" + id + "'");
            usuario.Codigo_Usuario = Convert.ToInt32(tabla.Rows[0][0].ToString());
            usuario.Dni = Convert.ToInt32(tabla.Rows[0][1].ToString());
            usuario.Nombre = tabla.Rows[0][2].ToString();
            usuario.Apellido = tabla.Rows[0][3].ToString();
            usuario.Direccion = tabla.Rows[0][4].ToString();
            usuario.Telefono = Convert.ToInt32(tabla.Rows[0][5].ToString());
            usuario.Admin = Convert.ToBoolean(tabla.Rows[0][6].ToString());
            usuario.Email = tabla.Rows[0][7].ToString();
            usuario.Contraseña = tabla.Rows[0][8].ToString();
            return usuario;
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

        public DataTable getTablaUsuarioBuscar(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("UsuarioBuscado", "select * from Usuarios where U_Nombre = '" + nombre + "'");
            return tabla;
        }

        public int editarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioEditar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Update_Usuarios");
        }


        public int eliminarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioEliminar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Delete_Usuarios");

        }

        public int activarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioEliminar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Activate_Usuarios");

        }


        public int agregarUsuario(Usuario u)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosUsuarioAgregar(ref comando, u);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_Insert_Usuarios");
        }

        private void armarParametrosUsuarioEliminar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@U_Codigo_Usuario", SqlDbType.VarChar);
            sqlParametros.Value = u.Codigo_Usuario;
        }

        private void armarParametrosUsuarioEditar(ref SqlCommand comando, Usuario u)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@U_Codigo_Usuario", SqlDbType.VarChar);
            sqlParametros.Value = u.Codigo_Usuario;
            sqlParametros = comando.Parameters.Add("@U_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = u.Nombre;
            sqlParametros = comando.Parameters.Add("@U_Apellido", SqlDbType.VarChar);
            sqlParametros.Value = u.Apellido;
            sqlParametros = comando.Parameters.Add("@U_Direccion", SqlDbType.VarChar);
            sqlParametros.Value = u.Direccion;
            sqlParametros = comando.Parameters.Add("@U_Telefono", SqlDbType.VarChar);
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
            sqlParametros = comando.Parameters.Add("@U_Dni_Usuario", SqlDbType.VarChar);
            sqlParametros.Value = u.Dni;
            sqlParametros = comando.Parameters.Add("@U_Nombre", SqlDbType.VarChar);
            sqlParametros.Value = u.Nombre;
            sqlParametros = comando.Parameters.Add("@U_Apellido", SqlDbType.VarChar);
            sqlParametros.Value = u.Apellido;
            sqlParametros = comando.Parameters.Add("@U_Direccion", SqlDbType.VarChar);
            sqlParametros.Value = u.Direccion;
            sqlParametros = comando.Parameters.Add("@U_Telefono", SqlDbType.VarChar);
            sqlParametros.Value = u.Telefono;
            sqlParametros = comando.Parameters.Add("@U_Admin", SqlDbType.Bit);
            sqlParametros.Value = u.Admin;
            sqlParametros = comando.Parameters.Add("@U_Email", SqlDbType.VarChar);
            sqlParametros.Value = u.Email;
            sqlParametros = comando.Parameters.Add("@U_Contrasenia", SqlDbType.VarChar);
            sqlParametros.Value = u.Contraseña;
        }

        public DataTable CargarProcedimiento(int opc, int usuario, DateTime fechaMinima, DateTime fechaMaxima)
        {
            SqlCommand comando = new SqlCommand();
            DataTable tabla = null;
            switch (opc)
            {
                case 1:
                    ArmarParametrosFechasConUsuario(ref comando, fechaMinima, fechaMaxima, usuario);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_ComprasRealizadas_Usuario", "Compras_U");
                    break;
                case 21:
                    ArmarParametrosSoloFechas(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_ComprasPorUsuario_Ord_FechaASC", "ComprasTotales_U_Asc");
                    break;
                case 22:
                    ArmarParametrosSoloFechas(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_ComprasPorUsuario_Ord_FechaDESC", "ComprasTotales_U_Desc");
                    break;
                case 31:
                    ArmarParametrosSoloFechas(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_UsuariosCreados_FechaASC", "U_Creados_Asc");
                    break;
                case 32:
                    ArmarParametrosSoloFechas(ref comando, fechaMinima, fechaMaxima);
                    tabla = ds.EjecutarProcedimientoAlmacenadoReporte(comando, "SP_UsuariosCreados_FechaDESC", "U_Creados_Desc");
                    break;
                default:
                    break;
            }
            return tabla;
        }

        private void ArmarParametrosSoloFechas(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Fecha_MIN", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_MAX", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;
        }

        private void ArmarParametrosFechasConUsuario(ref SqlCommand comando, DateTime fechaMinima, DateTime fechaMaxima, int usuario)
        {
            SqlParameter sqlParametros = new SqlParameter();
            sqlParametros = comando.Parameters.Add("@Usuario", SqlDbType.VarChar);
            sqlParametros.Value = usuario;
            sqlParametros = comando.Parameters.Add("@Fecha_MIN", SqlDbType.Date);
            sqlParametros.Value = fechaMinima;
            sqlParametros = comando.Parameters.Add("@Fecha_MAX", SqlDbType.Date);
            sqlParametros.Value = fechaMaxima;

        }

    }
}
