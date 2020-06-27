using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;

namespace Negocio
{
    public class NegocioNoticia
    {

        public bool BajaNoticia(int id)
        {
            //Validar id existente 
            DatosNoticia D_Noticia = new DatosNoticia();
            Noticia E_Noticia = new Noticia();
            E_Noticia.Codigo_Juego = id;
            int Baja = D_Noticia.eliminarNoticia(E_Noticia);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarNoticia(int Codigo_Juego,String Nombre, String Descripcion, String Imagen)
        {
            int cantFilas = 0;

            Noticia E_Noticia = new Noticia();
            E_Noticia.Codigo_Juego = Codigo_Juego;
            E_Noticia.Nombre = Nombre;
            E_Noticia.Descripcion = Descripcion;
            E_Noticia.Imagen_Url = Imagen;

            DatosNoticia D_Noticia = new DatosNoticia();
            if (D_Noticia.existeNoticia(E_Noticia) == false)
            {
                cantFilas = D_Noticia.agregarNoticia(E_Noticia);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
