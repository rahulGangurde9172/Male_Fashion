<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="MELEFASHION.Pages.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>forgot password</title>
    <link href="Css/ForgotPassword.css"rel="stylesheet" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
  
</head>
<body>
    <form id="form1" runat="server">
        <div id="alertBox" runat="server" class="alert alert-danger alert-dismissible fade d-none" role="alert">
            <span id="alertMessage">User not found. Please check your credentials.</span>
        </div>
        <div class="forgot-form">

            <h3 class="forgot-form-heading">LOGIN</h3>
            <label>
                Enter Mobile Number
            </label>
            <asp:TextBox CssClass="forgot-form-textbox" runat="server" ID="mobiletxt"></asp:TextBox>
            <span>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mobiletxt" ErrorMessage="Username Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

            </span>
            <label>Enter New Password</label>
            <asp:TextBox CssClass="forgot-form-textbox" runat="server" ID="passwordtxt"></asp:TextBox>
            <span>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordtxt" ErrorMessage="Password Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red"></asp:RequiredFieldValidator>

            </span>
            <label>Confirm New Password</label>
            <asp:TextBox CssClass="forgot-form-textbox" runat="server" ID="cpasswordtxt"></asp:TextBox>
            <span>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordtxt" ErrorMessage="Password Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ControlToValidate="cpasswordtxt" ControlToCompare="passwordtxt" ErrorMessage="Passwords are not match Required!" Font-Size="Smaller" Font-Bold="false" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            </span>
           
            <div class="forgot-form-btn-content">
                <asp:Button ID="changepasswordbtn" Text="Change Password" runat="server" class="forgot-form-btn" OnClick="changepasswordbtn_Click" />
                <asp:Button ID="cancelbtn" Text="Cancel" runat="server" class="forgot-form-btn" CausesValidation="false" OnClick="cancelbtn_Click" />
            </div>

        </div>
    </form>
</body>
</html>
