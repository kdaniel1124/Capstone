using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("examples")]
    [ApiController]
    public class ExamplesController : Controller
    {
        private readonly IExamplesDAO examplesDAO;


        public ExamplesController(IExamplesDAO examples)
        {
            this.examplesDAO = examples;
        }

        [HttpGet()]
        public ActionResult GetAllExamples()
        {
            List<Example> allExamples = examplesDAO.GetAllExamples();

            return Ok(allExamples);
        }

        [HttpPost()]
        public ActionResult AddExample(Example newExample)
        {

            examplesDAO.AddExample(newExample);

            return Ok();
        }
        [HttpPut()]
        public ActionResult UpdateExample(Example updatedExample)
        {

            examplesDAO.UpdateExample(updatedExample);

            return Ok();
        }
        [HttpGet("filtered")]
        public ActionResult GetFilteredExamples(string searchString)
        {
            List<Example> filteredExamples = examplesDAO.GetFilteredExamples(searchString);

            return Ok(filteredExamples);
        }
    }
}
