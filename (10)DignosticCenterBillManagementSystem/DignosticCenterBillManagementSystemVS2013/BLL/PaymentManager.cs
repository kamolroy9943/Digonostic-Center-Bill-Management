using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;
using DignosticCenterBillManagementSystemVS2013.Model.ViewModel;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class PaymentManager
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;
        PaymentGetWay aPaymentGetWay=new PaymentGetWay();

        public List<AllPatientInfo> GetAllBYSearchedValue(PaymentClass aPaymentClass)
        {
            return aPaymentGetWay.GetAllBYSearchedValue(aPaymentClass);
        }

        public TestRequestClass GetDateandTotalSearchedValue(PaymentClass aPaymentClass)
        {
            return aPaymentGetWay.GetDateandTotalSearchedValue(aPaymentClass);
        }

        public int GetUpdateAmount(PaymentClass aPaymentClass)
        {
            return aPaymentGetWay.GetUpdateAmount(aPaymentClass);
        }
    }
}