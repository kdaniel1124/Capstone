﻿using Capstone.Models;
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

                string sql = "INSERT INTO examples (title, code_language, code, attribution_author, attribution_url, approved) " +
                    "VALUES(@title, @codeLanguage, @code, @attributionAuthor, @attributionUrl, @approved);";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", newExample.Title);
                cmd.Parameters.AddWithValue("@codeLanguage", newExample.CodeLanguage);
                cmd.Parameters.AddWithValue("@code", newExample.Code);
                cmd.Parameters.AddWithValue("@attributionAuthor", newExample.AttributionAuthor);
                cmd.Parameters.AddWithValue("@attributionUrl", newExample.AttributionUrl);
                cmd.Parameters.AddWithValue("@approved", newExample.Approved);

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
                    "attribution_author = @attributionAuthor, " +
                    "attribution_url = @attributionUrl, " +
                    "approved = @approved " +
                    "WHERE example_id = @exampleId";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", updatedExample.Title);
                cmd.Parameters.AddWithValue("@codeLanguage", updatedExample.CodeLanguage);
                cmd.Parameters.AddWithValue("@codeBody", updatedExample.Code);
                cmd.Parameters.AddWithValue("@attributionAuthor", updatedExample.AttributionAuthor);
                cmd.Parameters.AddWithValue("@attributionUrl", updatedExample.AttributionUrl);
                cmd.Parameters.AddWithValue("@exampleId", updatedExample.ExampleId);
                cmd.Parameters.AddWithValue("@approved", updatedExample.Approved);

                cmd.ExecuteNonQuery();
            }
        }
        public List<Example> GetAllExamples()
        {
            List<Example> results = new List<Example>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                const string sql = "SELECT example_id, title, code_language, code, attribution_author, attribution_url, approved FROM examples";

                SqlCommand cmd = new SqlCommand(sql, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Example example = new Example();

                    example.Title = Convert.ToString(reader["title"]);
                    example.CodeLanguage = Convert.ToString(reader["code_language"]);
                    example.Code = Convert.ToString(reader["code"]);
                    example.ExampleId = Convert.ToInt32(reader["example_id"]);
                    example.AttributionAuthor = Convert.ToString(reader["attribution_author"]);
                    example.AttributionUrl = Convert.ToString(reader["attribution_url"]);
                    example.Approved = Convert.ToInt32(reader["approved"]);

                    results.Add(example);

                }
                return results;
            }
        }
        public List<Example> GetFilteredExamples(string searchString)
        {
            List<Example> results = new List<Example>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string sql = "SELECT example_id, title, code_language, code, attribution_author, attribution_url, approved " +
                    "FROM examples " +
                    "WHERE code_language LIKE @searchString OR title LIKE @searchString OR code LIKE @searchString OR attribution_author LIKE @searchString ";

                SqlCommand cmd = new SqlCommand(sql, conn);

                searchString = "%" + searchString + "%";

                cmd.Parameters.AddWithValue("@searchString", searchString);
                
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Example example = new Example();

                    example.Title = Convert.ToString(reader["title"]);
                    example.CodeLanguage = Convert.ToString(reader["code_language"]);
                    example.Code = Convert.ToString(reader["code"]);
                    example.ExampleId = Convert.ToInt32(reader["example_id"]);
                    example.AttributionAuthor = Convert.ToString(reader["attribution_author"]);
                    example.AttributionUrl = Convert.ToString(reader["attribution_url"]);
                    example.Approved = Convert.ToInt32(reader["approved"]);

                    results.Add(example);
                }
                return results;
            }
        }


    }
}
