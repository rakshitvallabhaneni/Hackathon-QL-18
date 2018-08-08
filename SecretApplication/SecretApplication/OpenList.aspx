<%@ Page Title="OpenList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpenList.aspx.cs" Inherits="SecretApplication.OpenList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 container h-100 d-flex justify-content-center">
        <asp:GridView ID="DisplayGridView" runat="server" BackColor="#66CCFF" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center">
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
