using System;
using System.Collections.Generic;
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
