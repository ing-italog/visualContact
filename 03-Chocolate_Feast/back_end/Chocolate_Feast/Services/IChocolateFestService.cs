using Chocolate_Feast.Entitys;

namespace Chocolate_Feast.Services
{
    /// <summary>
    /// Interfaz para implementar el método que da la solución al servicio
    /// </summary>
    public interface IChocolateFestService
    {
        /// <summary>
        /// /// <summary>
        /// Solución al ejercicio
        /// </summary>
        /// <param name="body"></param>
        /// <returns></returns>
        public int Solution(ChocolateFeastBody body);
    }
}
