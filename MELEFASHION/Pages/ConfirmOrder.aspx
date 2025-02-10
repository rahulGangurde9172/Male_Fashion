<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="ConfirmOrder.aspx.cs" Inherits="MELEFASHION.Pages.ConfirmOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <h5 class="m-3 fw-bold"><span class="text-warning"><%:Session["Username"] %> </span> YOUR ORDERS</h5>
    <div runat="server" id="alert" class="d-none alert alert-danger" role="alert">
        <strong> Your order could not be placed.</strong> Please try again later or contact support.
</div>
    <hr />
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
         <asp:Repeater ID="ConfirmOrderItems" runat="server">

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


         </div>

    <asp:Button ID="ContinueShopping" CssClass="bg-dark border-0 p-2 m-5 text-white" runat="server" Text="CONTINUE SHOPPING" PostBackUrl="~/Pages/Shop.aspx"/>

</asp:Content>
