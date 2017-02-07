<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSetupUI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.TestSetupUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style10 {
            width: 154px;
        }
        .auto-style11 {
            width: 326px;
            text-align: right;
        }
        .auto-style12 {
            width: 14px;
        }
        .auto-style14 {
            width: 242px;
        }
        .auto-style15 {
            width: 297px;
        }
        .auto-style17 {
            width: 667px;
            text-align: center;
        }
        .auto-style18 {
            margin-left: 0px;
        }
        .auto-style19 {
            width: 193px;
        }
        .auto-style20 {
            width: 572px;
            text-align: right;
        }
        .auto-style21 {
            width: 183px;
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
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Test  Setup" Font-Overline="False" Font-Underline="False" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" Text="Test Name" Font-Size="15pt"></asp:Label>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style19">
                    <asp:TextBox ID="testNameTextBox" runat="server" Width="250px" Font-Size="15pt"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label3" runat="server" Text="Fee" Font-Size="15pt"></asp:Label>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style19">
                    <asp:TextBox ID="feeTextBox" runat="server" Width="250px" Font-Size="15pt"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="BDT"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label4" runat="server" Text="Test Type" Font-Size="15pt"></asp:Label>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style19">
                    <asp:DropDownList ID="testTypeDropDown" runat="server" Height="29px" Width="254px" Font-Size="15pt">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="saveButton" runat="server" Font-Size="Medium" Text="Save" OnClick="saveButton_Click" Width="56px" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style17">
                    <asp:GridView ID="showGridView" runat="server" CssClass="auto-style18" Width="660px" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                       <Columns>
                           <asp:TemplateField HeaderText="SL">
                               <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Test Name">
                               <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Fee">
                               <ItemTemplate><%#Eval("Fee") %></ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Type">
                               <ItemTemplate><%#Eval("TypeName") %></ItemTemplate>
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
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style20">
                    <asp:Button ID="homeButton" runat="server" Font-Size="Medium" OnClick="homeButton_Click" Text="Home" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
