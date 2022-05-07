<%@ Page Title="PlayerVault - Check Out" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CheckOut.aspx.vb" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <h1>Check Out</h1>   
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

    <div class="checkoutpagecontainer">
        <div class="checkoutbox">
            <h3 id="sellerinfo" runat="server">Seller: </h3>
            <h3 id="stockinfo" runat="server">Stock: </h3>
            <h3 id="priceinfo" runat="server">Price per Unit: </h3>
            <h3 style="text-align: center; margin-left: 300px; color: red;">Purchases are rounded to the nearest Canadian $0.01.</h3>
            <h3 style="text-align: center; margin-left: 300px; color: red;">Please make sure you are online on the in-game name you submit to collect your purchase.</h3>         
        </div>   
        <div class="checkoutboxform">
            <div class="signupcontainer" style="top: -150px;">  
                <div class="fields">
                    <span>
                        <asp:TextBox id="inIGN" placeholder="In-Game Name" runat="server" MaxLength="64" OnTextChanged="quantity_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                    </span>
                    <span>
                        <asp:TextBox id="inQuantity" placeholder="Quantity" runat="server" MaxLength="18" CausesValidation="True" OnTextChanged="quantity_OnTextChanged" AutoPostBack="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" Text=""></asp:TextBox>
                    </span>
                </div>              
            </div>
            <div class="validatorcontainercheckout">
                <ul style="list-style: none;">
                    <li><asp:Label ID="lbltotal" runat="server" cssclass="lblCheckout" Text=""></asp:Label> </li>
                    <li><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inQuantity" ErrorMessage="*Quantity is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
                    <li><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inIGN" ErrorMessage="*In-Game Name is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
                    <li><asp:label ID="valQuantity" runat="server" ControlToValidate="inQuantity" ErrorMessage="*Quantity must be an integer and less<br/>than or equal to available stock." ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:label></li>
                </ul>
            </div> 
            <asp:Button ID="btnBuyConfirm" runat="server" Text="Confirm" CssClass="buttonLpage"/>
        </div>
    </div>
</asp:Content>

