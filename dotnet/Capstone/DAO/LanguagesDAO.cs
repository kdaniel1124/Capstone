using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class LanguagesDAO : ILanguagesDAO
    {
        private readonly string connectionString;

        public LanguagesDAO(string connString)
        {
            connectionString = connString;
        }

        public List<Language> GetAllLanguages()
        {
            List<Language> results = new List<Language>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string sql = "SELECT language_id, language_name, highlight_js, active FROM supported_languages";

                SqlCommand cmd = new SqlCommand(sql, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Language language = new Language();

                    language.LanguageId = Convert.ToInt32(reader["language_id"]);
                    language.LanguageName = Convert.ToString(reader["language_name"]);
                    language.HighlightJs = Convert.ToString(reader["highlight_js"]);
                    language.Active = Convert.ToBoolean(reader["active"]);

                    results.Add(language);
                }
                return results;
            }
        }

        public void UpdateLanguage(Language updatedLanguage)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string sql = "UPDATE supported_languages " +
                    "SET language_name = @languageName, " +
                    "highlight_js = @highlightJs, " +
                    "active = @active " +
                    "WHERE language_id = @languageId";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@languageName", updatedLanguage.LanguageName);
                cmd.Parameters.AddWithValue("@highlightJs", updatedLanguage.HighlightJs);
                cmd.Parameters.AddWithValue("@active", updatedLanguage.Active);
                cmd.Parameters.AddWithValue("@languageId", updatedLanguage.LanguageId);

                cmd.ExecuteNonQuery();
            }
        }

    }
}
