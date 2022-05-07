<%@ Page Title="PlayerVault - Credits" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Bibliography.aspx.vb" Inherits="Bibliography" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="privacyterms">
        <h1>Bibliography</h1>
        <h2>Graphics/Icons</h2>
        <ul>
            <li><a href="https://www.deviantart.com/popokupingupop90/art/Path-of-Exile-Chieftain-Wallpaper-635186534">Home Page Banner Left</a></li>
            <li><a href="https://www.teahub.io/viewwp/iRoihoR_world-of-warcraft-landscape-art/">Home Page Banner Right</a></li>      
            <li><a href="https://icons8.com/icon/set/ecommerce/material-outlined">Button Icons</a> (link in footer as required by their license)</li>
            <li>Site Logo - Linda Huang <br />(Artist, a friend who made the site logo for me.)</li>
            <li><a href="https://www.reddit.com/r/burningcrusade/">WoW TBC Icon</a></li>
            <li><a href="https://us.forums.blizzard.com/en/wow/">WoW Icon</a></li>
            <li><a href="https://www.deviantart.com/doctor-cool/art/Final-Fantasy-XIV-Dalamud-Token-Icon-479769343">FFXIV Icon</a></li>
            <li><a href="https://www.reddit.com/r/pathofexile/comments/4xjdfa/fanartresource_a_clean_poe_logo/">PoE Icon</a></li>
            <li><a href="https://www.freeiconspng.com/img/43825">BnS Icon</a></li>
            <li><a href="https://api.loothunt.com/img/offers/779066510/icon.png?1613847669">BnS Gold Icon</a></li>
            <li><a href="https://api.loothunt.com/img/offers/913101298/icon.png?1539694536">WoW Gold Icon</a></li>
            <li><a href="https://gamerchoice.eu/product/exalted-orb-xbox/">PoE Exalted Orb Icon</a></li>
        </ul>
        <h2>Css/Styles/Code</h2>
        <ul>
            <li><a href="https://www.awwwards.com/sites/in-pieces">Color Palette</a></li>
            <li><a href="https://codepen.io/RicardoTormo/pen/tuzcA">Form Style</a> (some parts borrowed)</li>      
            <li>Credit Card validation from CMIS ValleyView example website was adapted</li>      
            <li><a href="https://stackoverflow.com/questions/30862127/hashing-password-in-asp-net-and-resolving-it-in-sql-procedure">VB GetMD5Hash Function</a></li>
            <li><a href="https://stackoverflow.com/questions/9732455/how-to-allow-only-integers-in-a-textbox">To only allow numbers in a text box</a></li>
        </ul>
        <h2>Policy Information</h2>
        <ul>
            <li><a href="https://www.termsfeed.com/">Privacy Policy</a></li>
            <li><a href="https://www.termsofservicegenerator.net/">Terms of Service</a></li>      
            <li>Refund Policy - Oliver Chan <br />(McGill University, Faculty of Law. Author is a friend who helped me work on the policy.)</li>   
        </ul>

        <h1>README</h1>
        <ul>
            <li style="font-size: 18px; font-weight: bold;">The function for deleting a row is on the sell page, it is only visible if logged into an account which has MORE THAN 0 Listings. Log in and create a listing to see this</li>
            <li style="font-weight: bold;">Logic for Log In and Sign Up is now complete:</li>   
            <li style="list-style: none;">
                <ul style="margin-left: 32px;">
                    <li>Log in will only accept a valid email/password combination from the database, and passwords are stored as a hash.</li>
                    <li>Sign up will now check that the email isnt registered and, if available, add it to the database before logging the user in.</li>
                    <li style="font-size: 16px; font-weight: bold;">If the user logs in or signs up, then immediately presses the back button on the browser, the page will be expired. This is INTENTIONAL behaviour and consistent with most websites from my testing.</li>
                    <li>If the user tries to create a listing while not logged in, they will be redirected to the log in page and redirected back to Sell upon successful log in or sign up.</li>
                    <li>If the user clicks to confirm a purchase on the check out page, they will be redirected to the log in page and redirected back to Sell upon successful log in or sign up.</li>
                    <li>Password and username, and full name are stored case sensitively. Email is not, since people expect case sensitivity on the password for their login, but not the email.</li>
                </ul>
            </li>
            <li>Some elements are visible or not based on whether the user is logged in, to see this log in as a test user, or sign up an account and log into it.</li>
            <li style="font-weight: bold;">Changes from original Design Document:</li>
            <li  style="list-style: none;">
                <ul style="margin-left: 32px;">
                    <li>Sign Up now also collects a display name, this is shown in the nav bar instead of email.</li>
                    <li>If sufficient balance is available and the user makes a purchase, it will be subtracted. If this new balance will be below 0, it is instead set to 0 and a credit card charge is implicit for the remaining cost.</li>
                    <li>Check out page will no longer ask for a user's email and password to confirm the purchase, and will instead ask for the user' in-game name to collect their purchase on.</li>
                </ul>
            </li>
            <li style="font-weight: bold;">I found the vs express design page editor to be frustrating to work with and get things to align as I wanted, so much of the html is written manually, but is well tested and works. There was no specific instruction not to do this in the assignment document so I hope this is fine.</li>
            <li>For your convenience, some valid user logins to test:</li>
            <li  style="list-style: none;">
                <ul style="margin-left: 32px;">
                    <li>user: weirdemail@protonmail.com |   pass: forg0TPass</li>
                    <li>user: gametycoon@hotmail.com    |   pass: stacks0Nstacks</li>
                    <li>user: reckful@gmail.com         |   pass: catsandDogs123</li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

