﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Cart.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Styles.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/tongquan">
                <img src="Images/logo.png" /></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Propeller Dropdown -->
                <div class="dropdown pmd-dropdown pl-5">
                    <button class="btn pmd-ripple-effect btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">Danh mục sản phẩm</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
                <div class="form-inline my-2 my-lg-0 pl-3">
                    <asp:TextBox ID="txtSearch" class="form-control" placeholder="Thông tin tìm kiếm" aria-label="Search" runat="server" Width="500px"></asp:TextBox>
                    <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Tìm kiếm" Height="38px" Width="120px" />
                </div>
                <div class="form-inline my-2 my-lg-0 pl-5">
                    <i class="fa-regular fa-circle-user fa-2xl"></i>
                    <asp:Label ID="sessionID" Class="pl-3" runat="server"> Mắc mệt</asp:Label>
                </div>
            </div>
        </nav>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="Images/Content/content.jpg" alt="First slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Images/Content/content1.jpg" alt="Second slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Images/Content/content2.jpg" alt="Third slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Images/Content/content3.jpg" alt="Third slide" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="Images/Content/content4.jpg" alt="Third slide" />
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="container-fluid" style="width: 95%; margin-top: 2%">

            <!-- <div class="col-md-2 justify-content-right text-left">
                    <div class="menulist" style="border: 50px">
                        <div class="nav flex-column nav-pills zoom" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="background-color: darkblue; border-radius: 5px; position: relative;">
                            <div class="text-center" style="background-color: red; height: 40px; border-radius: 5px;"><b>Danh mục sản phẩm </b></div>
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Danh Mục</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Laptop</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Tivi</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Điện thoại</a>
                        </div>
                    </div>
                </div> -->
            <div class=" justify-content-right text-left">
                <div class="row">
                    <h2>Laptop Deals Sốc Giảm Tới 10.000.000đ</h2>
                </div>
                <asp:DataList ID="DataList1" BorderRadius="15px" runat="server" BackColor="Cyan" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="6" CellSpacing="6" DataSourceID="PRODUCTS" RepeatColumns="6" RepeatDirection="Horizontal" Width="1150px">
                    <ItemTemplate>
                        <div class="card-deck">
                            <div class="card zoom">
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="redirect" Height="139px" Width="208px" ImageUrl='<%# Eval("ANHSP") %>' />
                                <div class="card-body" style="font-size: 11px">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TENSP") %>' />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("DONGIA") %>' />
                                    <br />
                                    M.HÌNH
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("MANHINH") %>' />
                                    <br />
                                    CHIP
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CPU") %>' />
                                    <br />
                                    CARD 
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("VGA") %>' />
                                    <br />
                                    PIN
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pin") %>' />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="PRODUCTS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TENSP], [ANHSP], [DONGIA], [MANHINH], [CPU], [VGA], [PIN] FROM [LapTopsDeals]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
    <script src="bootstrap/jquery-3.6.0.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="https://kit.fontawesome.com/45128a02cf.js" crossorigin="anonymous"></script>
</body>
</html>