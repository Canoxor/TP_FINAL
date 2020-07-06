﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetallePeriferico
    {
        int codigoFactura;
        int codigoPeriferico;
        int cantidad;
        float precioUnitario;

        public DetallePeriferico()
        {

        }

        public DetallePeriferico(int codigoFactura, int codigoPeriferico, int cantidad, float precioUnitario)
        {
            this.CodigoFactura = codigoFactura;
            this.CodigoPeriferico = codigoPeriferico;
            this.Cantidad = cantidad;
            this.PrecioUnitario = precioUnitario;
        }

        public int CodigoFactura { get => codigoFactura; set => codigoFactura = value; }
        public int CodigoPeriferico { get => codigoPeriferico; set => codigoPeriferico = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public float PrecioUnitario { get => precioUnitario; set => precioUnitario = value; }
    }
}
