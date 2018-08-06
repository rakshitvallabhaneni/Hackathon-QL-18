<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SecretApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>VRide</h1>
        <p class="lead">This is a platform where Team Members can post or find a vanpool/carpool.</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <div class="container h-100 d-flex justify-content-center">
        <div class="col-md-4">
            <h2>Click Here to Login</h2>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="btnLogin_Click" />
            </div>
        </div>
    </div>
</asp:Content>
