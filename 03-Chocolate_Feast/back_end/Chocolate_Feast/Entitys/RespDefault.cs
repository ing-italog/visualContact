using System.ComponentModel.DataAnnotations;

namespace Chocolate_Feast.Entitys
{
    /// <summary>
    /// Esta clase permite envíar un status y un mensaje personalizado
    /// </summary>
    public class RespDefault
    {
        /// <summary>
        /// status de la respuesta
        /// </summary>
        [Required]
        public bool Status { get; set; }


        /// <summary>
        /// mensaje 
        /// </summary>
        [Required]
        public string? Message { get; set; }
    }
}
