<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ValidateRequest="false" %>

<!DOCTYPE html>

<html runat="server">


<!-- Mirrored from affixtheme.com/html/xmee/demo/login-4.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Sep 2020 14:37:40 GMT -->
<head runat="server">
    <title>Veritas University | Result Processing</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="federal.jpg" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="floating-whatsapp-master/floating-wpp.css" rel="stylesheet" />

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
    <form runat="server" id="form1" class="login-reg-panel">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="login-info-box text-white ">
                <h2>Staff Login</h2>
                <p>Federal Government Girls College, Bwari</p>
                <label id="label-register" for="log-reg-show">Staff Login</label>
                <input type="radio" name="active-log-panel" id="log-reg-show" checked="checked" />
            </div>

            <div class="register-info-box text-white ">
                <h2>Student Login</h2>
                <p>Enter your username and password.</p>
                <label id="label-login" for="log-login-show">Student Login</label>
                <input type="radio" name="active-log-panel" id="log-login-show" />
            </div>

            <div class="white-panel">
                <asp:Panel ID="pnlAlert" runat="server" CssClass="alert alert-danger" Visible="false">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <span id="spIcon" runat="server"></span>
                    <asp:Label ID="lblMsg" CssClass="text-white " runat="server" Text=""></asp:Label>
                </asp:Panel>
                <div class="login-show">
                    <img src="federal.jpg" style="width: 3em; height: 3em" />
                    <h2>STAFF LOGIN</h2>
                    <input type="text" runat="server" id="username" placeholder="Username" />
                    <input type="password" runat="server" id="password" placeholder="Password" />
                    <input type="button" runat="server" onserverclick="loginClick" id="btnLogin" value="Login" />
                    <a href="#" runat ="server" visible ="false" >Forgot password?</a>
                </div>
                <div class="register-show">
                    <asp:Panel ID="PanelStudentAlert" runat="server" CssClass="alert alert-danger" Visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span id="Span1" runat="server"></span>
                        <asp:Label ID="Label1" CssClass="text-white " runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    <img src="federal.jpg" style="width: 3em; height: 3em" />
                    <h2>STUDENT LOGIN</h2>
                    <input type="text" placeholder="Email" />
                    <input type="password" placeholder="Password" />

                    <input type="button" value="Login" />
                </div>
            </div>
        </div>


        <script src="js/jquery-3.5.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/JavaScript.js"></script>
        <%--<script src="floating-whatsapp-master/floating-wpp.min.js"></script>
          <script type="text/javascript">
            $(function () {
                $('#WAButton').floatingWhatsApp({
                    phone: '+2347031268439', //WhatsApp Business phone number
                    headerTitle: 'Chat with us on our AI Chatbot!', //Popup Title
                    popupMessage: 'Welcome to Veritas University Result Processing, how can we help you?', //Popup Message
                    showPopup: true, //Enables popup display
                    buttonImage: '<img src="img/VeritasPngs.png" />', //Button Image
                    headerColor: '#28a745', //Custom header color
                    backgroundColor: 'transparent', //Custom background button color
                    position: "left" //Position: left | right

                });
            });
        </script>--%>
        <script>
            function isNumber(evt, element) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (
                    (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
                    (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
                    (charCode < 48 || charCode > 57))
                    return false;

                return true;
            }
        </script>
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();

            (function () {
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/5e9cb58835bcbb0c9ab2b7ae/default';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
    </form>
    <div id="WAButton"></div>
</body>

</html>
