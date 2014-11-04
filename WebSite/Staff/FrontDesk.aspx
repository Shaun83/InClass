﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrontDesk.aspx.cs" Inherits="Staff_FrontDesk" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-md-12">
        <h1>Front Desk</h1>
        <style type="text/css">
            .seating {
                display: inline-block;
                vertical-align: top;
            }
        </style>

        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        <div class="well">
            <h4>Mock Date/Time</h4>
            <div class="pull-right col-md-5">
                Last Billed Date/Time:
                <asp:Repeater ID="AdHocBillDateRepeater" runat="server"
                    ItemType="System.DateTime" DataSourceID="AdHocBillDateDataSource">
                    <ItemTemplate>
                        <%# Item.ToShortDateString() %>
                        &ndash;
                        <%# Item.ToShortTimeString() %>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="AdHocBillDateDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetLastBillDateTime" TypeName="eRestaurant.BLL.AdHocController"></asp:ObjectDataSource>
            </div>
            <asp:TextBox ID="SearchDate" runat="server" TextMode="Date" Text="2014-10-16" />
            <asp:TextBox ID="SearchTime" runat="server" TextMode="Time" Text="13:00" CssClass="clockpicker" />
            <!-- Additional scripts/styles here (for bling) -->
            <script src="../Scripts/clockpicker.js"></script>
            <script>
                $('.clockpicker').clockpicker({ donetext: 'Accept' });
            </script>
            <link itemprop="url" href="../Content/clockpicker.css" rel="stylesheet" />
            <link itemprop="url" href="../Content/standalone.css" rel="stylesheet" />

            <asp:LinkButton ID="MockDateTime" runat="server" CssClass="btn btn-primary">Post-back new date/time</asp:LinkButton>
            <asp:LinkButton ID="MockLastBillingDateTime" runat="server" CssClass="btn btn-default" OnClick="MockLastBillingDateTime_Click">Set to last billed date/time</asp:LinkButton>
        </div>
        <div class="pull-right col-md5">
            <details open>
                <summary>Reservations by Date/Time</summary>
                <h4>Today's Reservations</h4>
                <asp:Repeater ID="ReservationsRepeater" runat="server"
                    ItemType="eRestaurant.Entities.DTOs.ReservationCollection" DataSourceID="ReservationsDataSource">
                    <ItemTemplate>
                        <h4><%# Item.Time %>
                            <small><%# Item.Reservations.Count %> reservation at this time-slot</small>
                        </h4>
                        <asp:ListView ID="ReservationSummaryListView" runat="server"
                            ItemType="eRestaurant.Entities.DTOs.ReservationSummary"
                            DataSource="<%# Item.Reservations %>">
                            <LayoutTemplate>
                                <div class="seating">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div>
                                    <%# Item.Name %> &mdash;
                                    <%# Item.NumberInParty %> &mdash;
                                    <%# Item.Status %> &mdash;
                                    <%# Item.Contact %>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ReservationsDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ReservationsByTime" TypeName="eRestaurant.BLL.SeatingController">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="SearchDate" PropertyName="Text" Name="date" Type="DateTime"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </details>
        </div>

        <div class="col-md-7">
            <details open>
                <summary>Tables</summary>
                <asp:GridView ID="SeatingGridView" runat="server"
                    CssClass="table table-hover table striped table-condensed"
                    ItemType="eRestaurant.Entities.DTOs.SeatingSummary" AutoGenerateColumns="false" DataSourceID="SeatingObjectDataSource">
                    <Columns>
                        <asp:CheckBoxField DataField="Taken" HeaderText="Taken" SortExpression="Taken"
                            ItemStyle-HorizontalAlign="Center"></asp:CheckBoxField>
                        <asp:BoundField DataField="Table" HeaderText="Table" SortExpression="Table"></asp:BoundField>
                        <asp:BoundField DataField="Seating" HeaderText="Seating" SortExpression="Seating"></asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel ID="WalkinSteatingPanel" runat="server"
                                    CssClass="input-group input-group-sm"
                                    Visible="<%# ! Item.Taken %>">
                                    <%--Ready to Seat Walk-In customer--%>
                                    <asp:TextBox ID="NumberInParty" runat="server"
                                        CssClass="form-control col-md-1" TextMode="Number"
                                        placeholder="# people"></asp:TextBox>
                                    <span class="input-group-addon">
                                        <asp:DropDownList ID="WaiterList" runat="server"
                                            CssClass="selectpicker"
                                            AppendDataBoundItems="true" DataSourceID="ObjectDataSource1" DataTextField="FullName" DataValueField="WaiterID">
                                            <asp:ListItem Value="0">[Select A Waiter]</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllWaiters" TypeName="eRestaurant.BLL.RestaurantAdminController"></asp:ObjectDataSource>
                                    </span>
                                    <span class="input-group-addon"
                                        style="width:5px;padding:0;border:0;background-color:white;"></span>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Seat Customers"
                                        CssClass="input-group-btn" CommandName="Select"
                                        CausesValidation="false"/>
                                </asp:Panel>

                                <asp:Panel ID="ReservationInfoPanel" runat="server"
                                    Visible="<%# Item.Taken %>">
                                    <%--Table occupied info here--%>
                                    <%# Item.Waiter %>
                                    <asp:Label ID="ReservationNameLabel" runat="server"
                                        Text='<%# "&mdash;" + Item.ReservationName %>' '
                                        Visible='<%# !string.IsNullOrEmpty(Item.ReservationName) %>' />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="BillID" HeaderText="BillID" SortExpression="BillID"></asp:BoundField>--%>
                        <%--<asp:BoundField DataField="BillTotal" HeaderText="BillTotal" SortExpression="BillTotal"></asp:BoundField>--%>
                        <%--<asp:BoundField DataField="Waiter" HeaderText="Waiter" SortExpression="Waiter"></asp:BoundField>--%>
                        <%--<asp:BoundField DataField="ReservationName" HeaderText="ReservationName" SortExpression="ReservationName"></asp:BoundField>--%>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource runat="server" ID="SeatingObjectDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="SeatingByDateTime" TypeName="eRestaurant.BLL.SeatingController">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="SearchDate" PropertyName="Text" Name="date" Type="DateTime"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="SearchTime" PropertyName="Text" DbType="Time" Name="time"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </details>
        </div>
    </div>
</asp:Content>

