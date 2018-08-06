<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SecretApplication.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="row">
        Hello 
        <asp:Label ID="lblProfileName" runat="server" Text=""></asp:Label>
        , Please choose one of the options below.
    </div>
    <div class="row container h-100 d-flex justify-content-center">
        <h1>I am looking for</h1>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Button ID="btnVanpool" runat="server" Text="Rides" class="btn btn-primary btn-lg container h-100 d-flex justify-content-center" OnClick="btnVanpool_Click" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Button ID="btnVanpoolPost" runat="server" Text="Riders" class="btn btn-primary btn-lg container h-100 d-flex justify-content-center" OnClick="btnVanpoolPost_Click" />
            </div>
        </div>
    </div>
</asp:Content>
