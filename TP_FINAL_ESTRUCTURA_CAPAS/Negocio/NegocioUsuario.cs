using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;
using Datos;

namespace Negocio
{
    class NegocioUsuario
    {
        public Usuario ObtenerUsuario(int id)
        {
            DatosUsuario D_Usuario = new DatosUsuario();
            Usuario E_Usuario = new Usuario();
            E_Usuario.Codigo_Usuario = id;
            return D_Usuario.ObtenerUsuario(E_Usuario);
        }

        public Usuario ObtenerUsuarioLogin(String Email, String Contraseña)
        {
            DatosUsuario D_Usuario = new DatosUsuario();
            Usuario E_Usuario = new Usuario();
            E_Usuario.Email = Email;
            E_Usuario.Contraseña = Contraseña;
            return D_Usuario.getUsuarioLogin(E_Usuario);
        }

        public bool BajaUsuario(int id)
        {
            //Validar id existente 
            DatosUsuario D_Usuario = new DatosUsuario();
            Usuario E_Usuario = new Usuario();
            E_Usuario.Codigo_Usuario = id;
            int Baja = D_Usuario.eliminarUsuario(E_Usuario);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarUsuario(String Email, String Contraseña,int Dni, String Nombre, String Apellido, String Direccion = "", int Telefono = -1, bool Admin = false)
        {
            int cantFilas = 0;

            Usuario E_Usuario = new Usuario();
            
            E_Usuario.Dni = Dni;
            E_Usuario.Nombre = Nombre;
            E_Usuario.Apellido = Apellido;
            E_Usuario.Direccion = Direccion;
            E_Usuario.Telefono = Telefono;
            E_Usuario.Admin = Admin;
            E_Usuario.Email = Email;
            E_Usuario.Contraseña = Contraseña;

            DatosUsuario D_Usuario = new DatosUsuario();
            if (D_Usuario.existeDniUsuario(E_Usuario) == false && D_Usuario.existeEmailUsuario(E_Usuario) == false && D_Usuario.existeUsuario(E_Usuario) == false)
            {
                cantFilas = D_Usuario.agregarUsuario(E_Usuario);
            }
            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
