using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class FacturaProductos
    {

        int codigo_Factura;
        int codigo_Usuario;
        int codigo_CodDescuento;
        float monto_Total;
        DateTime fecha;

        public FacturaProductos() { }

        public FacturaProductos(int codigo_Factura, int codigo_Usuario, int codigo_CodDescuento, float monto_Total, DateTime fecha)
        {
            this.Codigo_Factura = codigo_Factura;
            this.Codigo_Usuario = codigo_Usuario;
            this.Codigo_CodDescuento = codigo_CodDescuento;
            this.Monto_Total = monto_Total;
            this.Fecha = fecha;
        }

        public int Codigo_Factura { get => codigo_Factura; set => codigo_Factura = value; }
        public int Codigo_Usuario { get => codigo_Usuario; set => codigo_Usuario = value; }
        public int Codigo_CodDescuento { get => codigo_CodDescuento; set => codigo_CodDescuento = value; }
        public float Monto_Total { get => monto_Total; set => monto_Total = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
    }
}
