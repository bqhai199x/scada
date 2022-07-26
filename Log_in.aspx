<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log_in.aspx.cs" Inherits="MET_Station.Log_in" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Hệ thống quan trắc thời tiết</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords"
        content="Report Login Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!-- //Meta tag Keywords -->
    <link href="//fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700;900&display=swap" rel="stylesheet">
    <!--/Style-CSS -->
    <link rel="stylesheet" href="assets/css/style.css" type="text/css" media="all" />
    <!--//Style-CSS -->

    <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css" media="all">

    <style type="text/css">
        .auto-style2 {
            text-align: center;
            margin-left: 141px;
        }
        .auto-style3 {
            width: 403px;
            margin-right: 0px;
        }
    </style>

</head>

<body>

    <!-- form section start -->
    <section class="w3l-hotair-form">
        <h1>TRẠM QUAN TRẮC THỜI TIẾT</h1>
        <div class="container">
            <!-- /form -->
            <div class="workinghny-form-grid">
                <div class="main-hotair">
                    <div class="content-wthree">
                        <h2>Đăng Nhập</h2>
                        <form id="form1" runat="server" class="auto-style3">
                            <asp:TextBox ID="txttaikhoan" runat="server" Width="357px"></asp:TextBox>
                            <ajaxToolkit:TextBoxWatermarkExtender ID="txttaikhoan_TextBoxWatermarkExtender" runat="server" BehaviorID="txttaikhoan_TextBoxWatermarkExtender" TargetControlID="txttaikhoan" WatermarkText="Tài Khoản" />
&nbsp;<asp:TextBox ID="txtmatkhau" runat="server" Width="358px" TextMode="Password"></asp:TextBox>
                            <ajaxToolkit:TextBoxWatermarkExtender ID="txtmatkhau_TextBoxWatermarkExtender" runat="server" BehaviorID="txtmatkhau_TextBoxWatermarkExtender" TargetControlID="txtmatkhau" WatermarkText="Mật khẩu" />
                            <asp:Button ID="btdangnhap" runat="server" BackColor="#D291BC" CssClass="auto-style2" ForeColor="White" Text="Đăng Nhập" Width="122px" OnClick="btdangnhap_Click" />
                        
                        <p class="account">Bạn chưa có tài khoản ? <a href="#signup">Đăng ký</a></p>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </form>
                    </div>
                    <div class="w3l_form align-self">
                        <div class="left_grid_info">
                            &nbsp;<img src="assets/images/loginimage.png" alt="" class="img-fluid"></div>
                    </div>
                </div>
            </div>
            <!-- //form -->
        </div>
        <!-- copyright-->
        <div class="copyright text-center">
            <p class="copy-footer-29">© 06-2022 Hệ thống quan trắc thời tiết  |  Phát triển bởi nhóm 7</p>
        </div>
        <!-- //copyright-->
    </section>
    <!-- //form section start -->
</body>

</html>