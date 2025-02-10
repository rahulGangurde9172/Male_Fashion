<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MELEFASHION.Pages.Cart"  EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="Css/cart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-content">
        <table class="table w-75">
            <thead class="table-light">
                <tr>
                    <th scope="col">Product Image</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Price</th>
                    <th scope="col">Product Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <asp:Repeater ID="cart_repeater" runat="server">

                <ItemTemplate>
                    <%-- <span><%# Eval("Name") %></span>
         <span><%# Eval("Price") %></span>
         <span><%# Eval("quantity") %></span>
        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>'/>--%>
                    <tbody>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" Height="30%" Width="30%" ImageUrl='<%# Eval("ProductImage") %>' /></td>
                            <td><%# Eval("Name") %></td>
                            <td>Rs. <%# Eval("Price") %></td>
                            <td><%# Eval("quantity") %></td>
                            <td>Rs. <strong><%# Eval("totalPrice") %></strong></td>
                            <td>
                                <%--<asp:Button runat="server" Text="X" CssClass="X-btn" OnClick="CartItemRemove_Clicked" CommandArgument=<%# Eval("ProductID") %>/>--%>
                            </td>
                        </tr>

                    </tbody>
                </ItemTemplate>

            </asp:Repeater>
        </table>

        <div class="checkOutCart">
    <h4>CART TOTAL</h4>
    <div class="d-flex justify-content-between align-items-center">    
        <span>SubTotal : </span> 
        <strong>
            <% if (Session["grandTotal"] != null) { %>
                <%= Session["grandTotal"] %>
            <% } else { %>
                0
            <% } %>
            /-
        </strong>
    </div>
    <div class="d-flex justify-content-between align-items-center">
        <span>Total : </span>
        <strong>
            <% if (Session["grandTotal"] != null) { %>
                <%= Session["grandTotal"] %>
            <% } else { %>
                0
            <% } %>
            /-
        </strong>
    </div>
    
    <asp:Button runat="server" PostBackUrl="~/Pages/CheckOut.aspx" Text="PROCEED TO CHECKOUT" CssClass="cart-btn"></asp:Button>
</div>

    </div>
</asp:Content>
