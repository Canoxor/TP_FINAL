using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleFacturaJuego
    {
        int codigoFactura;
        int codigoJuego;
        int cantidad;
        float precioUnitario;

        public DetalleFacturaJuego()
        {

        }

        public DetalleFacturaJuego(int codigoFactura, int codigoJuego, int cantidad, float precioUnitario)
        {
            this.CodigoFactura = codigoFactura;
            this.CodigoJuego = codigoJuego;
            this.Cantidad = cantidad;
            this.PrecioUnitario = precioUnitario;
        }

        public int CodigoFactura { get => codigoFactura; set => codigoFactura = value; }
        public int CodigoJuego { get => codigoJuego; set => codigoJuego = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public float PrecioUnitario { get => precioUnitario; set => precioUnitario = value; }
    }
}
