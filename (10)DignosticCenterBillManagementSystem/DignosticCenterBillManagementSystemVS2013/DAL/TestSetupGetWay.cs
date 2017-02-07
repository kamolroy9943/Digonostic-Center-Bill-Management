using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.Model;
using DignosticCenterBillManagementSystemVS2013.Model.ViewModel;

namespace DignosticCenterBillManagementSystemVS2013.DAL
{
    public class TestSetupGetWay
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;

        public int SaveTestInfo(TestClass aTestClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO t_Tests (Name,Fee,TypeNameId) VALUES ('" + aTestClass.Name + "','" +
                           aTestClass.Fee +
                           "','" + aTestClass.TypeNameId + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowsAffected;
        }

        public List<TestClass> GetAllTestInfo()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_Tests ";
            SqlCommand command = new SqlCommand(query, connection);
            List<TestClass> aList = new List<TestClass>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TestClass aTestClass = new TestClass();
                    aTestClass.Id = Convert.ToInt32(reader["Id"].ToString());
                    aTestClass.Name = reader["Name"].ToString();
                    aTestClass.Fee = Convert.ToDouble(reader["Fee"].ToString());
                    aTestClass.TypeNameId = Convert.ToInt32(reader["TypeNameId"].ToString());
                    aList.Add(aTestClass);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }

        public TestClass GetAllInfoByTestName(string testname)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_Tests WHERE Name='" + testname + "'";
            SqlCommand command = new SqlCommand(query, connection);
            TestClass aTestClass = null;
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    aTestClass = new TestClass();
                    aTestClass.Id = Convert.ToInt32(reader["Id"].ToString());
                    aTestClass.Name = reader["Name"].ToString();
                    aTestClass.Fee = Convert.ToDouble(reader["Fee"].ToString());
                    aTestClass.TypeNameId = Convert.ToInt32(reader["TypeNameId"].ToString());
                }
                reader.Close();
            }
            connection.Close();
            return aTestClass;
        }


        public TestClass GetAllInfoByTestId(string testId)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_Tests WHERE Id='" + testId + "'";
            SqlCommand command = new SqlCommand(query, connection);
            TestClass aTestClass = null;
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    aTestClass = new TestClass();
                    aTestClass.Id = Convert.ToInt32(reader["Id"].ToString());
                    aTestClass.Name = reader["Name"].ToString();
                    aTestClass.Fee = Convert.ToDouble(reader["Fee"].ToString());
                    aTestClass.TypeNameId = Convert.ToInt32(reader["TypeNameId"].ToString());
                }
                reader.Close();
            }
            connection.Close();
            return aTestClass;
        }
        public List<ViewTestAndTest_Type> GetAllTestInfoWithType()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM TestAndType ";
            SqlCommand command = new SqlCommand(query, connection);
            List<ViewTestAndTest_Type> aList = new List<ViewTestAndTest_Type>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ViewTestAndTest_Type aViewTestAndTestType = new ViewTestAndTest_Type();
                    aViewTestAndTestType.TestName = reader["TestName"].ToString();
                    aViewTestAndTestType.Fee = Convert.ToDouble(reader["Fee"].ToString());
                    aViewTestAndTestType.TypeName = reader["TypeName"].ToString();
                    aViewTestAndTestType.TypeNameId = Convert.ToInt32((reader["TypeNameId"].ToString()));
                    aViewTestAndTestType.TypeId = Convert.ToInt32(reader["TypeId"].ToString());
                    aList.Add(aViewTestAndTestType);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }

    }
}