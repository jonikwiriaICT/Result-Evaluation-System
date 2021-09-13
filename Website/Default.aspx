<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ValidateRequest="false" %>

<!DOCTYPE html>

<html runat="server">


<!-- Mirrored from affixtheme.com/html/xmee/demo/login-4.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Sep 2020 14:37:40 GMT -->
<head runat="server">
    <title>Veritas University</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="#" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="WebsiteCss.css" rel="stylesheet" />


    <style>
        body, html {
            height: 100%;
            /* Full height */
            height: 100%;
            /* Center and scale the image nicely */
        }

        ::-webkit-scrollbar {
            width: 20px;
        }


        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: white;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #28a745;
            }
    </style>

</head>

<body>
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
	
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Staff Login</a></li>
				<li><a href="#0">Student Login</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
				<div class="cd-form">
					 <asp:Panel ID="pnlAlert" runat="server" CssClass="alert alert-danger" Visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span id="spIcon" runat="server"></span>
                        <asp:Label ID="lblMsg" CssClass="text-white " runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    <p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" runat ="server"  id="username" type="text"  placeholder="username"/>
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" runat ="server"  id="password" type="password"  placeholder="Password"/>
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

				

					<p class="fieldset">
						<input class="full-width" runat ="server" onserverclick ="loginClick"  type="submit" value="Login"/>
					</p>
				</div>
				
				<p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<div class="cd-form">
					 <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-danger" Visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span id="Span1" runat="server"></span>
                        <asp:Label ID="Label1" CssClass="text-white " runat="server" Text=""></asp:Label>
                    </asp:Panel>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">Matric Number</label>
						<input class="full-width has-padding has-border" runat ="server"  id="MatricNumber" type="text" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="studentPassword" type="password" runat ="server"   placeholder="Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Create account">
					</p>
				</div>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->

			<a href="#0" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->

        <script src="js/jquery-3.5.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="WebsiteJavascript.js"></script>
     
    </form>
 
</body>

</html>
