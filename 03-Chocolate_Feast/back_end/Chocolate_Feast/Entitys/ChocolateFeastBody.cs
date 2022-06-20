using System.ComponentModel.DataAnnotations;

namespace Chocolate_Feast.Entitys
{
    /// <summary>
    /// Los atributos tiene como valores maximos 1000 y minimo 2, esto para poder evitar valores dificiles de manejar
    /// </summary>
    public class ChocolateFeastBody
    {

        /// <summary>
        /// la cantidad inicial de dinero de Bobby
        /// </summary>        
        [Range(2, 1000)]
        public int Money { get; set; }


        /// <summary>
        /// el costo de una barra de chocolate
        /// </summary>  
        [Range(2, 1000)]
        public int Price { get; set; }


        /// <summary>
        /// el número de envoltorios que puede entregar para obtener una barra gratis  Devoluciones
        /// </summary>
        [Range(2, 1000)]
        public int NumWrapper { get; set; }


        /// <summary>
        /// Contructor lleno
        /// </summary>
        public ChocolateFeastBody(int money, int price, int numWrapper){
            Money = money;  
            Price = price;
            NumWrapper = numWrapper;
        }
    }
}
