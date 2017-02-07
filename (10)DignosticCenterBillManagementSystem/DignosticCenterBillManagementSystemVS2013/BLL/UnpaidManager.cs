using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class UnpaidManager
    {
        UnpaidGetWay aUnpaidGetWay=new UnpaidGetWay();
        
        public int BillNo { set; get; }
        public string MobileNo { set; get; }
        public string PatientName { set; get; }
        public double DueAmount { set; get; }
        public double TotalDue { set; get; }


        public double GetTotalDue(double due)
        {
            return TotalDue += due;
        }

        public List<UnpaidManager> GetUnpaidTotalInfo(UnpaidClass aUnpaidClass)
        {
            return aUnpaidGetWay.GetUnpaidTotalInfo(aUnpaidClass);
        }
    }
}