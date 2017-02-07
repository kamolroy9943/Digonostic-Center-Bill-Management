using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace DignosticCenterBillManagementSystemVS2013
{
    public partial class TestRequestEntryUI : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["Diagnostic Center"].ConnectionString;
        private bool LandScape;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadTestDropDown();
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[2] { new DataColumn("TestName"), new DataColumn("Fee") });
                ViewState["TestEntry"] = dt;
                this.BindGrid();
            }

        }

        public void LoadTestDropDown()
        {

            TestSetupManger aTestSetupManger = new TestSetupManger();
            List<TestClass> aList = aTestSetupManger.GetAllTestInfo();
            selectTestDropDownList.DataSource = aList;
            selectTestDropDownList.DataTextField = "Name";
            selectTestDropDownList.DataValueField = "Id";
            selectTestDropDownList.DataBind();
        }

        protected void selectTestDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            messageLabel.Text = string.Empty;
            TestSetupManger abSetupManger = new TestSetupManger();
            TestClass adropClass = abSetupManger.GetAllInfoByTestId(selectTestDropDownList.SelectedValue);
            feeTextBox.Text = adropClass.Fee.ToString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            TestRequestManager aRequestManager = new TestRequestManager();
            TestRequestClass aRequestClass=new TestRequestClass();
            aRequestClass.MobileNo = mobileNoTextBox.Text;
            if (patientNameTextBox.Text == string.Empty || dateTextBox.Text == string.Empty ||
                mobileNoTextBox.Text == string.Empty || feeTextBox.Text == string.Empty)
            {
                messageLabel.Text = "Insert All Values !";
            }
            else
            {
                if (aRequestManager.GetAllInfoByMobileNo(aRequestClass.MobileNo)==true)
                {
                    messageLabel.Text = "This Mobile No Already Exist";
                }
                else
                {
                    messageLabel.Text = string.Empty;
                    TestRequestClass aTestRequestClass = new TestRequestClass();
                    aTestRequestClass.Fee = Convert.ToDouble(feeTextBox.Text);
                    aTestRequestClass.MobileNo = mobileNoTextBox.Text;
                    TestSetupManger aTestSetupManger = new TestSetupManger();
                    TestClass adropClass = aTestSetupManger.GetAllInfoByTestId(selectTestDropDownList.SelectedValue);



                    DataTable dt = (DataTable) ViewState["TestEntry"];
                    dt.Rows.Add(adropClass.Name.Trim(), feeTextBox.Text.Trim());
                    ViewState["TestEntry"] = dt;
                    this.BindGrid();

                    selectTestDropDownList.SelectedValue = null;

                    double i;
                    if (totalTextBox.Text.Length != 0)
                    {
                        i = int.Parse(totalTextBox.Text);
                        i = i + aTestRequestClass.GetFullFee(aTestRequestClass.Fee);
                    }
                    else
                    {
                        i = int.Parse(feeTextBox.Text);
                    }
                    totalTextBox.Text = i.ToString();
                    feeTextBox.Text = string.Empty;

                    if (aRequestManager.SaveTestGridview(adropClass, aTestRequestClass) > 0)
                    {
                        messageLabel.Text = "Added";
                    }
                    else
                    {
                        messageLabel.Text = "Failed to Insert";
                    }
                }
            }
        }

        protected void BindGrid()
        {
            showGridView.DataSource = (DataTable)ViewState["TestEntry"];
            showGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            
            TestRequestManager aTestRequestManager = new TestRequestManager();
            TestRequestClass aTestRequestClass = new TestRequestClass();
            aTestRequestClass.Name = patientNameTextBox.Text;
            aTestRequestClass.DateofBirth = dateTextBox.Text;
            aTestRequestClass.MobileNo = mobileNoTextBox.Text;
            aTestRequestClass.date = (DateTime.Now.ToString("yyyy/MM/dd"));
            aTestRequestClass.PaidAmount = 0;
            aTestRequestClass.TotalFee = 0;
            if (patientNameTextBox.Text == string.Empty || dateTextBox.Text == string.Empty ||
                mobileNoTextBox.Text == string.Empty || totalTextBox.Text == string.Empty)
            {
                messageLabel.Text = "Insert All Values !";
            }
                
                else
                {
                    aTestRequestClass.TotalFee = int.Parse(totalTextBox.Text);
                    aTestRequestClass.DueAmount = aTestRequestClass.TotalFee;
                    if (aTestRequestManager.SavePatientTestInfo(aTestRequestClass) > 0)
                    {
                        messageLabel.Text = "inserted successfully";
                        patientNameTextBox.Text = string.Empty;
                        dateTextBox.Text = string.Empty;
                        mobileNoTextBox.Text = string.Empty;
                        showGridView.DataSource = null;
                        DataTable dt = (DataTable) ViewState["TestEntry"];
                        dt.Rows.Clear();
                    }
                    else
                    {
                        messageLabel.Text = "Failed to Insert";
                    }
                    totalTextBox.Text = 0.ToString();
            }

            aTestRequestManager.GetAllInfoByMobileNo(aTestRequestClass);

            //GetPDFValue(aTestRequestClass);
        }

        

        //public void GetPDFValue(TestRequestClass aTestRequestClass)
        //{
        //    int noOfColumns = 0, noOfRows = 0;
        //    DataTable tbl = null;

        //    if (showGridView.AutoGenerateColumns)
        //    {
        //        tbl = showGridView.DataSource as DataTable; // Gets the DataSource of the GridView Control.
        //        noOfColumns = tbl.Columns.Count;
        //        noOfRows = tbl.Rows.Count;
        //    }
        //    else
        //    {
        //        noOfColumns = showGridView.Columns.Count;
        //        noOfRows = showGridView.Rows.Count;
        //    }
        //    float HeaderTextSize = 8;
        //    float ReportNameSize = 10;
        //    float ReportTextSize = 8;
        //    float ApplicationNameSize = 12;

        //    Document document = null;
        //    if (LandScape == true)
        //    {
        //        document = new Document(PageSize.A4.Rotate(), 0, 0, 15, 5);
        //    }
        //    else
        //    {
        //        document = new Document(PageSize.A4, 0, 0, 15, 5);
        //    }
        //    iTextSharp.text.pdf.PdfPTable mainTable = new iTextSharp.text.pdf.PdfPTable(noOfColumns);
        //    mainTable.HeaderRows = 5;
        //    iTextSharp.text.pdf.PdfPTable headerTable = new iTextSharp.text.pdf.PdfPTable(2);
        //    Phrase phApplicationName =
        //        new Phrase(
        //            "Bill No:" + aTestRequestClass.BillNo + "\nName: " + aTestRequestClass.Name + "\nMobile No: " +
        //            aTestRequestClass.MobileNo + "\nDate Of Birth: " + aTestRequestClass.DateofBirth + " ",
        //            FontFactory.GetFont("Arial", ApplicationNameSize, iTextSharp.text.Font.BOLD));
        //    PdfPCell clApplicationName = new PdfPCell(phApplicationName);
        //    clApplicationName.Border = PdfPCell.NO_BORDER;
        //    clApplicationName.HorizontalAlignment = Element.ALIGN_LEFT;
        //    Phrase aphSpace = new Phrase("\n");

        //    PdfPCell aclSpace = new PdfPCell(aphSpace);
        //    aclSpace.Border = PdfPCell.NO_BORDER;
        //    aclSpace.Colspan = noOfColumns;
        //    mainTable.AddCell(aclSpace);


        //    Phrase phDate = new Phrase("Entry Date: " + DateTime.Now.Date.ToString("dd/MM/yyyy"),
        //        FontFactory.GetFont("Arial", ApplicationNameSize, iTextSharp.text.Font.NORMAL));
        //    PdfPCell clDate = new PdfPCell(phDate);
        //    clDate.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    clDate.Border = PdfPCell.NO_BORDER;
        //    headerTable.AddCell(clApplicationName);
        //    headerTable.AddCell(clDate);
        //    headerTable.DefaultCell.Border = PdfPCell.NO_BORDER;

        //    Phrase phHeader = new Phrase("PATIENT BILL ",
        //        FontFactory.GetFont("Arial", ReportNameSize, iTextSharp.text.Font.BOLD));
        //    PdfPCell clHeader = new PdfPCell(phHeader);
        //    clHeader.Colspan = noOfColumns;
        //    clHeader.Border = PdfPCell.NO_BORDER;
        //    clHeader.HorizontalAlignment = Element.ALIGN_CENTER;
        //    mainTable.AddCell(clHeader);

        //    PdfPCell cellHeader = new PdfPCell(headerTable);
        //    cellHeader.Border = PdfPCell.NO_BORDER;
        //    cellHeader.Colspan = noOfColumns;
        //    mainTable.AddCell(cellHeader);

        //    Phrase phSpace = new Phrase("\n");
        //    PdfPCell clSpace = new PdfPCell(phSpace);
        //    clSpace.Border = PdfPCell.NO_BORDER;
        //    clSpace.Colspan = noOfColumns;
        //    mainTable.AddCell(clSpace);

        //    for (int i = 0; i < noOfColumns; i++)
        //    {
        //        Phrase ph = null;
        //        if (showGridView.AutoGenerateColumns)
        //        {
        //            ph = new Phrase(tbl.Columns[i].ColumnName,
        //                FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD));
        //        }
        //        else
        //        {
        //            ph = new Phrase(showGridView.Columns[i].HeaderText,
        //                FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD));
        //        }
        //        mainTable.AddCell(ph);
        //    }
        //    for (int rowNo = 0; rowNo < noOfRows; rowNo++)
        //    {
        //        for (int columnNo = 0; columnNo < noOfColumns; columnNo++)
        //        {
        //            if (showGridView.AutoGenerateColumns)
        //            {
        //                string s = showGridView.Rows[rowNo].Cells[columnNo].Text.Trim();
        //                Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
        //                mainTable.AddCell(ph);
        //            }
        //            else
        //            {
        //                if (showGridView.Columns[columnNo] is TemplateField)
        //                {
        //                    DataBoundLiteralControl lc =
        //                        showGridView.Rows[rowNo].Cells[columnNo].Controls[0] as DataBoundLiteralControl;
        //                    string s = lc.Text.Trim();
        //                    Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
        //                    mainTable.AddCell(ph);
        //                }
        //                else
        //                {
        //                    string s = showGridView.Rows[rowNo].Cells[columnNo].Text.Trim();
        //                    Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
        //                    mainTable.AddCell(ph);
        //                }
        //            }
        //        }
        //        mainTable.CompleteRow();
        //    }

        //    Phrase phHeaderTotal = new Phrase("Total: " + aTestRequestClass.TotalFee + " TK ",
        //        FontFactory.GetFont("Arial", ReportNameSize, iTextSharp.text.Font.BOLD));
        //    PdfPCell clHeaderTotal = new PdfPCell(phHeaderTotal);
        //    clHeaderTotal.Colspan = noOfColumns;
        //    clHeaderTotal.Border = PdfPCell.BOX;
        //    clHeaderTotal.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    mainTable.AddCell(clHeaderTotal);

        //    PdfWriter.GetInstance(document, Response.OutputStream);
        //    document.Open();
        //    document.Add(mainTable);
        //    document.Close();
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment; filename= PatientBill.pdf");
        //    Response.End();
        //}

        protected void testrequestHomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Diagnostic Center Home UI.aspx");
        }
    }
}