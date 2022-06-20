using Chocolate_Feast.Entitys;

namespace Chocolate_Feast.Services
{
    /// <summary>
    /// servicio que contiene el método que la solución al ejercicio, implementa la interfaz IChocolateFestService
    /// </summary>
    public class ImpChocolateFestService : IChocolateFestService
    {
        /// <summary>
        /// Solución al ejerciciO
        /// </summary>
        /// <param name="body"></param>
        /// <returns>int RESPUESTA</returns>
        public int Solution(ChocolateFeastBody body)
        {


            int countRec(int choc, int wrap)
            {
                // Si el número de chocolates es menor que
                // número de envoltorios requeridos.
                if (choc < wrap)
                    return 0;

                // Podemos obtener inmediatamente newChoc usando
                // envoltorios de chocolate.
                int newChoc = choc / wrap;

                // Ahora tenemos "newChoc + choc%wrap"
                // envoltorios.
                return newChoc + countRec(newChoc +
                                choc % wrap, wrap);
            }

            // Devuelve el número máximo de chocolates
            // podemos comer con dinero dado, precio de
            // chocolate y número de envoltorios
            // requerido para obtener un chocolate.
            int countMaxChoco(int money,
                                int price, int wrap)
            {


                // Podemos comprar directamente por debajo del número de
                // bombones
                int choc = money / price;


                // countRec devuelve el número de chocolates
                // podemos tener de un número dado de
                // bombones
                return choc + countRec(choc, wrap);
            }
            int resp = countMaxChoco(body.Money, body.Price, body.NumWrapper);
            return resp;

        }
    }
}
