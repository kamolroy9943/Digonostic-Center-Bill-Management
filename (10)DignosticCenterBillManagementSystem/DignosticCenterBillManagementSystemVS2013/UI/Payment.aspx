<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.UI.Payment" %>
<%@ Import Namespace="System.Diagnostics" %>

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
        .auto-style11 {
            width: 232px;
        }
        .auto-style12 {
            width: 69px;
        }
        .auto-style13 {
            width: 198px;
        }
        .auto-style14 {
            width: 303px;
        }
        .auto-style15 {
            width: 295px;
        }
        .auto-style16 {
            width: 123px;
            text-align: left;
        }
        .auto-style17 {
            width: 243px;
        }
        .auto-style18 {
            width: 5px;
        }
        .auto-style19 {
            height: 24px;
        }
        .auto-style20 {
            height: 24px;
            width: 242px;
        }
        .auto-style21 {
            height: 24px;
            width: 113px;
        }
        .auto-style23 {
            width: 356px;
        }
        .auto-style24 {
            width: 106px;
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
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="PayBill" Font-Overline="False" Font-Underline="False" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="Label2" runat="server" Font-Size="15pt" Text="Bill No"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="billNoTextBox" runat="server" Font-Size="15pt" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="searchButton" runat="server" Font-Size="Medium" OnClick="searchButton_Click" Text="Search" style="height: 28px" />
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td>
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                             <ItemTemplate><%# Container.DataItemIndex + 1%></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test Name">
                             <ItemTemplate><%#Eval("TestName")%></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                             <ItemTemplate><%#Eval("Fee")%></ItemTemplate>
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
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style16">
                    <asp:Label ID="Label3" runat="server" Text="Bill Date ="></asp:Label>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <asp:Label ID="billDateLabel" runat="server">
                        
                    </asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style16">
                    <asp:Label ID="Label4" runat="server" Text="Total Fee ="></asp:Label>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <asp:Label ID="totalFeeLabel" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style16">
                    <asp:Label ID="Label5" runat="server" Text="Paid Amount ="></asp:Label>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <asp:Label ID="paidAmountLabel" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style16">
                    <asp:Label ID="Label6" runat="server" Text="Due Amount ="></asp:Label>
                </td>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <asp:Label ID="dueAmountLabel" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style20"></td>
                <td class="auto-style21">
                    <asp:Label ID="Label7" runat="server" Font-Size="15pt" Text="Amount"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="amountTextBox" runat="server" Font-Size="15pt"></asp:TextBox>
                </td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style23">
                    <asp:Label ID="amountmessageLabel" runat="server"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:Button ID="payHomeButton" runat="server" Font-Size="Medium" OnClick="payHomeButton_Click" Text="Home" Width="80px" />
                </td>
                <td>
                    <asp:Button ID="payButton" runat="server" Font-Size="Medium" Text="Pay" Width="74px" OnClick="payButton_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
