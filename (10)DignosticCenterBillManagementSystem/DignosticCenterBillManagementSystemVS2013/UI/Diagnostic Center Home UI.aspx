<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Diagnostic Center Home UI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.Diagnostic_Center_Home_UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 159px;
        }
        .auto-style4 {
            width: 218px;
        }
        .auto-style6 {
            width: 506px;
        }
        .auto-style7 {
            width: 745px;
        }
        .auto-style8 {
            margin-left: 56px;
        }
        #form1 {
            height: 649px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" Text="Diagnostic Center Bill Management System" BorderColor="#000066"></asp:Label>
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    
    </div>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="TestTypeButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" OnClick="TestTypeButton_Click" Text="Test_Type Setup" Width="314px" Height="45px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="TestSetupButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" OnClick="TestSetupButton_Click" Text="Test Setup" Width="314px" Height="45px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="TestRequestButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" Height="45px" OnClick="TestRequestButton_Click1" Text="Test Request" Width="315px" />
                </td>
                <td>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="paymentButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" Height="45px" OnClick="paymentButton_Click" Text="Payment" Width="315px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="TestWiseRepostButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" Height="45px" OnClick="TestWiseRepostButton_Click" Text="Test Wise Report" Width="315px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="TypeWiseRepostButton0" runat="server" CssClass="auto-style8" Font-Size="X-Large" Height="45px" Text="Type Wise Report" Width="315px" OnClick="TypeWiseRepostButton0_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="UnpaidBillReportButton" runat="server" CssClass="auto-style8" Font-Size="X-Large" Height="45px" OnClick="UnpaidBillReportButton_Click" Text="Unpaid Bill Report" Width="315px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
