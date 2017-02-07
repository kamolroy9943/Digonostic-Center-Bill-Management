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
    public class PaymentGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;

        public List<AllPatientInfo> GetAllBYSearchedValue(PaymentClass aPaymentClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT TestName,Fee from asp WHERE BillNo='" + aPaymentClass.BillNo + "' OR MobileNo='" + aPaymentClass.BillNo + "' ";

            List<AllPatientInfo> aList = new List<AllPatientInfo>();
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    AllPatientInfo allPatientInfo = new AllPatientInfo();
                    allPatientInfo.TestName = reader["TestName"].ToString();
                    allPatientInfo.Fee = int.Parse(reader["Fee"].ToString());
                    aList.Add(allPatientInfo);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }

        public TestRequestClass GetDateandTotalSearchedValue(PaymentClass aPaymentClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * from  t_TestReqEntry WHERE BillNo='" + aPaymentClass.BillNo + "' OR MobileNo='" + aPaymentClass.BillNo + "' ";
            TestRequestClass aTestRequestClass = null;
            List<TestRequestClass> aList = new List<TestRequestClass>();
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    aTestRequestClass = new TestRequestClass();
                    aTestRequestClass.date =reader["Date"].ToString();
                    aTestRequestClass.TotalFee = int.Parse(reader["TotalFee"].ToString());
                    aTestRequestClass.PaidAmount = Convert.ToDouble(reader["PaidAmount"].ToString());
                    aTestRequestClass.DueAmount = Convert.ToDouble(reader["DueAmount"].ToString());
                }
                reader.Close();
            }
            connection.Close();
            return aTestRequestClass;
        }

        public int GetUpdateAmount(PaymentClass aPaymentClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "UPDATE t_TestReqEntry SET PaidAmount='" + aPaymentClass.UpdatePaidAmount + "', DueAmount='" + aPaymentClass.UpdateDueAmount + "'" +
                           " WHERE BillNo='" + aPaymentClass.BillNo + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowsAffected;
        }
    }
}