<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MenuItems.aspx.cs" Inherits="MenuItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-md-12">
        <h1>Menu Items </h1>

        <asp:Repeater ID="MenuItemRepeater" runat="server" DataSourceID="MenuItemDataSource">
            <ItemTemplate>
                <div>
                    <%#((decimal) Eval("CurrentPrice")).ToString("C") %>
                    &mdash;
                    <%#Eval("Description") %>
                    &mdash;
                    <%#Eval("Category.Description") %>
                    &mdash;
                    <%#Eval("Calories") %> Calories
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                </hr>
            </SeparatorTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource runat="server" ID="MenuItemDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ListMenuItems" TypeName="eRestaurant.BLL.MenuController"></asp:ObjectDataSource>
    </div>
</asp:Content>

