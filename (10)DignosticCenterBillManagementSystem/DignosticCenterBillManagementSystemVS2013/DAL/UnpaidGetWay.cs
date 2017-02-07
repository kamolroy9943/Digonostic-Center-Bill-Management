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
    public class UnpaidGetWay
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;

        public List<UnpaidManager> GetUnpaidTotalInfo(UnpaidClass aUnpaidClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM t_TestReqEntry WHERE Date BETWEEN '" + aUnpaidClass.Fromdate + "' and '" +
                           aUnpaidClass.Todate + "' and DueAmount>0";
            SqlCommand command = new SqlCommand(query, connection);
            List<UnpaidManager> aList = new List<UnpaidManager>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    UnpaidManager aUnpaidManager = new UnpaidManager();
                    aUnpaidManager.BillNo = Convert.ToInt32(reader["BillNo"].ToString());
                    aUnpaidManager.MobileNo = reader["MobileNo"].ToString();
                    aUnpaidManager.PatientName = reader["Name"].ToString();
                    aUnpaidManager.DueAmount = Convert.ToDouble(reader["DueAmount"].ToString());
                    aUnpaidManager.TotalDue = aUnpaidManager.GetTotalDue(aUnpaidManager.DueAmount);
                    aUnpaidClass.Total += aUnpaidManager.TotalDue;
                    aList.Add(aUnpaidManager);
                }
                reader.Close();
            }
            connection.Close();
            return aList;
        }
    }


}