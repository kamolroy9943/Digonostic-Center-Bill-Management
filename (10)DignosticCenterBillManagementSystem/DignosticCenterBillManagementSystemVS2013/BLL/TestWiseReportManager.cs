using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class TestWiseReportManager
    {
        TestWiseReportGetWay aTestWiseReportGetWay=new TestWiseReportGetWay();

        public string TestName { set; get; }
        public int TotalTest { set; get; }
        public double Fee { set; get; }
        public double TotalFee { set; get; }

        public double total { set; get; }

        public double GetTotalFee(double textno, double perfee)
        {
            return textno*perfee;
        }

        public double GetTotal(double tofe)
        {
           return total += tofe;
        }

        public List<TestWiseReportManager> SearchDateWiseInfo(TestWiseReportClass aTestWiseReportClass)
        {
            return aTestWiseReportGetWay.SearchDateWiseInfo(aTestWiseReportClass);
        }

    }
}