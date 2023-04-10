﻿using Capstone.DAO;
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
    }
}
