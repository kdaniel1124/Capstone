using Capstone.Models;
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
