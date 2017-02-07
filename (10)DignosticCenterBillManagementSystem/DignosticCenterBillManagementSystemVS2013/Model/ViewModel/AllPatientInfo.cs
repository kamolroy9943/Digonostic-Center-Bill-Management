using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DignosticCenterBillManagementSystemVS2013.Model.ViewModel
{
    public class AllPatientInfo
    {
        public int Id { set; get; }
        public string TestName { set; get; }
        public double Fee { set; get; }
        public int BillNo { set; get; }
        public string Name { set; get; }
        public string DateofBirth { set; get; }
        public string MobileNo { set; get; }

        public double TotalFee { set; get; }
        public string Date { set; get;}
    }
}