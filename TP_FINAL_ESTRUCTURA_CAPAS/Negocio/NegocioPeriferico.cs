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
    public class NegocioPeriferico
    {
        protected DatosPeriferico D_Periferico = new DatosPeriferico();
        protected Periferico E_Periferico = new Periferico();

        public Periferico ObtenerPeriferico(int id)
        {
            E_Periferico.Codigo_Periferico = id;
            return D_Periferico.traerPeriferico(E_Periferico);
        }

        public bool BajaPeriferico(int id)
        {
            //Validar id existente 
            E_Periferico.Codigo_Periferico = id;
            int Baja = D_Periferico.eliminarPeriferico(E_Periferico);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarPeriferico(Periferico periferico)
        {
            int cantFilas = 0;

            if (D_Periferico.existePeriferico(periferico) == false)
            {
                cantFilas = D_Periferico.agregarPeriferico(E_Periferico);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool editarPeriferico(Periferico p)
        {
            int seEdito = 0;
            seEdito = D_Periferico.editarPeriferico(p);
            if (seEdito != 0)
                return true;
            else
                return false;
        }

    }
}
