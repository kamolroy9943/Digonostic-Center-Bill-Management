using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013
{
    public partial class TypeSetupUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TypeSetupManager aTypeManger = new TypeSetupManager();
            if (!IsPostBack)
            {
                List<TypeClass> aList = aTypeManger.GetAllTypeName();
                showGridView.DataSource = aList;
                showGridView.DataBind();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TypeSetupManager aTypeManger = new TypeSetupManager();
            TypeClass aTypeClass = new TypeClass();
            aTypeClass.Name = typeNameTextBox.Text;
            if (typeNameTextBox.Text == string.Empty)
            {
                messageLabel.Text = "Insert Type Name !";
            }
            else
            {
                if (aTypeManger.IsTypeNameExist(aTypeClass.Name) == true)
                {
                    messageLabel.Text = "Type Name Already Exist !";
                }
                else
                {
                    if (aTypeManger.SaveTypeName(aTypeClass) > 0)
                    {
                        messageLabel.Text = "Type Name Inserted Successfully";
                        typeNameTextBox.Text = string.Empty;
                    }
                    else
                    {
                        messageLabel.Text = "Insert Failed !";
                    }
                    List<TypeClass> aList = aTypeManger.GetAllTypeName();
                    showGridView.DataSource = aList;
                    showGridView.DataBind();
                }
            }
        }

        protected void nextButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestSetupUI.aspx");
        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Diagnostic Center Home UI.aspx");
        }
    }
}