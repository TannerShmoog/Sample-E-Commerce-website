<%@ Page Title="PlayerVault - Browse" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Buy.aspx.vb" Inherits="Buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Select Your Game</h1>  
     
    <asp:SqlDataSource ID="sqlDSGameSelect" runat="server" ConnectionString="<%$ ConnectionStrings:PlayerVaultConnectionString %>" SelectCommand="SELECT * FROM [Games]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSListings" runat="server" ConnectionString="<%$ ConnectionStrings:PlayerVaultConnectionString %>" SelectCommand="SELECT Listings.ListingID, Users.DisplayName, Listings.Stock, Listings.Price FROM Games INNER JOIN Listings ON Games.GameID = Listings.GameID INNER JOIN Users ON Listings.UserID = Users.UserID WHERE (Listings.GameID = @GameID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="sqlGameSelect" Name="GameID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="sqlGameSelect" runat="server" DataSourceID="sqlDSGameSelect" DataTextField="Name" DataValueField="GameID" cssclass="ddlGames" AutoPostBack="true"></asp:DropDownList>
    <div class="buypagecontainer">
        <div class="gameimgcontainer">
            <div class="buypageimgbox" style="transform: translate(-128px, 0);">
                <img src="Images/Icons/wow-128.png" id="imgbuypage" runat="server" class="buypageimg"/>
                <h2 id="txtbuypage" contenteditable="true" runat="server">World Of Warcraft</h2>
            </div>
            <div class="buypageimgbox" style="transform: translate(128px, 0);">
                <img src="Images/Icons/wow-cur-128.png" id="imgbuypagecur" runat="server"  class="buypageimg"/>
                <h2 id="txtbuypagecur" contenteditable="true" runat="server">Gold</h2>
            </div>            
        </div>   
    </div>

    <style type="text/css">
      .hiddencol
      {
        display: none;
      }
    </style>

    <div class="dvcontainer">
        <asp:GridView ID="gridviewlistings" runat="server" DataSourceID="sqlDSListings" AutoGenerateColumns="False" CellPadding="4" CssClass="gridviewbuy" OnRowCommand="gridviewlistings_RowCommand">
            <Columns>
                <asp:BoundField DataField="ListingID" HeaderText="" SortExpression="Listings.ListingID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                <ItemStyle HorizontalAlign="Center" Width="200px" Wrap="False" BorderColor="#C3073F" BorderStyle="Solid"/>
                </asp:BoundField>
                <asp:BoundField DataField="DisplayName" HeaderText="Seller" SortExpression="Users.DisplayName" >
                <ItemStyle HorizontalAlign="Center" Width="200px" Wrap="False" BorderColor="#C3073F" BorderStyle="Solid" />
                </asp:BoundField>
                <asp:BoundField DataField="Stock"  DataFormatString="{0:N0}" HeaderText="Stock" SortExpression="Listings.Stock">
                <ItemStyle HorizontalAlign="Center" Width="200px" BorderStyle="Solid" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" DataFormatString="{0:c7}" HeaderText="Price per Unit" SortExpression="Listings.Price">
                <ItemStyle HorizontalAlign="Center" Width="200px" BorderStyle="Solid" />
                </asp:BoundField>
                <asp:TemplateField><ItemTemplate>
                    <asp:Button ID="btnBuyNow" runat="server" CssClass="buttongridview" Text="Buy" CommandName="Buy" CommandArgument="<%# CType(Container,GridViewRow).RowIndex %>"/>
                </ItemTemplate>
                    <ItemStyle BorderStyle="Solid" />
                </asp:TemplateField>
            </Columns>
            <RowStyle cssclass="rowstylegridview"/>
        </asp:GridView>                        
    </div>
</asp:Content>

