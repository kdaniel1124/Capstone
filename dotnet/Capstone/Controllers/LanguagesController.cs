using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("languages")]
    [ApiController]
    public class LanguagesController : Controller
    {
        private readonly ILanguagesDAO languagesDAO;

        public LanguagesController(ILanguagesDAO languages)
        {
            this.languagesDAO = languages;
        }

        [HttpGet()]
        public ActionResult GetAllLanguages()
        {
            List<Language> allLanguages = languagesDAO.GetAllLanguages();

            return Ok(allLanguages);
        }

        [HttpPut()]
        public ActionResult UpdateLanguage(Language updatedLanguage)
        {
            languagesDAO.UpdateLanguage(updatedLanguage);

            return Ok();
        }
    }
}
