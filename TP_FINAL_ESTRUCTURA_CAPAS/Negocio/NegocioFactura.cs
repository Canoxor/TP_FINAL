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

        public bool agregarFactura(Factura f)
        {
            int seAgrego = df.agregarFactura(f);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

        public bool agregarDetalleJuego(DetalleJuego dj)
        {
            int seAgrego = df.agregarDetalleJuego(dj);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

        public bool agregarDetallePeriferico(DetallePeriferico dp)
        {
            int seAgrego = df.agregarDetallePeriferico(dp);
            if (seAgrego > 0)
                return true;
            else
                return false;
        } 

    }
}
