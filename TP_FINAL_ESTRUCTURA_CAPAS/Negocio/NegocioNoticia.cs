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
        protected DatosNoticia D_Noticia = new DatosNoticia();
        protected DatosJuego D_Juego = new DatosJuego();
        protected Noticia E_Noticia = new Noticia();

        public Noticia ObtenerNoticia(int id)
        {
            return D_Noticia.traerNoticia(id);
        }

        public bool estaActivo(Noticia n)
        {
            return D_Noticia.estaActivo(n);
        }

        public bool activarNoticia(Noticia n)
        {
            int activo = D_Noticia.activarNoticia(n);
            if (activo > 0)
                return true;
            else
                return false;
        }

        public bool existeNoticia(Noticia n)
        {
            return D_Noticia.existeNoticia(n);
        }

        public int getUltimoID()
        {
            return D_Noticia.ultimoId();
        }

        public DataTable tablaJuegos()
        {
            return D_Juego.traerJuegos();
        }

        public bool BajaNoticia(int id)
        {
            E_Noticia.Codigo_Noticia = id;
            int Baja = D_Noticia.eliminarNoticia(E_Noticia);
            if (Baja > 0)
                return true;
            else
                return false;
        }

        public bool agregarNoticia(Noticia noticia)
        {
            int cantFilas = 0;
            
            if (D_Noticia.existeNoticia(noticia) == false)
            {
                cantFilas = D_Noticia.agregarNoticia(noticia);
            }

            if (cantFilas > 0)
                return true;
            else
                return false;
        }

        public bool editarNoticia(Noticia n)
        {
            int cantidadFilas = D_Noticia.editarNoticia(n);
            if (cantidadFilas > 0)
                return true;
            else
                return false;
        }
    }
}
