<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MELEFASHION.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        

    <div id="alertBox" runat="server" class="alert alert-danger alert-dismissible fade d-none" role="alert">
                <span id="alertMessage">User not found. Please check your credentials.</span>
            </div>

    <div class="login-form">
        <h3 class="login-form-heading">LOGIN</h3>
        <label>
            Enter Mobile Number
        </label>
        <asp:TextBox runat="server" ID="mobiletxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="mobiletxt" ErrorMessage="Username Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>
        <label>Password</label>
        <asp:TextBox runat="server" ID="passwordtxt"></asp:TextBox>
        <span>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordtxt" ErrorMessage="Password Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

        </span>
        <div class="login-form-links">
            <span>Don't have an account? <a href="Register.aspx">Register Now</a></span>
            <span><a href="ForgotPassword.aspx">Forgot Password</a></span>
        </div>
        <asp:Button ID="loginbtn" Text="Login" runat="server" class="login-form-btn" OnClick="loginbtn_Click" />

    </div>

</asp:Content>
