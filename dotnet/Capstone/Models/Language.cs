using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class Language
    {
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string HighlightJs { get; set; }
        public bool Active { get; set; }
    }
}
