using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioFactura
    {
        protected DatosFactura df = new DatosFactura();

        public bool agregarFactura(FacturaProductos f)
        {
            int seAgrego = df.agregarFactura(f);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

        public DataTable traerFacturas()
        {
            return df.traerFacturas();
        }

        public DataTable traerFacturaFiltro(int opc)
        {
            return df.traerFacturaFiltro(opc);
        }

        public DataTable traerFacturasUsuario(int id)
        {
            return df.traerFacturasUsuario(id);
        }

        public DataTable traerDetalleFacturaJuegosUsuario(int id)
        {
            return df.traerDetalleFacturaJuegosUsuario(id);
        }

        public DataTable traerDetalleFacturaPerifericosUsuario(int id)
        {
            return df.traerDetalleFacturaPerifericosUsuario(id);
        }

        public bool agregarDetalleJuego(DetalleFacturaJuego dj)
        {
            int seAgrego = df.agregarDetalleJuego(dj);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

        public bool agregarDetallePeriferico(DetalleFacturaPeriferico dp)
        {
            int seAgrego = df.agregarDetallePeriferico(dp);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

    }
}
