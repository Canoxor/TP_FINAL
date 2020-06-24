using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego
    {
        int codigo_Juego;
        int codigo_Genero;
        int codigo_PEGI;
        String nombre;
        String descripcion;
        int stock;
        float precio_Unitario;
        String imagen_Url;

        public Juego()
        {
        }

        public Juego(int codigo_Juego, int codigo_Genero, int codigo_PEGI, string nombre, string descripcion, int stock, float precio_Unitario, string imagen_Url)
        {
            this.codigo_Juego = codigo_Juego;
            this.codigo_Genero = codigo_Genero;
            this.codigo_PEGI = codigo_PEGI;
            this.nombre = nombre;
            this.descripcion = descripcion;
            this.stock = stock;
            this.precio_Unitario = precio_Unitario;
            this.imagen_Url = imagen_Url;
        }

        public int Codigo_Juego { get => codigo_Juego; set => codigo_Juego = value; }
        public int Codigo_Genero { get => codigo_Genero; set => codigo_Genero = value; }
        public int Codigo_PEGI { get => codigo_PEGI; set => codigo_PEGI = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int Stock { get => stock; set => stock = value; }
        public float Precio_Unitario { get => precio_Unitario; set => precio_Unitario = value; }
        public string Imagen_Url { get => imagen_Url; set => imagen_Url = value; }
    }
}
