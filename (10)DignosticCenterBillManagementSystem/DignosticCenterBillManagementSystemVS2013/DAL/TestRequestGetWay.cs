using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.DAL
{
    public class TestRequestGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;

        public int SaveTestGridview(TestClass adropClass, TestRequestClass aTestRequestClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "insert into t_testgridview(MobileNogridview,TestName,Fee) values ('" +
                           aTestRequestClass.MobileNo +
                           "','" + adropClass.Name + "','" + aTestRequestClass.Fee + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowsAffecte = command.ExecuteNonQuery();
            connection.Close();
            return rowsAffecte;
        }

        public int SavePatientTestInfo(TestRequestClass aTestRequestClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query =
                "insert into t_TestReqEntry(Name,DateofBirth,MobileNo,Date,TotalFee,DueAmount,PaidAmount) values ('" +
                aTestRequestClass.Name + "','" + aTestRequestClass.DateofBirth + "','" +
                aTestRequestClass.MobileNo + "','" + aTestRequestClass.date + "','" +
                aTestRequestClass.TotalFee + "','" + aTestRequestClass.DueAmount + "','" + aTestRequestClass.PaidAmount +
                "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowsAffecte = command.ExecuteNonQuery();
            connection.Close();
            return rowsAffecte;
        }

        public bool GetAllInfoByMobileNo(string mobileno)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * from  t_TestReqEntry WHERE MobileNo='" + mobileno + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                connection.Close();
                return true;
            }
            else
            {
                reader.Close();
                connection.Close();
                return false;
            }
            
        }


        public void GetAllInfoByMobileNo(TestRequestClass aTestRequestClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "Select * from t_TestReqEntry WHERE MobileNo='" + aTestRequestClass.MobileNo + "'";
            SqlCommand Command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = Command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    aTestRequestClass.BillNo = Convert.ToInt32(reader["BillNo"].ToString());
                }
                reader.Close();
            }

            connection.Close();
        }
    }
}