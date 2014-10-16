<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageSpecialEvents.aspx.cs" Inherits="Admin_ManageSpecialEvents" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-md-12">
        <h1>Special Events <span class="glyphicon glyphicon-glass"></span></h1>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SpecialEventDataSource" InsertItemPosition="LastItem" DataKeyNames="EventCode">
        <EditItemTemplate>
            <div style="">
                <asp:LinkButton runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                &nbsp;&nbsp;&nbsp;
                EventCode:
                <asp:TextBox Text='<%# Bind("EventCode") %>' runat="server" ID="EventCodeTextBox" />
                Description:
                <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" />
                <asp:CheckBox Checked='<%# Bind("Active") %>' runat="server" ID="ActiveCheckBox" Text="Active" />
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div style="">
                
                <asp:LinkButton runat="server" CommandName="Insert" Text="Insert" ID="InsertButton"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:CheckBox Checked='<%# Bind("Active") %>' runat="server" ID="ActiveCheckBox" Text="Active" />
                &mdash;
                EventCode:
                <asp:TextBox Text='<%# Bind("EventCode") %>' runat="server" ID="EventCodeTextBox" />
                Description:
                <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" />
                
                
                <br />
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div style="">
                
                <asp:LinkButton runat="server" CommandName="Edit" ID="EditButton">Edit<span class="glyphicon glyphicon-pencil"></span> </asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton"></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                <asp:CheckBox Checked='<%# Eval("Active") %>' runat="server" ID="ActiveCheckBox" Enabled="false" Text="Active" />
                &mdash;
                EventCode:
                <asp:Label Text='<%# Eval("EventCode") %>' runat="server" ID="EventCodeLabel" />
                &mdash;
                Description:
                <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" />
               <%-- Reservations:
               <asp:Label Text='<%# Eval("Reservations") %>' runat="server" ID="ReservationsLabel" />--%>
                              
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <fieldset runat="server" id="itemPlaceholderContainer">                         
                <div runat="server" id="itemPlaceholder"/>
            </fieldset>
        </LayoutTemplate>
        
    </asp:ListView>
    <my:MessageUserControl runat="server" ID="MessageUserControl" />
    <asp:ObjectDataSource runat="server" ID="SpecialEventDataSource" DataObjectTypeName="eRestaurant.Entities.SpecialEvent" DeleteMethod="DeleteSpecialEvent" InsertMethod="AddSpecialEvent" SelectMethod="ListAllSpecialEvents" TypeName="eRestaurant.BLL.RestaurantAdminController" UpdateMethod="UpdateSpecialEvent" OnDeleted="ProcessExceptions" OnInserted="ProcessExceptions" OnUpdated="ProcessExceptions"></asp:ObjectDataSource>
</asp:Content>

