using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;
using DignosticCenterBillManagementSystemVS2013.Model.ViewModel;

namespace DignosticCenterBillManagementSystemVS2013
{
    public partial class TestSetupUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTypeNameDropDown();
        }

        public void LoadTypeNameDropDown()
        {
            TestSetupManger aTestManger = new TestSetupManger();
            if (!IsPostBack)
            {
                TypeSetupManager aTypeManager = new TypeSetupManager();
                List<TypeClass> aList = aTypeManager.GetAllTypeName();
                testTypeDropDown.DataSource = aList;
                testTypeDropDown.DataTextField = "Name";
                testTypeDropDown.DataValueField = "Id";
                testTypeDropDown.DataBind();
                List<ViewTestAndTest_Type> akList = aTestManger.GetAllTestInfoWithType();
                showGridView.DataSource = akList;
                showGridView.DataBind();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestSetupManger aTestManger = new TestSetupManger();
            TestClass aTestClass = new TestClass();
            aTestClass.Name = testNameTextBox.Text;
            aTestClass.TypeNameId = Convert.ToInt32(testTypeDropDown.SelectedValue);

            if (testNameTextBox.Text == string.Empty || feeTextBox.Text == string.Empty ||
                testTypeDropDown.Text == string.Empty)
            {
                messageLabel.Text = "Insert Values";
            }
            else
            {
                aTestClass.Fee = Convert.ToDouble(feeTextBox.Text);
                if (aTestManger.GetAllInfoByTestName(aTestClass.Name) != null)
                {
                    messageLabel.Text = "Test Name Already Exist";
                }
                else
                {
                    if (aTestManger.SaveTestInfo(aTestClass) > 0)
                    {
                        messageLabel.Text = "Insert Info Successfully";
                        testNameTextBox.Text = string.Empty;
                        feeTextBox.Text = string.Empty;
                    }
                    else
                    {
                        messageLabel.Text = "Insert Failed !";
                    }
                    List<ViewTestAndTest_Type> akList = aTestManger.GetAllTestInfoWithType();
                    showGridView.DataSource = akList;
                    showGridView.DataBind();
                }
            }
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeSetupUI.aspx");
        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Diagnostic Center Home UI.aspx");
        }
    }
}