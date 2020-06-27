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
    class NegocioJuego
    {
        /*
        public DataTable getTabla()
        {
            DatosJuego D_Juego = new DatosJuego();
            return D_Juego.obtenerTabla();
        }
        */

        public Juego ObtenerJuego(int id)
        {
            DatosJuego D_Juego = new DatosJuego();
            Juego E_Juego = new Juego();
            E_Juego.Codigo_Juego = id;
            return D_Juego.traerJuego(E_Juego);
        }

        public bool BajaJuego(int id)
        {
            //Validar id existente 
            DatosJuego D_Juego = new DatosJuego();
            Juego E_Juego = new Juego();
            E_Juego.Codigo_Juego = id;
            int Baja = D_Juego.eliminarJuego(E_Juego);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarJuego(int Codigo_Genero, int Codigo_PEGI, String Nombre, String Descripcion,int Stock,float Precio, String Imagen)
        {
            int cantFilas = 0;

            Juego E_Juego = new Juego();
            E_Juego.Codigo_Genero = Codigo_Genero;
            E_Juego.Codigo_PEGI = Codigo_PEGI;
            E_Juego.Nombre = Nombre;
            E_Juego.Descripcion = Descripcion;
            E_Juego.Stock = Stock;
            E_Juego.Precio_Unitario = Precio;
            E_Juego.Imagen_Url = Imagen;

            DatosJuego D_Juego = new DatosJuego();
            if (D_Juego.existeJuego(E_Juego) == false)
            {
                cantFilas = D_Juego.agregarJuego(E_Juego);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
