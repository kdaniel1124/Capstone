using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExamplesDAO
    {
        List<Example> GetAllExamples();
    }
}
