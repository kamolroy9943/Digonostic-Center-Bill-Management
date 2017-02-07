using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.DAL
{
    public class TypeSetupGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;
        public int SaveTypeName(TypeClass aTypeClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO t_Types (Name) VALUES ('" + aTypeClass.Name + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowsAffected;
        }

        public List<TypeClass> GetAllTypeName()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_Types ";
            SqlCommand command = new SqlCommand(query, connection);
            List<TypeClass> aList = new List<TypeClass>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TypeClass aTypeClass = new TypeClass();
                    aTypeClass.Id = Convert.ToInt32(reader["Id"].ToString());
                    aTypeClass.Name = reader["Name"].ToString();
                    aList.Add(aTypeClass);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }

        public TypeClass GetAllInfoByTypeName(string typename)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_Types WHERE Name='" + typename + "'";
            SqlCommand command = new SqlCommand(query, connection);
            TypeClass aTypeClass = null;
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    aTypeClass = new TypeClass();
                    aTypeClass.Id = Convert.ToInt32(reader["Id"].ToString());
                    aTypeClass.Name = reader["Name"].ToString();
                }
                reader.Close();
            }
            connection.Close();
            return aTypeClass;
        }
    }
}