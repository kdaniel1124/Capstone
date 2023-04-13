using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IExamplesDAO
    {
        List<Example> GetAllExamples();
        void AddExample(Example newExample);
        void UpdateExample(Example updatedExample);

        List<Example> GetFilteredExamples(string searchString);

    }
}
