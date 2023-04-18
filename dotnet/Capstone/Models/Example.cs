using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class Example
    {
        public string CodeLanguage { get; set; }

        public string Title { get; set; }

        public string Code { get; set; }

        public int ExampleId { get; set; }

        public string AttributionAuthor { get; set; } 
        public string AttributionUrl { get; set; }
        public int Approved { get; set; } = 2;

    }
}
