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
    public class TypeWiseReportManager
    {
        TypeWiseGetWay aGetWay=new TypeWiseGetWay();
        
        public string TypeName { set; get; }
        public int TotalTest { set; get; }
        public double TotalFee { set; get; }

        public List<TypeWiseReportManager> GetTypeWiseSearchInfo(TypeWiseReportClass aTypeWiseReportClass)
        {
            return aGetWay.GetTypeWiseSearchInfo(aTypeWiseReportClass);
        }
    }
}