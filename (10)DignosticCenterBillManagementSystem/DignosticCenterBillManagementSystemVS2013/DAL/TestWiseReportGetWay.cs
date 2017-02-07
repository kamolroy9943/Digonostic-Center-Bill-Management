using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.DAL
{
    public class TestWiseReportGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;

        public List<TestWiseReportManager> SearchDateWiseInfo(TestWiseReportClass aTestWiseReportClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "select TestName,COUNT(asp.TestName) as Total_Test,Fee,Date from asp WHERE Date Between '" +
                           aTestWiseReportClass.FromDate + "' and '" + aTestWiseReportClass.ToDate +
                           "'group by TestName,Fee,Date";
            SqlCommand command = new SqlCommand(query, connection);
            List<TestWiseReportManager> aList = new List<TestWiseReportManager>();

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TestWiseReportManager aTestWiseReportManager = new TestWiseReportManager();
                    aTestWiseReportManager.TestName = reader["TestName"].ToString();
                    aTestWiseReportManager.TotalTest = Convert.ToInt32(reader["Total_Test"].ToString());
                    aTestWiseReportManager.Fee = Convert.ToDouble(reader["Fee"].ToString());
                    aTestWiseReportManager.TotalFee = aTestWiseReportManager.GetTotalFee(aTestWiseReportManager.TotalTest,
                        aTestWiseReportManager.Fee);
                    aTestWiseReportManager.total = aTestWiseReportManager.GetTotal(aTestWiseReportManager.TotalFee);
                    aTestWiseReportClass.total += aTestWiseReportManager.total;
                    aList.Add(aTestWiseReportManager);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }
    }
}