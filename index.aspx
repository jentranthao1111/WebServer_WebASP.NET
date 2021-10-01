<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebASP.NET.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebASP.NET</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: saddlebrown;
        }

        .auto-style2 {
            width: 430px;
        }

        .auto-style3 {
            width: 400px;
        }

        .auto-style4 {
            width: 100px;
            height: 50px;
        }

        .auto-style5 {
            margin-top: 0px;
            margin-left: 0px;
        }

        .auto-style6 {
            width: 270px;
        }

        .auto-style7 {
            width: 270px;
            height: 50px;
        }

        .auto-style8 {
            margin-top: 0px;
            border-radius: 30px;
        }

        .auto-style9 {
            width: 580px;
            height: 730px;
        }

        .auto-style10 {
            width: 100px;
        }

        .auto-style11 {
            width: 500px;
        }

        .auto-style12 {
            height: 120px;
        }

        .stylePanel {
            border-radius: 30px;
        }

        .stylePanel2 {
            border-radius: 10px
        }

        .auto-style15 {
            margin-top: 0px;
            border-radius: 30px;
        }
    </style>
</head>
<body style="background-color: antiquewhite;">

    <form id="form1" runat="server" class="auto-style9">
        <div>
            <h1 class="auto-style1">P I Z Z A - H U R T S </h1>
        </div>
        <hr />
        <br class="auto-style2" />
        <table class="auto-style11">
            <tr style="vertical-align: top;">
                <td class="auto-style12" rowspan="2">
                    <asp:Panel ID="panPizza" CssClass="stylePanel" BackColor="#cc6600" runat="server" GroupingText="Pizza Information" Height="500px" Width="450px">

                        <table class="auto-style3">

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblCustomer" CssClass="auto-style4" AccessKey="c" AssociatedControlID="txtCustomer" Text="Customer:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtCustomer" runat="server" Width="200px" CssClass="stylePanel2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblTelephone" CssClass="auto-style4" AccessKey="t" AssociatedControlID="TextPhone" Text="Telephone:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="TextPhone" TextMode="Phone" runat="server" Width="200px" CssClass="stylePanel2"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblDelivery" CssClass="auto-style4" AssociatedControlID="chkDelivery" Text="To delivery?" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:CheckBox ID="chkDelivery" runat="server" AutoPostBack="true" OnCheckedChanged="chkDelivery_CheckChanged"></asp:CheckBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="lblAddress" CssClass="auto-style4" AccessKey="a" AssociatedControlID="txtAddress" Text="Address:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtAddress" runat="server" Width="200px" TextMode="Multiline" Rows="3" Wrap="true" CssClass="stylePanel2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPizza" CssClass="auto-style4" AssociatedControlID="cboPizza" Text="Pizza:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:DropDownList ID="cboPizza" runat="server" Width="210px" AutoPostBack="true" CssClass="stylePanel2">
                                   <asp:ListItem>Select a Pizza</asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblSize" CssClass="auto-style4" AssociatedControlID="lstSize" Text="Pizza Size:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:ListBox ID="lstSize" runat="server" Width="210px" Rows="4" SelectionMode="Single" CssClass="stylePanel2"  AutoPostBack="true">
                                    </asp:ListBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblToppings" CssClass="auto-style4" AssociatedControlID="chklstToppings" Text="Toppings:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:CheckBoxList ID="chklstToppings" AutoPostBack="true" runat="server" Width="200px"> </asp:CheckBoxList>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPizzaCrust" CssClass="auto-style4" AssociatedControlID="radlstCrust" Text="Pizza Crust:" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:RadioButtonList ID="radlstCrust" AutoPostBack="true" runat="server" Width="200px"> </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="auto-style12">
                    <asp:Panel ID="PanPricing" CssClass="stylePanel" BackColor="#cc6600" runat="server" GroupingText="Pricing" Height="270px" Width="225px">
                        <asp:Image ID="ingHurtz" runat="server" ImageUrl="~/logo_pizza.png" Height="60px" Width="60px" />

                        <!-- Literal is used to show text. Passes the content directly to the client browser.
                            We dont have to load from the sever anymore. Unless we refresh the pages-->
                        <asp:Literal ID="litPricing" runat="server"> </asp:Literal>
                        <br />

                        <asp:Button ID="btnOrderNow" runat="server" Text="Order Now" Height="30px" OnClick="btnOrderNow_Click" />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="PanOrder" CssClass="auto-style15" BackColor="#cc6600" runat="server" GroupingText="Order Informations" Height="230px" Width="225px">
                        <asp:Literal ID="litOrder" runat="server"></asp:Literal>
                        <asp:Literal ID="litDelivery" runat="server"></asp:Literal>
                    </asp:Panel>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>