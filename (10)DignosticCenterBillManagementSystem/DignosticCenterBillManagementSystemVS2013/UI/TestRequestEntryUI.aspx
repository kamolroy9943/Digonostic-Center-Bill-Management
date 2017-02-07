<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestEntryUI.aspx.cs" Inherits="DignosticCenterBillManagementSystemVS2013.TestRequestEntryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 190px;
            text-align: right;
        }
        .auto-style3 {
            width: 5px;
        }
        .auto-style8 {
            width: 108px;
        }
        .auto-style9 {
            width: 114px;
            text-align: right;
        }
        .auto-style6 {
            width: 142px;
        }
        .auto-style5 {
            width: 186px;
        }
        .auto-style4 {
            width: 42px;
        }
        .auto-style7 {
            margin-left: 73px;
        }
        .auto-style10 {
            width: 391px;
        }
        .auto-style12 {
            margin-left: 0px;
        }
        .auto-style13 {
            width: 603px;
        }
        .auto-style14 {
            width: 175px;
        }
        .auto-style15 {
            width: 334px;
        }
        .auto-style16 {
            width: 226px;
        }
        .auto-style17 {
            width: 52px;
        }
        .auto-style18 {
            width: 636px;
            text-align: right;
        }
        .auto-style19 {
            width: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Test Request Entry"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Font-Size="15pt" Text="Name Of The Patient"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:TextBox ID="patientNameTextBox" runat="server" Font-Size="15pt" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Font-Size="15pt" Text="Date of Birth"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:TextBox ID="dateTextBox" runat="server" Font-Size="15pt" TextMode="Date" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Font-Size="15pt" Text="Mobile No"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:TextBox ID="mobileNoTextBox" runat="server" Font-Size="15pt" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Font-Size="15pt" Text="Select Test"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:DropDownList ID="selectTestDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectTestDropDownList_SelectedIndexChanged" Font-Size="15pt" Width="204px">
                        
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Font-Size="15pt" Text="Fee"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="feeTextBox" runat="server" Font-Size="10pt" Width="81px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="addButton" runat="server" CssClass="auto-style7" Font-Size="10pt" Text="ADD" Width="68px" OnClick="addButton_Click" />
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style13">
                    <asp:GridView ID="showGridView" runat="server" CssClass="auto-style12" Width="597px" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                       <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Test">
                                <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate><%#Eval("Fee") %></ItemTemplate>
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
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style17">
                    <asp:Label ID="totalLabel" runat="server" Font-Size="15pt" Text="Total"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="totalTextBox" runat="server" Font-Size="15pt" Width="145px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Button ID="testrequestHomeButton" runat="server" Font-Size="Medium" OnClick="testrequestHomeButton_Click" Text="Home" />
                </td>
                <td>
                    <asp:Button ID="saveButton" runat="server" Font-Size="15pt" Height="34px" Text="Save" Width="79px" OnClick="saveButton_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
