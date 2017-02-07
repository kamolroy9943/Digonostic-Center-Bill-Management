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
    public class TypeWiseGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;
        public List<TypeWiseReportManager> GetTypeWiseSearchInfo(TypeWiseReportClass aTypeWiseReportClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query =
                "select TypeName,Count(TestName) as No_Of_Test,sum(Fee) as Total,Date from typewisetable WHERE Date Between '" +
                aTypeWiseReportClass.FromDate + "' and '" + aTypeWiseReportClass.ToDate + "' group by TypeName,Date ";
            SqlCommand command = new SqlCommand(query, connection);
            List<TypeWiseReportManager> aList = new List<TypeWiseReportManager>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TypeWiseReportManager aWiseReportManager = new TypeWiseReportManager();
                    aWiseReportManager.TypeName = reader["TypeName"].ToString();
                    aWiseReportManager.TotalTest = Convert.ToInt32(reader["No_Of_Test"].ToString());
                    aWiseReportManager.TotalFee = Convert.ToDouble(reader["Total"].ToString());
                    aTypeWiseReportClass.total += aWiseReportManager.TotalFee;
                    aList.Add(aWiseReportManager);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }
    }
}