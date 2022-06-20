using Chocolate_Feast.Entitys;
using Chocolate_Feast.Services;
using Microsoft.AspNetCore.Mvc;

namespace Chocolate_Feast.Controllers
{
    /// <summary>
    /// Retorna la respuesta al ejercicio Chocolate Feast HackerRank, he imprime en la consola el log de la petición y la respuesta.
    /// </summary>
    [ApiController]
    [Route("api/chocolate_feast")]
    public class ChocolateFeastController: ControllerBase    
    {
        private readonly ILogger<ChocolateFeastController> _logger;
        private readonly ImpChocolateFestService _service;

        private RespDefault respDefault = new RespDefault();

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="logger"></param>
        /// <param name="service"></param>
        public ChocolateFeastController(ILogger<ChocolateFeastController> logger, ImpChocolateFestService service)
        {
            _logger = logger;
            _service = service;
        }

        /// <summary>
        /// El metodo Get, retorna la solución, para esto recibe en el cuerpo de la petición un objeto de tipo ChocolateFeastBody, se valida si la respuesta es -1
        /// en caso de ser así quiere decir que ocurrio un error
        /// </summary>
        /// <param name="body">ChocolateFeastBody</param>
        /// <returns>ActionResult STATUS</returns>
        [HttpPost]
        public ActionResult Get([FromBody] ChocolateFeastBody body)
        {
            ///respuesta a la petición
            var resp = _service.Solution(body);

            respDefault.Status = true;
            respDefault.Message = "success";

            _logger.LogInformation($"Recibed these values (initial money = {body.Money}, candye's price = {body.Price}, " +
                                   $"number of wrappers needed for change = {body.NumWrapper})" +
                                   $" and the response was = {resp}");

            return Ok(new { respDefault, response = resp });
        }
    }
}
