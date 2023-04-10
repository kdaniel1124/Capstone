using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class ExamplesDAO : IExamplesDAO
    {
        private readonly string connectionString;

        public ExamplesDAO(string connString)
        {
            connectionString = connString;
        }

        public void AddExample(Example newExample)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string sql = "INSERT INTO examples (title, code_language, code) " +
                    "VALUES(@title, @codeLanguage, @code);";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", newExample.Title);
                cmd.Parameters.AddWithValue("@codeLanguage", newExample.CodeLanguage);
                cmd.Parameters.AddWithValue("@code", newExample.Code);

                cmd.ExecuteNonQuery();
            }
        }
        public List<Example> GetAllExamples()
        {
            List<Example> results = new List<Example>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                const string sql = "SELECT * FROM examples";

                SqlCommand cmd = new SqlCommand(sql, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Example example = new Example();

                    example.Title = Convert.ToString(reader["title"]);
                    example.CodeLanguage = Convert.ToString(reader["code_language"]);
                    example.Code = Convert.ToString(reader["code"]);
                    example.ExampleId = Convert.ToInt32(reader["example_id"]);

                    results.Add(example);

                }
                return results;
            }
        }


    }
}
