<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="MELEFASHION.Pages.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Shop.css" rel="stylesheet" />

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>

    <div class="d-flex justify-content-end m-2 " runat="server">
        <div id="CartMessage" runat="server" class="d-none alert alert-success alert-dismissible fade show w-25 " role="alert">
            <div class="d-flex justify-content-start align-items-center">
                <strong>Success!</strong> Product Added..
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
    </div>


    <asp:Label ID="demo" Text="product add" runat="server" Visible="false"></asp:Label>

    <div class="shop-filter">
        <div>

        </div>
        <span>Sort by Price: 
        <asp:DropDownList ID="filterProduct" runat="server" OnSelectedIndexChanged="filterProduct_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>Low To High</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>500</asp:ListItem>
        </asp:DropDownList>
            </span>

    </div>

    <div class="shop-container">
        <div>
           
            <div>
                <asp:TextBox CssClass="input" runat="server" ForeColor="LightGray"></asp:TextBox>
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <div class="accordion " id="accordionExample">
                <div class="accordion-item accordion-container">
                    <h2 class="accordion-header">
                        <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                           Catagiry
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show " data-bs-parent="#accordionExample">
                        <div class="accordion-body accordion-content">
                            <a href="#">Young</a>
                            <a href="#">older</a>
                            <a href="#">kids</a>
                            <a href="#">casuals</a>
                            <a href="#">formals</a>
                              </div>
                    </div>
                </div>
                <div class="accordion-item accordion-container">
                    <h2 class="accordion-header">
                        <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                           filter
                        </button>
                    </h2>
                    <div id="collapseOne1" class="accordion-collapse collapse show " data-bs-parent="#accordionExample">
                        <div class="accordion-body accordion-content">
                            <a href="#">50</a>
                            <a href="#">100</a>
                            <a href="#">500</a>
                            <a href="#">1000</a>
                            <a href="#">1500</a>
                        </div>
                    </div>
                </div>
               
            </div>
            </div>

        <div class="cart">
            <asp:Repeater runat="server" ID="ProductCard" >
                <ItemTemplate>
                    <div class="cart-container">
                        <%--<img src="./image/product-2.jpg" alt="">--%>
                        <asp:Image ID="Image1" CssClass="img" runat="server" ImageUrl='<%# ResolveUrl(Eval("Product_Image").ToString()) %>' />

                        <div class="cart-content">

                            <span>
                                <%# Eval("Product_Name") %>
                            </span>
                            <p>Rs <%# Eval("Product_Price") %></p>

                            <div class="cart-input">
                               <%-- btnsss --%>

                                <asp:UpdatePanel ID="totalItemsPanel" runat="server">
                                    <ContentTemplate>

                                        <asp:Button ID="minusbtn" runat="server" Text="-" CssClass="minusBtn" OnClick="Minus_Clicked"  />
                                        <asp:TextBox ID="totalitemtxt" runat="server" CssClass="total_items" Text="0" ReadOnly="true"></asp:TextBox>
                                        <asp:Button ID="plusbtn" runat="server" Text="+" CssClass="plusBtn" OnClick="Plus_Clicked" />
                                    
                                       

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                          
                             <asp:Button runat="server" CssClass="cardbtn" Text="Add To Cart" OnClick="AddtoCart_Clicked" CommandArgument='<%# Eval("Product_ID") %>' />
                                  
                            <%--<asp:UpdatePanel ID="addtocartpln" runat="server">
                                <ContentTemplate>--%>
                                    <%--<asp:Button runat="server" CssClass="cardbtn" Text="Add To Cart" OnClick="AddtoCart_Clicked" CommandArgument='<%# Eval("Product_ID") %>' />--%>
                                    <%--OnClick="Addtocartbtn_Click"--%>
                                <%--</ContentTemplate>
                            </asp:UpdatePanel>--%>

                            <div class="wishlist">
                                <i class="fa-regular fa-heart"></i>
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

 
    




</asp:Content>
