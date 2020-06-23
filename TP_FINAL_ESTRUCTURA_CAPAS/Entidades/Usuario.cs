using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Usuario
    {

        int codigo_Usuario;
        int dni;
        String nombre;
        String apellido;
        String direccion;
        int telefono;
        bool admin;
        String contraseña;

        public Usuario() { }

        public Usuario(int codigo_Usuario, int dni, string nombre, string apellido, string direccion, int telefono, bool admin, string contraseña)
        {
            this.Codigo_Usuario = codigo_Usuario;
            this.Dni = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Direccion = direccion;
            this.Telefono = telefono;
            this.Admin = admin;
            this.Contraseña = contraseña;
        }

        public int Codigo_Usuario { get => codigo_Usuario; set => codigo_Usuario = value; }
        public int Dni { get => dni; set => dni = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public int Telefono { get => telefono; set => telefono = value; }
        public bool Admin { get => admin; set => admin = value; }
        public string Contraseña { get => contraseña; set => contraseña = value; }
    }
}
