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
    public class NegocioJuego
    {
        protected DatosJuego D_Juego = new DatosJuego();
        protected Juego Juego = new Juego();

        public Juego ObtenerJuego(int id)
        {
            Juego.Codigo_Juego = id;
            return D_Juego.traerJuego(Juego);
        }

        public bool existeJuego(Juego j)
        {
            return D_Juego.existeJuego(j);
        }

        public int getUltimoID()
        {
            return D_Juego.ultimoId();
        }

        public DataTable StockOrdenadoJuegos(int opc)
        {
            return D_Juego.reporteVerificarStockOrdenado(opc);
        }

        public DataTable porcentajeGenerosVendidos(int opc, DateTime fechaMinima, DateTime fechaMaxima, int codGenero)
        {
            return D_Juego.reportePorcentajeGeneroVendido(opc, fechaMinima, fechaMaxima, codGenero);
        }

        public DataTable tablaPegi()
        {
            return D_Juego.traerPegi();
        }

        public DataTable tablaGenero()
        {
            return D_Juego.traerGeneros();
        }

        public bool BajaJuego(int id)
        {
            Juego.Codigo_Juego = id;
            int Baja = D_Juego.eliminarJuego(Juego);
            if (Baja > 0)
                return true;
            else
                return false;
        }


        public bool agregarJuego(Juego juego)
        {
            int cantFilas = 0;

            if (D_Juego.existeJuego(juego) == false)
            {
                cantFilas = D_Juego.agregarJuego(juego);
            }

            if (cantFilas > 0)
                return true;
            else
                return false;
        }

        public bool editarJuego(Juego j)
        {
            int seEdito = 0;
            seEdito = D_Juego.editarJuego(j);
            if (seEdito > 0)
                return true;
            else
                return false;
        }

        public bool estaActivo(Juego j)
        {
            return D_Juego.estaActivo(j);
        }

        public bool activarJuego(Juego j)
        {
            int activo = D_Juego.activarJuego(j);
            if (activo > 0)
                return true;
            else
                return false;
        }

    }
}
