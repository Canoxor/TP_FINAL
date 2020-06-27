using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;
using Datos;
using System.Diagnostics.Eventing.Reader;

namespace Negocio
{
    public class NegocioUsuario
    {
        private DatosUsuario D_Usuario = new DatosUsuario();

        public Usuario ObtenerUsuarioLogin(String Email, String Contraseña)
        {
            Usuario E_Usuario = new Usuario();
            E_Usuario.Email = Email;
            E_Usuario.Contraseña = Contraseña;
            return D_Usuario.getUsuarioLogin(E_Usuario);
        }

        public bool ExisteUsuario(String Email, String Contraseña)
        {
            return D_Usuario.existeUsuario(Email, Contraseña);
        }

        public bool BajaUsuario(int id)
        {
            //Validar id existente 
            Usuario E_Usuario = new Usuario();
            E_Usuario.Codigo_Usuario = id;
            int Baja = D_Usuario.eliminarUsuario(E_Usuario);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarUsuario(String Email, String Contraseña,int Dni, String Nombre, String Apellido)
        {
            int cantFilas = 0;

            Usuario E_Usuario = new Usuario();
            
            E_Usuario.Dni = Dni;
            E_Usuario.Nombre = Nombre;
            E_Usuario.Apellido = Apellido;
            E_Usuario.Direccion = "";
            E_Usuario.Telefono = -1;
            E_Usuario.Admin = false;
            E_Usuario.Email = Email;
            E_Usuario.Contraseña = Contraseña;

            if (!D_Usuario.existeUsuario(E_Usuario.Email, E_Usuario.Contraseña))
            {
                cantFilas = D_Usuario.agregarUsuario(E_Usuario);
            }
            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool verificarEmail(String email)
        {
            return D_Usuario.existeEmailUsuario(email);

        }

        public bool verificarDni(int dni)
        {
            return D_Usuario.existeDniUsuario(dni);
        }

    }
}
