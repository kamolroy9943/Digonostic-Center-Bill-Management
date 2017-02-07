using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DignosticCenterBillManagementSystemVS2013.Model
{
    public class PaymentClass
    {
        public int BillNo { set; get; }

        public double Amount { set; get; }

        public double PaidAmount { set; get; }

        public double DueAmount { set; get; }

        public double UpdatePaidAmount { set; get; }
        public double UpdateDueAmount { set; get; }

        public double GetUpdatePaidnAmount ( double Amount)
        {
            return PaidAmount += Amount;
        }
        public double GetUpdateDueAmount (double Amount)
        {
            return DueAmount -= Amount;
        }

    }
}