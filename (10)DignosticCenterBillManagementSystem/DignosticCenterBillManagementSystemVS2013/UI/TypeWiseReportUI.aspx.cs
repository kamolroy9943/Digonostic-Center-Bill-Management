using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DignosticCenterBillManagementSystemVS2013.BLL;
using DignosticCenterBillManagementSystemVS2013.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace DignosticCenterBillManagementSystemVS2013.UI
{
    public partial class TypeWiseReportUI : System.Web.UI.Page
    {
        private bool LandScape;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            TypeWiseReportManager aTypeWiseReportManager=new TypeWiseReportManager();
            TypeWiseReportClass aTypeWiseReportClass=new TypeWiseReportClass();
            aTypeWiseReportClass.FromDate = Convert.ToDateTime(fromDateTextBox.Text);
            aTypeWiseReportClass.ToDate = Convert.ToDateTime(toDateTextBox.Text);
            List<TypeWiseReportManager> aList = aTypeWiseReportManager.GetTypeWiseSearchInfo(aTypeWiseReportClass);
            totalTextBox.Text = aTypeWiseReportClass.total.ToString();
            showGridView.DataSource = aList;
            showGridView.DataBind();
        }
        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Diagnostic Center Home UI.aspx");
        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            int noOfColumns = 0, noOfRows = 0;
            DataTable tbl = null;

            if (showGridView.AutoGenerateColumns)
            {
                tbl = showGridView.DataSource as DataTable; // Gets the DataSource of the GridView Control.
                noOfColumns = tbl.Columns.Count;
                noOfRows = tbl.Rows.Count;
            }
            else
            {
                noOfColumns = showGridView.Columns.Count;
                noOfRows = showGridView.Rows.Count;
            }
            float HeaderTextSize = 8;
            float ReportNameSize = 12;
            float ReportTextSize = 8;
            float ApplicationNameSize = 12;

            Document document = null;
            if (LandScape == true)
            {
                document = new Document(PageSize.A4.Rotate(), 0, 0, 15, 5);
            }
            else
            {
                document = new Document(PageSize.A4, 0, 0, 15, 5);
            }
            iTextSharp.text.pdf.PdfPTable mainTable = new iTextSharp.text.pdf.PdfPTable(noOfColumns);
            mainTable.HeaderRows = 5;
            iTextSharp.text.pdf.PdfPTable headerTable = new iTextSharp.text.pdf.PdfPTable(2);

            Phrase phApplicationName = new Phrase("");
            PdfPCell clApplicationName = new PdfPCell(phApplicationName);
            clApplicationName.Border = PdfPCell.NO_BORDER;
            clApplicationName.HorizontalAlignment = Element.ALIGN_LEFT;
            Phrase aphSpace = new Phrase("\n");

            PdfPCell aclSpace = new PdfPCell(aphSpace);
            aclSpace.Border = PdfPCell.NO_BORDER;
            aclSpace.Colspan = noOfColumns;
            mainTable.AddCell(aclSpace);

            Phrase phDate = new Phrase("Date: " + DateTime.Now.Date.ToString("dd/MM/yyyy"), FontFactory.GetFont("Arial", ApplicationNameSize, iTextSharp.text.Font.NORMAL));
            PdfPCell clDate = new PdfPCell(phDate);
            clDate.Border = PdfPCell.NO_BORDER;
            clDate.HorizontalAlignment = Element.ALIGN_RIGHT;

            headerTable.AddCell(clApplicationName);
            headerTable.AddCell(clDate);
            headerTable.DefaultCell.Border = PdfPCell.NO_BORDER;

            Phrase phHeader = new Phrase("Type Wise Report ", FontFactory.GetFont("Arial", ReportNameSize, iTextSharp.text.Font.BOLD));
            PdfPCell clHeader = new PdfPCell(phHeader);
            clHeader.Colspan = noOfColumns;
            clHeader.Border = PdfPCell.NO_BORDER;
            clHeader.HorizontalAlignment = Element.ALIGN_CENTER;
            mainTable.AddCell(clHeader);

            PdfPCell cellHeader = new PdfPCell(headerTable);
            cellHeader.Border = PdfPCell.NO_BORDER;
            cellHeader.Colspan = noOfColumns;
            mainTable.AddCell(cellHeader);

            Phrase phSpace = new Phrase("\n");
            PdfPCell clSpace = new PdfPCell(phSpace);
            clSpace.Border = PdfPCell.NO_BORDER;
            clSpace.Colspan = noOfColumns;
            mainTable.AddCell(clSpace);

            for (int i = 0; i < noOfColumns; i++)
            {
                Phrase ph = null;
                if (showGridView.AutoGenerateColumns)
                {
                    ph = new Phrase(tbl.Columns[i].ColumnName, FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD));
                }
                else
                {
                    ph = new Phrase(showGridView.Columns[i].HeaderText, FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD));
                }
                mainTable.AddCell(ph);
            }
            for (int rowNo = 0; rowNo < noOfRows; rowNo++)
            {
                for (int columnNo = 0; columnNo < noOfColumns; columnNo++)
                {
                    if (showGridView.AutoGenerateColumns)
                    {
                        string s = showGridView.Rows[rowNo].Cells[columnNo].Text.Trim();
                        Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
                        mainTable.AddCell(ph);
                    }
                    else
                    {
                        if (showGridView.Columns[columnNo] is TemplateField)
                        {
                            DataBoundLiteralControl lc = showGridView.Rows[rowNo].Cells[columnNo].Controls[0] as DataBoundLiteralControl;
                            string s = lc.Text.Trim();
                            Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
                            mainTable.AddCell(ph);
                        }
                        else
                        {
                            string s = showGridView.Rows[rowNo].Cells[columnNo].Text.Trim();
                            Phrase ph = new Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL));
                            mainTable.AddCell(ph);
                        }
                    }
                }
                mainTable.CompleteRow();
            }
            Phrase phHeaderTotal = new Phrase("Total: " + totalTextBox.Text + " TK ", FontFactory.GetFont("Arial", ReportNameSize, iTextSharp.text.Font.BOLD));
            PdfPCell clHeaderTotal = new PdfPCell(phHeaderTotal);
            clHeaderTotal.Colspan = noOfColumns;
            clHeaderTotal.Border = PdfPCell.BOX;
            clHeaderTotal.HorizontalAlignment = Element.ALIGN_RIGHT;
            mainTable.AddCell(clHeaderTotal);

            PdfWriter.GetInstance(document, Response.OutputStream);
            document.Open();
            document.Add(mainTable);
            document.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;  filename = TypeWiseReport.pdf");
            Response.End();
        }
    }
}