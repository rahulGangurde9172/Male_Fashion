<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MELEFASHION.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="Css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-form">
        <h3 class="register-form-heading">REGISTER</h3>
        <label>
            Name
        </label>
        <asp:TextBox runat="server" ID="nametxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="nametxt" ErrorMessage="Name Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>

        <label>
            what we call you?
        </label>
        <asp:TextBox runat="server" ID="usernametxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="usernametxt" ErrorMessage="Username Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>

        <label>
   Email
</label>
<asp:TextBox runat="server" ID="emailtxt"></asp:TextBox>
<span>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="emailtxt" ErrorMessage="Email Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

</span>

        <label>
            Enter Mobile Number
        </label>
        <asp:TextBox runat="server" ID="mobiletxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="mobiletxt" ErrorMessage="Mobile Number Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>
        <label>Password</label>
        <asp:TextBox runat="server" ID="passwordtxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordtxt" ErrorMessage="Password Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>
        <div class="register-form-links">
            <span>Allready have an account? <a href="Login.aspx">Login Now</a></span>

        </div>
        <asp:Button ID="loginbtn" Text="Register" runat="server" class="register-form-btn" OnClick="loginbtn_Click" />

    </div>
</asp:Content>
