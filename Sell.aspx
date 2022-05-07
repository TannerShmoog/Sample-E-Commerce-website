<%@ Page Title="PlayerVault - Sell" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Sell.aspx.vb" Inherits="Sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="signuprow">     
        <h2>Sell on PlayerVault</h2>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p style="margin-top: 10px; margin-bottom: -32px;">*All fields are required.<br />*Decimals beyond 7 places will be rounded.</p>

        <asp:SqlDataSource ID="sqlDSGameSelect" runat="server" ConnectionString="<%$ ConnectionStrings:PlayerVaultConnectionString %>" SelectCommand="SELECT * FROM [Games]"></asp:SqlDataSource>
        <div class="signupcontainer">                
            <div class="fields">
                <span>
                    <asp:DropDownList ID="sqlGameSelect" runat="server" DataSourceID="sqlDSGameSelect" DataTextField="Name" DataValueField="GameID" cssclass="ddlGamesSell"></asp:DropDownList>
                </span>
                <span>
                    <asp:TextBox id="inStock" placeholder="Stock (Integer)" runat="server" MaxLength="18" style="width: 255px;" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>   
                </span>
                <span>
                    <asp:TextBox id="inPrice" placeholder="Price per Unit (Decimal)" runat="server" MaxLength="18" style="width: 255px;"></asp:TextBox>
                </span>               
            </div>
        </div>

        <asp:Button ID="btnCreateList" runat="server" Text="Create Listing" CssClass="buttonLpage"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inStock" ErrorMessage="*Stock is Required" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inPrice" ErrorMessage="*Price is Required" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>     
        <asp:Label ID="lbltest" runat="server" cssclass="SQLValidator" Text=""></asp:Label>                     
    </div>  

    <div class="signuprow" id="divdelete" runat="server">     
        <h2>View and Delete your Listings</h2>
        <p style="margin-top: 10px; margin-bottom: -32px;">*All fields are required.<br />*Select a Listing ID to view details.</p>

        <asp:SqlDataSource ID="sqlDSListSelect" runat="server" ConnectionString="<%$ ConnectionStrings:PlayerVaultConnectionString %>" SelectCommand="SELECT ListingID FROM Listings WHERE UserID = @UserID">
            <selectparameters>
		        <asp:sessionparameter name="UserID" sessionfield="UserID" type="Int32" />
	        </selectparameters>
        </asp:SqlDataSource>       
        <asp:SqlDataSource ID="sqlDSListShow" runat="server" ConnectionString="<%$ ConnectionStrings:PlayerVaultConnectionString %>" SelectCommand="SELECT Listings.ListingID, Games.Name, Listings.Stock, Listings.Price FROM Listings INNER JOIN Games ON Games.GameID = Listings.GameID WHERE UserID = @UserID AND Listings.ListingID = @ListingID">
            <SelectParameters>
                <asp:sessionparameter name="UserID" sessionfield="UserID" type="Int32" />
                <asp:ControlParameter ControlID="sqlListSelect" Name="ListingID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource> 

        <div class="signupcontainer">                
            <asp:DropDownList ID="sqlListSelect" runat="server" DataSourceID="sqlDSListSelect" DataTextField="ListingID" DataValueField="ListingID" cssclass="ddlGamesSell" AutoPostBack="true"></asp:DropDownList>
        </div>

        <div class="dvcontainer" style="border: 5px solid #c3073f; min-height: 50px;">
            <asp:DetailsView ID="dvListing" runat="server" Width="550px" DataSourceID="sqlDSListShow" BackColor="#1A1A1D" BorderColor="#C3073F" BorderStyle="Solid"  CellPadding="4" GridLines="Horizontal" HorizontalAlign="Center" AutoGenerateRows="false" DataKeyNames="ListingID">
                <Fields>
                    <asp:BoundField DataField="ListingID" HeaderText="ID:" SortExpression="Listings.ListingID">
                    <ItemStyle Width="200px" Wrap="False" BorderColor="#C3073F" BorderStyle="Solid"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Game:" SortExpression="Games.Name" >
                    <ItemStyle  Width="200px" Wrap="False" BorderColor="#C3073F" BorderStyle="Solid" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock"  DataFormatString="{0:N0}" HeaderText="Listings.Stock:" SortExpression="Stock">
                    <ItemStyle  Width="200px" BorderStyle="Solid" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" DataFormatString="{0:c7}" HeaderText="Price per Unit:" SortExpression="Listings.Price">
                    <ItemStyle  Width="200px" BorderStyle="Solid" />
                    </asp:BoundField>
                </Fields>
                <RowStyle  ForeColor="#ffffff" />
            </asp:DetailsView>                        
        </div>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="buttonLpage" OnClientClick="return Delete()" />
    </div>  

    <script type="text/javascript">
        function Delete() {
            if(confirm('Delete this Listing?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

