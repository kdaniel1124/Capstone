using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface ILanguagesDAO
    {
        List<Language> GetAllLanguages();
        void UpdateLanguage(Language updatedLanguage);
    }
}
