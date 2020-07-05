using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;
using System.Data.SqlClient;

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

        public bool estaActivo(Periferico p)
        {
            return D_Periferico.estaActivo(p);
        }

        public bool activarPeriferico(Periferico p)
        {
            int activo = D_Periferico.activarrPeriferico(p);
            if (activo > 0)
                return true;
            else
                return false;
        }

        public int getUltimoID()
        {
            return D_Periferico.ultimoId();
        }
        public DataTable tablaMarcas()
        {
            return D_Periferico.traerMarcas();
        }

        public DataTable tablaTipoPerifericos()
        {
            return D_Periferico.traerTipoPeriferico();
        }

        public bool BajaPeriferico(int id)
        {
            //Validar id existente 
            E_Periferico.Codigo_Periferico = id;
            int Baja = D_Periferico.eliminarPeriferico(E_Periferico);
            if (Baja > 0)
                return true;
            else
                return false;
        }

        public bool existePeriferico(Periferico p)
        {
            return D_Periferico.existePeriferico(p);
        }

        public bool agregarPeriferico(Periferico periferico)
        {
            int cantFilas = 0;

            if (D_Periferico.existePeriferico(periferico) == false)
            {
                cantFilas = D_Periferico.agregarPeriferico(periferico);
            }

            if (cantFilas > 0)
                return true;
            else
                return false;
        }

        public bool editarPeriferico(Periferico p)
        {
            int seEdito = 0;
            seEdito = D_Periferico.editarPeriferico(p);
            if (seEdito > 0)
                return true;
            else
                return false;
        }

    }
}
