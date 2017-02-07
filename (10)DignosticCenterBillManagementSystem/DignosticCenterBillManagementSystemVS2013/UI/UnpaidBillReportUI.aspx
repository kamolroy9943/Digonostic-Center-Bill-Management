<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBillReportUI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.UI.UnpaidBillReportUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }
        .auto-style10 {
            width: 120px;
        }
        .auto-style12 {
            width: 210px;
        }
        .auto-style11 {
            width: 93px;
        }
        .auto-style13 {
            width: 192px;
        }
        .auto-style14 {
            width: 9px;
        }
        .auto-style15 {
            width: 195px;
        }
        .auto-style16 {
            width: 42px;
        }
        .auto-style17 {
            width: 197px;
        }
        .auto-style18 {
            width: 167px;
        }
        .auto-style19 {
            width: 198px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Unpaid Bill Report" Font-Overline="False" Font-Underline="False" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style11">
                    <asp:Label ID="labeloffromdate" runat="server" Font-Size="15pt" Text="From Date"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="fromDateTextBox" runat="server" Font-Size="15pt" TextMode="Date" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style11">
                    <asp:Label ID="Labeloftodate" runat="server" Font-Size="15pt" Text="To Date"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="toDateTextBox" runat="server" Font-Size="15pt" TextMode="Date" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>
                    <asp:Button ID="searchButton" runat="server" Font-Size="Medium" Text="Search" OnClick="searchButton_Click" />
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" Width="505px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Bill Number">
                                <ItemTemplate><%#Eval("BillNo")%></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Contact No">
                                <ItemTemplate><%#Eval("MobileNo")%></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Bill Amount">
                                <ItemTemplate><%#Eval("DueAmount")%></ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Button ID="pdfButton" runat="server" Font-Size="Medium" Text="PDF" Width="78px" OnClick="pdfButton_Click" />
                </td>
                <td class="auto-style18">
                    <asp:Button ID="unpaindHomeButton" runat="server" Font-Size="Medium" OnClick="unpaindHomeButton_Click" style="text-align: center" Text="Home" Width="67px" />
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label2" runat="server" Font-Size="15pt" Text="Total"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="totalTextBox" runat="server" Font-Size="15pt" Width="79px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
