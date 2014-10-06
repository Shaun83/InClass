<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReservationBySpecialEvent.aspx.cs" Inherits="ReservationBySpecialEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-md-12">
        <h1>Reservations By Special Event </h1>
        <asp:DropDownList ID="DDL_SpecialEvent" runat="server" DataSourceID="SpecialEventDataSource" DataTextField="Description" DataValueField="EventCode" AppendDataBoundItems="true">
            <asp:ListItem>[Select an Event]</asp:ListItem>
            <asp:ListItem>[No Event]</asp:ListItem>
        </asp:DropDownList>
        <asp:ObjectDataSource runat="server" ID="SpecialEventDataSource" SelectMethod="ListAllSpecialEvents" TypeName="eRestaurant.BLL.RestaurantAdminController" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID"></asp:BoundField>
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName"></asp:BoundField>
            <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" SortExpression="ReservationDate"></asp:BoundField>
            <asp:BoundField DataField="NumberInParty" HeaderText="NumberInParty" SortExpression="NumberInParty"></asp:BoundField>
            <asp:BoundField DataField="ContactPhone" HeaderText="ContractPhone" SortExpression="ContractPhone"></asp:BoundField>
            <asp:BoundField DataField="ReservationStatus" HeaderText="ReservationStatus" SortExpression="ReservationStatus"></asp:BoundField>
            <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="ListReservationBySpecialEvent" TypeName="eRestaurant.BLL.RestaurantAdminController">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_SpecialEvent" PropertyName="SelectedValue" DefaultValue="EventCode" Name="EventCode" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
