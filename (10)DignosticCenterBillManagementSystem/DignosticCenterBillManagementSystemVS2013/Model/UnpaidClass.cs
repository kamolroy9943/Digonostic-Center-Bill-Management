using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DignosticCenterBillManagementSystemVS2013.Model
{
    public class UnpaidClass
    {
        public DateTime Fromdate { set; get; }
        public DateTime Todate { set; get; }
        public double Total { set; get; }
    }
}