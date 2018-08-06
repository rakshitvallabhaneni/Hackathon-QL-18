<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind=".aspx.cs" Inherits="SecretApplication.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
    <div class="container h-100 d-flex justify-content-center">
        <div class="col-md-4">
            <h2>Login</h2>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <asp:TextBox ID="txtboxUsername" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <br />
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
