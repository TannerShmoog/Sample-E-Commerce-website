<%@ Page Title="PlayerVault - Log In" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LogIn.aspx.vb" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" postback="true">
    <div class="signuprow">     
        <h2>Already Have an Account? Log In</h2>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p style="margin-top: 10px; margin-bottom: -32px;">*All fields are required.</p>

        <div class="signupcontainer">                
            <div class="fields">
                <span>
                    <asp:TextBox id="loginEmail" placeholder="Email" runat="server"></asp:TextBox>
                </span>
                <span>
                    <asp:TextBox id="loginPassword" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                </span>
            </div>
        </div>
        
        <asp:Button ID="btnLoginLpage" runat="server" Text="Log In" CssClass="buttonLpage"/>  
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="loginEmail" ErrorMessage="*Email is Required" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="loginPassword" ErrorMessage="*Password is Required" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
        <asp:Label ID="lbltest" runat="server" cssclass="SQLValidator" Text=""></asp:Label>
        <asp:ValidationSummary ID="validationSummaryLogin" runat="server" HeaderText="Problems Found:" DisplayMode="BulletList" ForeColor="Red" Cssclass="validatorsumLpage"/>
        <h2 style="margin-top: 32px;">Need an account?</h2>
        <asp:Button ID="btnSignUpLpage" runat="server" Text="Sign Up" CssClass="buttonLpage" PostBackUrl="~/SignUp.aspx" CausesValidation="false"/>  
    </div>        
</asp:Content>

