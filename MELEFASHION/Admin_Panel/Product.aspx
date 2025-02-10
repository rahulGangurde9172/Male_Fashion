<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Panel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MELEFASHION.Admin_Panel.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div ID="Alert" runat="server" class="alert d-none" role="alert">
  A simple secondary alert—check it out!
</div>
    <div>
        <div class=" mt-5 w-50">
            <h2 class="text-center mb-4 text-secondary">Products Form</h2>

            <div class="mb-1">
                <label class="form-label fw-bold">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                <span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProductName" ErrorMessage="Enter Product Name" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

                </span>
            </div>

            <div class="mb-1">
                <label class="form-label fw-bold">Product Stock:</label>
                <asp:TextBox ID="txtProductStock" runat="server" CssClass="form-control"></asp:TextBox>
                <span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProductStock" ErrorMessage="Enter Product stock" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

                </span>
            </div>

            <div class="mb-1">
                <label class="form-label fw-bold">Product Price:</label>
                <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control"></asp:TextBox>
                <span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProductPrice" ErrorMessage="Enter Product Price" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

                </span>
            </div>

            <div class="mb-1">
                <label class="form-label fw-bold">Product Description:</label>
                <asp:TextBox ID="txtProductDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                <span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProductDescription" ErrorMessage="Enter Product Description" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

                </span>
            </div>

            <div class="mb-1">
                <label class="form-label fw-bold">Product Image:</label>
                <asp:FileUpload ID="ProductImage" runat="server" CssClass="form-control" />
                <span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductImage" ErrorMessage="Select Product Imagek" ForeColor="Red" Font-Size="Smaller" onchange="previewImage(this)"></asp:RequiredFieldValidator>

                </span>
            </div>

            <div class="mb-3">
    <img id="imagePreview" src="#" alt="Selected Image" style="display: none; max-width: 200px; max-height: 200px; border: 1px solid #ddd; padding: 5px;" />
</div>

            <div class="mb-1 form-check">
                <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="form-check-input" />
                <label class="form-check-label fw-bold">Is Available</label>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />


        </div>
    </div>
    <div class="mt-5">


        <asp:GridView ID="productData" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1023px" OnSelectedIndexChanged="productData_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <%# Eval("Product_Name") %>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Product Stock">
                    <ItemTemplate>
                        <%# Eval("Product_Stock") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <%# Eval("Product_Price") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <%# Eval("Product_Description") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" Width="100" Height="70" runat="server" ImageUrl='<%# Eval("Product_Image")%>'/> 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="SELECT" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>


    </div>


</asp:Content>
