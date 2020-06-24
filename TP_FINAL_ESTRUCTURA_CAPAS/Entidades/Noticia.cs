using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Noticia
    {
        int codigo_Noticia;
        int codigo_Juego;
        String nombre;
        String descripcion;
        String imagen_Url;

        public Noticia()
        {
        }

        public Noticia(int codigo_Noticia, int codigo_Juego, string nombre, string descripcion, string imagen_Url)
        {
            this.Codigo_Noticia = codigo_Noticia;
            this.Codigo_Juego = codigo_Juego;
            this.Nombre = nombre;
            this.Descripcion = descripcion;
            this.Imagen_Url = imagen_Url;
        }

        public int Codigo_Noticia { get => codigo_Noticia; set => codigo_Noticia = value; }
        public int Codigo_Juego { get => codigo_Juego; set => codigo_Juego = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string Imagen_Url { get => imagen_Url; set => imagen_Url = value; }
    }
}
