<%@ Page Title="PostVanpool" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostVanpool.aspx.cs" Inherits="SecretApplication.PostVanpool" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h1>Enter information about your vanpool.</h1>
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="Name">Name</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxName" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtboxName"
                ErrorMessage="Full Name is Required"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="MrngLocation">Morning Pick-Up Location</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxMrngLocation" runat="server" class="form-control" placeholder="Address Line 1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtboxMrngLocation"
                ErrorMessage="Please Enter the Pick-Up Location"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxMrngLocation2" runat="server" class="form-control" placeholder="Address Line 2"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="DepartureMrng">Morning Start Time</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxPickUpTimeMrng" runat="server" class="form-control" placeholder="Enter Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="txtboxPickUpTimeMrng"
                ErrorMessage="Please Enter the Morning Pick-Up Time"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="ArrivalMrng">Morning Arrival Time</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxArrivalTimeMrng" runat="server" class="form-control" placeholder="Enter Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="txtboxArrivalTimeMrng"
                ErrorMessage="Please Enter the Arrival Time"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="EvngLocation">Evening Pick-Up Location</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxEvngLocation" runat="server" class="form-control" placeholder="Address Line 1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="txtboxEvngLocation"
                ErrorMessage="Please Enter the Evening Pick-Up Location"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxEvngLocation2" runat="server" class="form-control" placeholder="Address Line 2"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="DepartureEvng">Evening Start Time</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxPickUpTimeEvng" runat="server" class="form-control" placeholder="Enter Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                ControlToValidate="txtboxPickUpTimeEvng"
                ErrorMessage="Please Enter the Evening Pick-Up time"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="ArrivalEvng">Evening Arrival Time</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtboxArrivalTimeEvng" runat="server" class="form-control" placeholder="Enter Time"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                ControlToValidate="txtboxArrivalTimeEvng"
                ErrorMessage="Please Enter the Arrival time"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="totalSeats">Total Seats</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="txtBoxTotalSeats" runat="server" class="form-control" placeholder="Enter Total Seats"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                ControlToValidate="txtBoxTotalSeats"
                ErrorMessage="Please Enter Total number of Seats"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h4>
                <label for="Occupancy">Seats Available</label>
            </h4>
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="TxtboxVacancies" runat="server" class="form-control" placeholder="Enter Vacancy"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                ControlToValidate="TxtboxVacancies"
                ErrorMessage="Please enter number of seats available"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-8 container h-100 d-flex justify-content-center">
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-lg" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
