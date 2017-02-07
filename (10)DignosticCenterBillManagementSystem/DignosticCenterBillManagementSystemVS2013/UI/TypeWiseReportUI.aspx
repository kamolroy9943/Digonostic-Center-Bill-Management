<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeWiseReportUI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.UI.TypeWiseReportUI" %>

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
        .auto-style21 {
            width: 237px;
        }
        .auto-style24 {
            width: 239px;
        }
        .auto-style25 {
            width: 135px;
        }
        .auto-style26 {
            width: 174px;
        }
        .auto-style22 {
            width: 40px;
        }
        .auto-style19 {
            width: 196px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
                    <asp:Label ID="Label" runat="server" Font-Size="X-Large" Text="Test Wise Report" Font-Overline="False" Font-Underline="False" Font-Bold="True"></asp:Label>
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
                    <asp:Label ID="Label2" runat="server" Font-Size="15pt" Text="From Date"></asp:Label>
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
                    <asp:Label ID="Label3" runat="server" Font-Size="15pt" Text="To Date"></asp:Label>
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
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td>
                    <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="467px">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Test Type Name">
                                <ItemTemplate><%#Eval("TypeName") %></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Total No of Test">
                                <ItemTemplate><%#Eval("TotalTest") %></ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Amount">
                                <ItemTemplate><%#Eval("TotalFee") %></ItemTemplate>
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
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style25">
                    <asp:Button ID="homeButton" runat="server" Font-Size="Medium" style="text-align: right" Text="Home" OnClick="homeButton_Click" />
                </td>
                <td class="auto-style26">
                    <asp:Button ID="pdfButton" runat="server" Font-Size="12pt" Text="PDF" Width="82px" OnClick="pdfButton_Click" />
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label4" runat="server" Font-Size="15pt" style="text-align: right" Text="Total"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="totalTextBox" runat="server" Font-Size="15pt" Width="99px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
