<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SecretApplication.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4">
            <h2>Register</h2>
            <div class="form-group">
                <label for="firstName">First Name</label>
                <asp:TextBox ID="textboxFirstName" runat="server" class="form-control" placeholder="Enter First Name"></asp:TextBox>
                <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
            </div>
            <br />
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <asp:TextBox ID="textboxLastName" runat="server" class="form-control" placeholder="Enter Last Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="textboxEmailId" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <asp:TextBox ID="textboxphoneNumber" runat="server" class="form-control" placeholder="Enter Your Phone Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="addressLineOne">Address Line1</label>
                <asp:TextBox ID="textboxAddressLine" runat="server" class="form-control" placeholder="Enter Street Address"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <asp:TextBox ID="textboxCity" runat="server" class="form-control" placeholder="Enter City"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <asp:TextBox ID="textboxSate" runat="server" class="form-control" placeholder="Enter State"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="zipCode">Zip Code</label>
                <asp:TextBox ID="textboxZipCode" runat="server" class="form-control" placeholder="Enter Zip Code"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" class="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
