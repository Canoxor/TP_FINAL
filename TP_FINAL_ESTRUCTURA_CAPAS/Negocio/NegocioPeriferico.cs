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
    class NegocioPeriferico
    {
        public Periferico ObtenerPeriferico(int id)
        {
            DatosPeriferico D_Periferico = new DatosPeriferico();
            Periferico E_Periferico = new Periferico();
            E_Periferico.Codigo_Periferico = id;
            return D_Periferico.traerPeriferico(E_Periferico);
        }

        public bool BajaPeriferico(int id)
        {
            //Validar id existente 
            DatosPeriferico D_Periferico = new DatosPeriferico();
            Periferico E_Periferico = new Periferico();
            E_Periferico.Codigo_Periferico = id;
            int Baja = D_Periferico.eliminarPeriferico(E_Periferico);
            if (Baja == 1)
                return true;
            else
                return false;
        }

        public bool agregarPeriferico(int Codigo_TipoPerif,int Codigo_Marca,String Nombre,String Descripcion,int Stock,float Precio,String Imagen)
        {
            int cantFilas = 0;

            Periferico E_Periferico = new Periferico();
            E_Periferico.Codigo_TipoPerif = Codigo_TipoPerif;
            E_Periferico.Codigo_Marca = Codigo_Marca;
            E_Periferico.Nombre = Nombre;
            E_Periferico.Descripcion = Descripcion;
            E_Periferico.Stock = Stock;
            E_Periferico.Precio_Unitario = Precio;
            E_Periferico.Imagen_Url = Imagen;

            DatosPeriferico D_Periferico = new DatosPeriferico();
            if (D_Periferico.existePeriferico(E_Periferico) == false)
            {
                cantFilas = D_Periferico.agregarPeriferico(E_Periferico);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
