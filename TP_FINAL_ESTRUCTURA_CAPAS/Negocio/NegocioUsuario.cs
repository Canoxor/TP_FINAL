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
        protected DatosUsuario D_Usuario = new DatosUsuario();
        protected Usuario E_Usuario = new Usuario();

        public Usuario ObtenerUsuarioLogin(String Email, String Contraseña)
        {
            E_Usuario.Email = Email;
            E_Usuario.Contraseña = Contraseña;
            return D_Usuario.getUsuarioLogin(E_Usuario);
        }

        public bool editarUsuario(Usuario u)
        {
            int seEdito = D_Usuario.editarUsuario(u);
            if(seEdito > 0)      
                return true;
            else
                return false;
        }

        public bool ExisteUsuario(String Email, String Contraseña)
        {
            return D_Usuario.existeUsuario(Email, Contraseña);
        }

        public bool avtivarUsuario(Usuario u)
        {
            int activado = D_Usuario.activarUsuario(u);
            if (activado > 0)
                return true;
            else
                return false;
        }

        public DataTable getTablaUsuarios()
        {
            return D_Usuario.getTablaUsuarios();
        }

        public Usuario getUsuarioById(int id)
        {
            return D_Usuario.getUsuarioByID(id);
        }

        public bool BajaUsuario(int id)
        {
            E_Usuario.Codigo_Usuario = id;
            int Baja = D_Usuario.eliminarUsuario(E_Usuario);
            if (Baja > 0)
                return true;
            else
                return false;
        }

        public bool agregarUsuario(Usuario u)
        {
            int cantFilas = 0;

            if (!D_Usuario.existeUsuario(u.Email, u.Contraseña))
            {
                cantFilas = D_Usuario.agregarUsuario(u);
            }
            if (cantFilas > 0)
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
