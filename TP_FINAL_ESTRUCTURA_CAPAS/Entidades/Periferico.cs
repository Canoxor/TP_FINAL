using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Periferico
    {
        int codigo_Periferico;
        int codigo_TipoPerif;
        int codigo_Marca;
        String nombre;
        String descripcion;
        int stock;
        float precio_Unitario;
        String imagen_Url;

        public Periferico() { }

        public Periferico(int codigo_Periferico, int codigo_TipoPerif, int codigo_Marca, string nombre, string descripcion, int stock, float precio_Unitario, string imagen_Url)
        {
            this.Codigo_Periferico = codigo_Periferico;
            this.Codigo_TipoPerif = codigo_TipoPerif;
            this.Codigo_Marca = codigo_Marca;
            this.Nombre = nombre;
            this.Descripcion = descripcion;
            this.Stock = stock;
            this.Precio_Unitario = precio_Unitario;
            this.Imagen_Url = imagen_Url;
        }

        public int Codigo_Periferico { get => codigo_Periferico; set => codigo_Periferico = value; }
        public int Codigo_TipoPerif { get => codigo_TipoPerif; set => codigo_TipoPerif = value; }
        public int Codigo_Marca { get => codigo_Marca; set => codigo_Marca = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int Stock { get => stock; set => stock = value; }
        public float Precio_Unitario { get => precio_Unitario; set => precio_Unitario = value; }
        public string Imagen_Url { get => imagen_Url; set => imagen_Url = value; }
    }
}
