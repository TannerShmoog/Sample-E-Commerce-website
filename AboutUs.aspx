<%@ Page Title="PlayerVault - About Us" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AboutUs.aspx.vb" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">          
    <asp:Button ID="btnAboutUs" runat="server" Text="About Us" CssClass="buttonaboutus" style="top: 80px;"/>
    <asp:Button ID="btnRefund" runat="server" Text="Refund Policy" CssClass="buttonaboutus" style="top: 160px;"/>
    <asp:Button ID="btnTerms" runat="server" Text="Terms of Use" CssClass="buttonaboutus" style="top: 240px;"/>
    <asp:Button ID="btnPrivacy" runat="server" Text="Privacy Policy" CssClass="buttonaboutus" style="top: 320px;"/>            
    <img src="Images/Icons/pv-bg-white-64.png" id="imgaboutusmain" runat="server" style="display: block; margin-left: auto; margin-right: auto; width: 128px; height: 128px; position: absolute; top: 80px; left: 50%; transform: translate(-50%, 0);"/>

    <div class="privacyterms" id="divaboutus" runat="server">
        <h1>About Us</h1>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p style="font-weight: bold; text-align: center; margin-top: 16px;">Player Vault aspires to be the best experience in peer to peer trading the gaming industry has to offer. Founded in August of 2021 by CEO and proprietor Tanner Loeppky and located at 7 Galaxy Lane, Red Deer, Alberta, P1V 7L3, PlayerVault is a premier exchange for any in game currency a player cares to list. We at PlayerVault are open about our business model, which is why you, the user, should know: our cut is 5%. That's it. No hidden fees or charges. Users will be given site balance for their sales, and if available this will be used first before charging your credit card. Users will be paid out any balance above $1.00 on the 1st of each month. We value transparency and customer service, so please dont hesitate to <a href="mailto:tdl@playervault.com">Contact Us</a></p>
        <p style="text-align: center; margin-top: 16px;">We comply with all Canadian E-Commerce Requirements which can be found <a href="https://www.canada.ca/en/revenue-agency/services/tax/businesses/topics/e-commerce/e-commerce.html">Here</a>. If something seems wrong to you, please let us know.</p>
        <h2>Company Officers</h2>
        <ul>
            <li>Tanner Loeppky - CEO, Owner, Operations Manager, Web Designer</li>
            <li>Oliver Chan - Legal Team Lead</li>
            <li>Linda Huang - Graphics and Art</li>
        </ul>
    </div>

    <div class="privacyterms" id="divrefund" runat="server">
        <h1>Refund Policy</h1>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p style="font-weight: bold; margin-top: 16px; text-align: center;">Player Vault ("us", "we", or "our") owns and operates the https://playervault.com website (the "Service"). Since auctions are listed, managed and discharged by fellow users of our Service, we are not liable for non-executed transactions or for returns, but we will provide users who feel that they have not recieved the product they have paid for with equivalent site credit. Users that consistently renege on their auctions will be banned from using the Service.</p>
    </div>

    <div class="privacyterms" id="divterms" runat="server">
        <h1>Website Terms and Conditions of Use</h1>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <h2>1. Terms</h2>
        <p>By PlayerVault from https://playervault.com, agree to the following Terms and Conditions of Use. If you disagree with any of these terms, you may not access this site. </p>
        <h2>2. Use License</h2>
        <p>Users may download a copy of Player Vault LLC's Website for personal use only. You may not:</p>
        <ul>
            <li>modify or redistribute our materials</li>
            <li>reverse engineer our software</li>
        </ul>
        <p>Player Vault LLC will terminate your viewing rights upon violations of any of these restrictions.</p>
        <h2>3. Disclaimer</h2>
        <p>Player Vault LLC’s Website is provided "as is". Player Vault LLC makes no warranties, except where set out in our refund policy.</p>
        <h2>4. Revisions and Errata</h2>
        <p>Player Vault LLC may change the materials contained on its Website at any time without notice, usually to correct errors or make revisions, but we are not bound to update our materials.</p>
        <h2>5. Links</h2>
        <p>Player Vault LLC makes no guarantees about the content or safety of links to external sites on our website, nor does this imply that we endorse said site. Use of these external links is at the user's risk</p>
        <h2>6. Site Terms of Use Modifications</h2>
        <p>Player Vault LLC may revise these Terms of Use for its Website at any time without prior notice. By using this Website, you are agreeing to be bound by the current version of these Terms and Conditions of Use.</p>
        <h2>7. Your Privacy</h2>
        <p>Please read our Privacy Policy.</p>
        <h2>8. Governing Law</h2>
        <p>Any claim related to Player Vault LLC's Website will be dealt with according to Canadian Law exclusively.</p>
    </div>

    <div class="privacyterms" id="divprivacy" runat="server">
        <h1>Privacy Policy</h1>
        <img src="Images\Icons\pv-bg-white-64.png" style="display: block; margin-left: auto; margin-right: auto; "/>
        <p>Last updated: August 30, 2021</p>
        <p>PlayerVault is committed to protecting our users’ privacy to the highest standard. Below is an overview of how we will collect, manage, and disclose your information. By using our service, you agree to allow us to use your information as set out in this policy.</p>
        <h1>Collecting and Using Your Personal Data</h1>
        <h2>Types of Data Collected</h2>
        <p style="font-weight: bold;">Personal Data</p>
        <p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>
        <ul>
        <li>
        <p>Email address</p>
        </li>
        <li>
        <p>First name and last name</p>
        </li>
        <li>
        <p>Display Name</p>
        </li>
        <li>
        <p>Password</p>
        </li>
        <li>
        <p>Credit Card Information</p>
        </li>
        <li>
        <p>Usage Data</p>
        </li>
        </ul>
        <p>We also collect Usage Data which includes your Internet Protocol Address, Browser Information, Hardware Information, information about sales and purchases you make, and other diagnostic data. We only make use of a single session cookie on your device to keep track of your session ID, which is deleted when you close your web browser. </p>
        <h2>Use of Your Personal Data</h2>
        <p>The Company may use Personal Data for the following purposes:</p>
        <ul>
        <li>
        <p><strong>To provide and maintain our Service</strong></p>
        </li>
        <li>
        <p><strong>To manage Your PlayerVault Account</strong></p>
        </li>
        <li>
        <p><strong>To contact You:</strong> To contact You via the email you provide at registration, about the status of your account, purchases, use of our service, or updates.</p>
        </li>
        <li>
        <p><strong>For Data Analysis</strong></p>
        </li>
        </ul>
        <p>We may share Your personal information where appropriate with 3rd party service providers relevant to our service, other users where information is publicly displayed, or for any other reason with consent.</p>
        <h2>Retention, Transfer, Disclosure</h2>
        <p>PlayerVault retains user data for as long as necessary to facilitate use of our service, and to comply with our legal obligations, as well as anonymized usage data for internal analysis. Your data may be securely transferred to and maintained on any of our servers in various locations.</p>
        <p>We may disclose your data in the case of a company merger, in which it will be transferred to the new company, or in circumstances where we are legally required to disclose your information. We may also use your data to protect the rights and property of our company or the safety of other users of our service.</p>
        <h1>Changes to this Privacy Policy</h1>
        <p>We may update Our Privacy Policy and will keep this page up to date at all times, as well as notifying users by email.</p>
        <h1>Contact Us</h1>
        <p>We comply with all data protection standards and laws in the countries in which we operate.</p>
        <p>If you have any questions about this Privacy Policy, or to request viewing or erasure of your data, You can <a href="mailto:tdl@playervault.com">Contact Us</a></p>
    </div>
</asp:Content>

