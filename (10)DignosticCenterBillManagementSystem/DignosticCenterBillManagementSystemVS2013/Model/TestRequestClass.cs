using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DignosticCenterBillManagementSystemVS2013.Model
{
    public class TestRequestClass
    {
        public int BillNo { set; get; }
        public int Id { set; get; }
        public string Name { set; get; }
        public string DateofBirth { set; get; }

        public string MobileNo { set; get; }

        public string TestName { set; get; }
        public double Fee { set; get; }

        public double TotalFee { set; get; }

        public string date { set; get; }
        public double Sum { set; get; }

        public double PaidAmount { set; get; }
        public double DueAmount { set; get; }

    public double GetFullFee(double fee)
        {
            Sum += fee;
            return Sum;
        }
    }
}