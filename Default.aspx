<%@ Page Title="PlayerVault" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        #TextArea1 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style1 {
            width: 128px;
            height: 128px;
        }
    </style>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <div class="homepagecontainer">
        <h1 style="z-index: 3;">PlayerVault</h1>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <h2>Free Trade for Every Online World</h2>
        <p><label>Click the Sign Up button below to get started trading with players from all around the world, in every virtual world. Or if you are already logged in, click Buy or Sell. All of PlayerVault's listings are made by players, and our business policies are openly available on our About Us page.</label></p>

        <table class="buttontable"  cellpadding="0" cellspacing="16" class="auto-style1">
            <tr>
                <td><asp:Button ID="btnBuy" runat="server" Text="Buy" CssClass="button"  PostBackUrl="~/Buy.aspx"/></td>
                <td><asp:Button ID="btnSell" runat="server" Text="Sell" CssClass="button"  PostBackUrl="~/Sell.aspx"/></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnSignUp" runat="server" Text="Log In" CssClass="button"  PostBackUrl="~/LogIn.aspx"/></td>
                <td><asp:Button ID="btnAboutUs" runat="server" Text="About Us" CssClass="button"  PostBackUrl="~/AboutUs.aspx"/></td>
            </tr>
        </table>
    </div>   
</asp:Content>

