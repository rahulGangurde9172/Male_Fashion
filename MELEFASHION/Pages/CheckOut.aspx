    <%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="MELEFASHION.Pages.CheckOut" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="Css/CheckOut.css" rel="stylesheet" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 

        <%--<h2><%: Session["grandTotal"] %></h2>--%>

        <div class="check-out-container">

            <div class="check-out-form">
                <h5>
                    Billing Details
                </h5>
                <hr />

                <div class="check-out-Name-feilds">
                    <div>
                        <span>Name</span><br />
                        <asp:TextBox ID="CustomerName" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CustomerName" ErrorMessage="Enter name" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <span>Last Name</span><br />
                        <asp:TextBox ID="CustomerLastName" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CustomerLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                    </div>
                </div>

               

                <div>
                    <span>Address</span><br />
                    <asp:TextBox ID="Address" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" ErrorMessage="Enter Address" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                </div>

                <div>
                    <span>Town/City</span><br />
                    <asp:TextBox ID="TownCity" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TownCity" ErrorMessage="Enter Town/City" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                </div>
                <div>
                    <span>Country/State</span><br />
                    <asp:TextBox ID="CountryState" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CountryState" ErrorMessage="Enter Country/State" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                </div>
                <div>
                    <span>Country</span><br />
                    <asp:TextBox ID="country" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="country" ErrorMessage="Enter country Name" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                </div>
                <div>
                    <span>Postcode </span><br />
                    <asp:TextBox ID="Postcode" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Postcode" ErrorMessage="Enter Postcode" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                </div>
                <div class="check-out-Name-feilds">
                    <div>
                        <span>Phone</span><br />
                        <asp:TextBox ID="Phone" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone" ErrorMessage="Enter Phone Number" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <span>Email</span><br />
                        <asp:TextBox ID="Email" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="Enter Email" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <asp:CheckBox ID="checkBOX" runat="server"
                        Text="Note about your order, e.g, special noe for delivery"></asp:CheckBox>
                </div>
                <div>
                    <div>
                        <span class="m-2">Note:</span><br />
                        <asp:TextBox ID="Note" runat="server" CssClass="Name-feilds"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Note" ErrorMessage="Enter Note" ForeColor="Red" Font-Size="Smaller"> </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="cart-payment">
                <h5>YOUR ORDER</h5>


                <%-- repeater start --%>
                    <asp:Repeater ID="Cart_repeater" runat="server">
                        <ItemTemplate>
                <div class="cart-details">
                    <div>
                         <span><%#Eval("Name") %></span>(<%# Eval("quantity") %>)
                    </div>
                    <div>
                       Rs.<strong><%# Eval("totalPrice") %>/- </strong>
                    </div>
                </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    

<%-- <span>order one </span> <span>999</span>--%>
                        <%-- repeater end --%>

                <hr />
                <div class="cart-details">
                    <span>total: </span><span class="fw-bold">Rs.<%: Session["grandTotal"] %>/-</span>

                </div>
                
                <div class="cart-payment-mode" style="margin-left: 40px">
                    
                    <asp:UpdatePanel runat="server" ID="PaymentMod" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:CheckBoxList ID="paymentMode" runat="server"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="SelectedIndex_changed">
                            </asp:CheckBoxList>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                    
                     </div>

                 <asp:Button ID="checkOutBtn" Text="PLACE ORDER" runat="server" CssClass="checkOutBtn" OnClick="PlaceOrder_Clicked"/>

            </div>
            
        </div>


    </asp:Content>
