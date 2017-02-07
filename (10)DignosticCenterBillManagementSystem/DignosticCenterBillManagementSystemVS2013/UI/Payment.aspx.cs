using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;
using DignosticCenterBillManagementSystemVS2013.Model.ViewModel;

namespace DignosticCenterBillManagementSystemVS2013.UI
{
    public partial class Payment : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            PaymentManager aPaymentManager = new PaymentManager();

            PaymentClass aPaymentClass = new PaymentClass();
            aPaymentClass.BillNo = Convert.ToInt32(billNoTextBox.Text);
            List<AllPatientInfo> alist = aPaymentManager.GetAllBYSearchedValue(aPaymentClass);
            showGridView.DataSource = alist;
            showGridView.DataBind();

            var abc = aPaymentManager.GetDateandTotalSearchedValue(aPaymentClass);
            if (abc!=null)
            {
                billDateLabel.Text = abc.date.ToString();
                totalFeeLabel.Text = abc.TotalFee.ToString();
                paidAmountLabel.Text = abc.PaidAmount.ToString();
                dueAmountLabel.Text = abc.DueAmount.ToString();   
            }
            else
            {
                messageLabel.Text = "This bill no is not present here!";
            }

        }


        protected void payButton_Click(object sender, EventArgs e)
        {
            PaymentManager aPaymentManager=new PaymentManager();
            PaymentClass aPaymentClass = new PaymentClass();
            aPaymentClass.BillNo = int.Parse(billNoTextBox.Text);
            aPaymentClass.Amount = int.Parse(amountTextBox.Text);
            aPaymentClass.PaidAmount = int.Parse(paidAmountLabel.Text);
            aPaymentClass.DueAmount = int.Parse(dueAmountLabel.Text);

            double updatePaidAmount = aPaymentClass.GetUpdatePaidnAmount(aPaymentClass.Amount);
            paidAmountLabel.Text = updatePaidAmount.ToString();
            double updateDueAmount = aPaymentClass.GetUpdateDueAmount(aPaymentClass.Amount);
            dueAmountLabel.Text = updateDueAmount.ToString();

            aPaymentClass.UpdatePaidAmount = updatePaidAmount;
            aPaymentClass.UpdateDueAmount = updateDueAmount;

            if (aPaymentManager.GetUpdateAmount(aPaymentClass) > 0)
            {
                amountmessageLabel.Text = "Updated";
            }
            else
            {
                amountmessageLabel.Text = "Failed Upadate";
            }
            amountTextBox.Text = string.Empty;
        }

        protected void payHomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Diagnostic Center Home UI.aspx");
        }

        
    }
}