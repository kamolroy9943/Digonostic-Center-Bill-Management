<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeSetupUI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.TypeSetupUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 166px;
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            height: 23px;
            width: 501px;
        }
        .auto-style5 {
            width: 21px;
            height: 23px;
        }
        .auto-style10 {
            width: 120px;
        }
        .auto-style11 {
            width: 230px;
            height: 23px;
            text-align: right;
        }
        .auto-style13 {
            height: 32px;
        }
        .auto-style15 {
            height: 23px;
        }
        .auto-style16 {
            height: 23px;
            width: 241px;
        }
        .auto-style17 {
            margin-left: 2px;
        }
        .auto-style19 {
            width: 264px;
            height: 32px;
        }
        .auto-style20 {
            margin-left: 0px;
        }
        .auto-style21 {
            height: 23px;
            width: 204px;
            text-align: center;
        }
        .auto-style22 {
            width: 326px;
            height: 32px;
        }
        .auto-style23 {
            width: 241px;
        }
        .auto-style24 {
            width: 424px;
            text-align: right;
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
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Test Type Setup" Font-Overline="False" Font-Underline="False" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Type Name" Font-Size="15pt"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">
                    <asp:TextBox ID="typeNameTextBox" runat="server" Width="250px" Font-Size="15pt"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:Button ID="saveButton" runat="server" Font-Size="Medium" OnClick="saveButton_Click" Text="Save" CssClass="auto-style17" />
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style16"></td>
                <td class="auto-style21">
        <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style20" Width="489px">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type Name">
                    <ItemTemplate><%#Eval("Name") %></ItemTemplate>
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
                <td class="auto-style15"></td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style24">
                    <asp:Button ID="homeButton" runat="server" Font-Size="Medium" OnClick="homeButton_Click" Text="Home" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
