<%@ Page Title="PlayerVault - Sign Up" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" postback="true">
    <div class="signuprow">     
        <h2>Sign up for PlayerVault</h2>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p style="margin-top: 10px; margin-bottom: -32px;">*All fields are required.</p>

        <div class="signupcontainer">                
            <div class="fields">
                <span>
                    <asp:TextBox id="inDisplayName" placeholder="Display Name" runat="server" MaxLength="20"></asp:TextBox>   
                </span>
                <span>
                    <asp:TextBox id="inEmail" placeholder="Email" runat="server" MaxLength="64"></asp:TextBox>
                </span>
                <span>
                    <asp:TextBox id="inPassword" placeholder="Password" runat="server" EnableViewState="False" TextMode="Password" MaxLength="20"></asp:TextBox>
                </span>
                <span>
                    <asp:TextBox id="inName" placeholder="Full Name (First Last)" runat="server" MaxLength="64"></asp:TextBox>
                </span>
                <span>
                    <asp:TextBox id="inCC" placeholder="Credit Card Number" runat="server" MaxLength="19" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                </span>
                <span>
                    <asp:DropDownList ID="inExpiryMonth" runat="server" cssclass="expiryentry">
                        <asp:ListItem Selected="True">01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="inExpiryYear" runat="server" cssclass="expiryentry" style="width: 120px;">
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span>
                    <asp:TextBox id="inCVV" placeholder="CVV Code" runat="server" MaxLength="4" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                </span>
            </div>
        </div>

        <asp:Button ID="btnSignupSpage" runat="server" Text="Sign Up" CssClass="buttonLpage"/>     
        <asp:Label ID="lbltest" runat="server" cssclass="SQLValidator" Text=""></asp:Label>                     
        <h2 style="margin-top: 32px;">Already have an account?</h2>
        <asp:Button ID="btnLoginSpage" runat="server" Text="Log In" CssClass="buttonLpage" PostBackUrl="~/LogIn.aspx" CausesValidation="false"/>  
    </div>       
    
    <div class="validatorcontainer">
        <ul style="list-style: none;">
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inDisplayName" ErrorMessage="*Display name is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inEmail" ErrorMessage="*Email is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="inPassword" ErrorMessage="*Password is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="inName" ErrorMessage="*Full Name is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="inCC" ErrorMessage="*Credit Card Number is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>           
            <li><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="inCVV" ErrorMessage="*CVV Number is Required" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RequiredFieldValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="inDisplayName" ErrorMessage="*Display name may only contain a-Z, 0-9, _" ValidationExpression="^\w+$" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="inDisplayName" ErrorMessage="*Display must be 6 to 20 characters long" ValidationExpression=".{6,20}" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="inEmail" ErrorMessage="*Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="inPassword" ErrorMessage="*Password must be 10 to 20 characters long, contain a<br />capital letter, lowercase letter, and a number" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{10,20}$" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="inName" ErrorMessage="*Full name must be 2 words (First Last) and only contain letters" ValidationExpression="^[a-zA-Z]{1,31} [a-zA-Z]{1,31}$" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
            <li><asp:CustomValidator ID="valCC" runat="server" ControlToValidate="inCC" ErrorMessage="*Card number is invalid (Only Visa, American Express, MasterCard are accepted)" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:CustomValidator></li>
            <li><asp:CustomValidator ID="valExpiry" runat="server" ControlToValidate="inExpiryMonth" ErrorMessage="*Card is expired" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:CustomValidator></li>
            <li><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="inCVV" ErrorMessage="*Invalid 3-4 digit CVV code" ValidationExpression="^[0-9]{3,4}$" ForeColor="Red" Display="Dynamic" cssclass="validatorLpage"></asp:RegularExpressionValidator></li>
        </ul>
    </div>     
</asp:Content>

