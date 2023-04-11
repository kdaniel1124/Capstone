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

                string sql = "INSERT INTO examples (title, code_language, code, attribution) " +
                    "VALUES(@title, @codeLanguage, @code, @attribution);";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", newExample.Title);
                cmd.Parameters.AddWithValue("@codeLanguage", newExample.CodeLanguage);
                cmd.Parameters.AddWithValue("@code", newExample.Code);
                cmd.Parameters.AddWithValue("@attribution", newExample.Attribution);

                cmd.ExecuteNonQuery();
            }
        }

        public void UpdateExample(Example updatedExample)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string sql = "UPDATE examples " +
                    "SET title = @title, " +
                    "code_language = @codeLanguage, " +
                    "code = @codeBody, " +
                    "attribution = @attribution " +
                    "WHERE example_id = @exampleId";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", updatedExample.Title);
                cmd.Parameters.AddWithValue("@codeLanguage", updatedExample.CodeLanguage);
                cmd.Parameters.AddWithValue("@codeBody", updatedExample.Code);
                cmd.Parameters.AddWithValue("@attribution", updatedExample.Attribution);
                cmd.Parameters.AddWithValue("@exampleId", updatedExample.ExampleId);

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
                    example.Attribution = Convert.ToString(reader["attribution"]);

                    results.Add(example);

                }
                return results;
            }
        }


    }
}
