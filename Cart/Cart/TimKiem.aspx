<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="Cart.TimKiem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <a class="navbar-brand pl-3" href="/home">
                <img src="Images/logo.png" /></a>
            <div class="collapse navbar-collapse pl-5" id="navbarSupportedContent">
                <!-- Propeller Dropdown -->
                <div class="dropdown pmd-dropdown ">
                    <button class="btn pmd-ripple-effect btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="true">Danh mục sản phẩm</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/DanhsachTivi.aspx">TiVi</a>
                        <a class="dropdown-item" href="/DanhSachDienThoai.aspx">Điện thoạt</a>
                        <a class="dropdown-item" href="/DanhSachLaptops.aspx">lapTop</a>
                    </div>
                </div>
                <div class="form-inline my-2 my-lg-0 pl-3">

                    
                    <asp:TextBox ID="txtSearch" class="form-control" placeholder="Thông tin tìm kiếm" aria-label="Search" runat="server" Width="500px"></asp:TextBox>
                    <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Tìm kiếm" Height="38px" Width="120px" OnClick="btnSearch_Click" />
                </div>
               <div class="form-inline my-2 my-lg-0 pl-5" style="color: white">
                    <i class="fa-regular fa-circle-user fa-2xl"></i>
                    <asp:Label ID="user" Class="pl-3" runat="server" ForeColor="White"></asp:Label>
                </div>
                <div class="form-inline my-2 my-lg-0 pl-5">
                    <a href="/GioHang.aspx">
                        <button type="button" class="btn btn-primary">
                            <i class="fa-solid fa-cart-shopping fa-xl pr-2"></i>
                            Giỏ hàng</button>
                    </a>
                </div>
            </div>
        </nav>
        <div class="container-fluid" style="width: 95%; margin-top: 2%">


            <div class=" justify-content-right text-left">
                <div>
                    <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label2" runat="server" ForeColor="White"></asp:Label>

                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Masp" DataSourceID="SqlDataSource1" BorderRadius="15px" BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="6" CellSpacing="6" RepeatColumns="6" RepeatDirection="Horizontal" Width="1150px" OnItemCommand="TimKiemDienThoai">
                        <ItemTemplate>
                            <div class="card-deck">
                                <div class="card zoom" style="height: 300px">
                                    <div class="imgs pt-3">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="redirect" Height="208px" Width="208px" ImageUrl='<%# Eval("HinhAnh") %>' />
                                    </div>
                                    <div class="card-body" style="font-size: 11px">
                                        <asp:Label ID="TenspLabel" runat="server" Text='<%# Eval("Tensp") %>' />
                                        <br />
                                        Giá:
                                            <asp:Label ID="DonGiaLabel" runat="server" Text='<%# Eval("DonGia") %>' />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Masp], [Tensp], [HinhAnh], [DonGia] FROM [DienThoai] WHERE ([Tensp] LIKE '%' + @Tensp + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="Tensp" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>



            <div class=" justify-content-right text-left">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="MASP" DataSourceID="SqlDataSource2" BorderRadius="15px" BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="6" CellSpacing="6" RepeatColumns="6" RepeatDirection="Horizontal" Width="1150px" OnItemCommand="TimKiemLapTops">
                        <ItemTemplate>
                           <div class="card-deck">
                                    <div class="card zoom" style="height: 300px">
                                        <div class="imgs pt-3">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="redirect" Height="139px" Width="208px" ImageUrl='<%# Eval("ANHSP") %>' />
                                        </div>
                                        <div class="card-body" style="font-size: 11px">
                                            <asp:Label ID="TenspLabel" runat="server" Text='<%# Eval("TENSP") %>' />
                                            <br />
                                            Giá:
                                            <asp:Label ID="DonGiaLabel" runat="server" Text='<%# Eval("DONGIA") %>' />
                                        </div>
                                    </div>
                                </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [MASP], [TENSP], [ANHSP], [DONGIA] FROM [Laptops] WHERE ([TENSP] LIKE '%' + @TENSP + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="TENSP" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </div>



            <div class=" justify-content-right text-left">
                <asp:DataList ID="DataList3" runat="server" DataKeyField="Masp" DataSourceID="SqlDataSource3" BorderRadius="15px" BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="6" CellSpacing="6" RepeatColumns="6" RepeatDirection="Horizontal" Width="1150px" OnItemCommand="TimKiemTiVi">
                        <ItemTemplate>
                            <div class="card-deck">
                                <div class="card zoom" style="height: 300px">
                                    <div class="imgs pt-3">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="redirect" Height="130px" Width="208px" ImageUrl='<%# Eval("HinhAnh") %>' />
                                    </div>
                                    <div class="card-body" style="font-size: 11px">
                                        <asp:Label ID="TenspLabel" runat="server" Text='<%# Eval("Tensp") %>' />
                                        <br />
                                        Giá:
                                        <asp:Label ID="DongiaLabel" runat="server" Text='<%# Eval("Dongia") %>' />
                                        <br />
                                        Kích thước:
                                        <asp:Label ID="KichthuocLabel" runat="server" Text='<%# Eval("Kichthuoc") %>' />
                                        <br />
                                    </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Masp], [Tensp], [Dongia], [Kichthuoc], [HinhAnh] FROM [TiVi] WHERE ([Tensp] LIKE '%' + @Tensp + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="Tensp" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </div>
        </div>




        <!-- Footer -->
        <div class="pt-5">
            <footer class="bg-dark text-center text-white pt-3">
                <!-- Grid container -->
                <div class="container p-4">
                    <!-- Section: Social media -->
                    <section class="mb-4 bg-dark p-4">
                        <!-- Facebook -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-facebook-f"></i></a>

                        <!-- Twitter -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-twitter"></i></a>

                        <!-- Google -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-google"></i></a>

                        <!-- Instagram -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-instagram"></i></a>

                        <!-- Linkedin -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-linkedin-in"></i></a>

                        <!-- Github -->
                        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-github"></i></a>
                    </section>
                    <!-- Section: Social media -->

                    <!-- Section: Form -->
                    <section class="">
                        <form action="">
                            <!--Grid row-->
                            <div class="row d-flex justify-content-center">
                                <!--Grid column-->
                                <div class="col-auto">
                                    <p class="pt-2">
                                        <strong>Đăng ký để nhận thống tin khuyến mãi</strong>
                                    </p>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-md-5 col-12">
                                    <!-- Email input -->
                                    <div class="form-outline form-white mb-4">
                                        <input type="email" id="form5Example21" placeholder="Nhập email của bạn đi nào :))" class="form-control" />
                                    </div>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-auto">
                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-outline-light mb-4">
                                        Đăng ký
                                    </button>
                                </div>
                                <!--Grid column-->
                            </div>
                            <!--Grid row-->
                        </form>
                    </section>
                    <!-- Section: Form -->

                    <!-- Section: Text -->
                    <section class="mb-4">
                        <p>
                            CÔNG TY CỔ PHẦN THƯƠNG MẠI - DỊCH VỤ ONE TECH SHOP
                            <br />
                            © 1997 - 2020 Công Ty Cổ Phần Thương Mại - Dịch Vụ One Tech Shop
                            <br />
                            Giấy chứng nhận đăng ký doanh nghiệp: 0304998358 do Sở KH-ĐT TP.HCM cấp lần đầu ngày 30 tháng 05 năm 2007
                        </p>
                    </section>
                    <!-- Section: Text -->

                    <!-- Section: Links -->
                    <section class="">
                        <!--Grid row-->
                        <div class="row">
                            <!--Grid column-->
                            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                                <h5 class="text-uppercase">Hỗ trợ khách hàng</h5>

                                <ul class="list-unstyled mb-0">
                                    <li>Hotline: <a href="tel:1900-6035">1900-6035</a><br>
                                        <span class="text-white">(1000 đ/phút, 8-21h kể cả T7, CN)</span>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/Hotro.aspx" class="text-white">Các câu hỏi thường gặp</a>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/GuiYeuCauHoTro.aspx" class="text-white">Yêu cầu hổ trợ</a>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/HuongDanDatHang.aspx" class="text-white">Hướng dẫn đặt hàng</a>
                                    </li>
                                </ul>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                                <h5 class="text-uppercase">Về One Tech Shop</h5>

                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <a href="https://localhost:44386/GioiThieu.aspx" class="text-white">Giới thiệu</a>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/TuyenDung.aspx" class="text-white">Tuyển Dụng</a>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/TuyenDung.aspx" class="text-white">Chính sách bảo mật thanh toán</a>
                                    </li>
                                    <li>
                                        <a href="https://localhost:44386/TuyenDung.aspx" class="text-white">Chính sách bảo mật thông tin khách hàng</a>
                                    </li>
                                </ul>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                                <h5 class="text-uppercase">Hợp tác và liên kết</h5>

                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <a href="https://tiki.vn/quy-che-hoat-dong-sgdtmdt" class="text-white">Quy chế hoạt động</a>
                                    </li>
                                    <li>
                                        <a href="https://tiki.vn/quy-che-hoat-dong-sgdtmdt" class="text-white">Bán hàng cùng OneTechShop</a>
                                    </li>
                                    <li>
                                        <h5 class="text-uppercase">Chứng nhận bởi</h5>
                                    </li>
                                    <li>
                                        <a href="https://hotro.tiki.vn/s/" rel="noreferrer" aria-label="" target="_blank" style="height: 32px">
                                            <img src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/bo-cong-thuong-2.png" width="32" height="32" alt=""></a>
                                        <a href="http://online.gov.vn/Home/WebDetails/21193" rel="noreferrer" aria-label="" target="_blank" style="height: 32px">
                                            <img src="https://frontend.tikicdn.com/_desktop-next/static/img/footer/bo-cong-thuong.svg" height="32" width="83" alt=""></a>
                                    </li>
                                </ul>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                                <h5 class="text-uppercase">Phương thức thanh toán</h5>

                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <p class="payment">
                                            <span class="icon">
                                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <defs>
                                                        <radialGradient id="paint0_radial_3173:26341" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(16 16) rotate(90) scale(17.7561 28.4098)">
                                                            <stop stop-color="#004D9B"></stop>
                                                            <stop offset="1" stop-color="#002462"></stop>
                                                        </radialGradient>
                                                        <linearGradient id="paint1_linear_3173:26341" x1="-13.6766" y1="0.916464" x2="3.09852" y2="38.1376" gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="#33C3F5"></stop>
                                                            <stop offset="1" stop-color="#2241EC"></stop>
                                                            <stop offset="1" stop-color="#1D3CE7"></stop>
                                                        </linearGradient>
                                                    </defs><path d="M0 12.0235C0 9.9151 0 8.86088 0.410328 8.05557C0.771263 7.34719 1.34719 6.77126 2.05557 6.41033C2.86088 6 3.9151 6 6.02353 6H25.9765C28.0849 6 29.1391 6 29.9444 6.41033C30.6528 6.77126 31.2287 7.34719 31.5897 8.05557C32 8.86088 32 9.9151 32 12.0235V19.9765C32 22.0849 32 23.1391 31.5897 23.9444C31.2287 24.6528 30.6528 25.2287 29.9444 25.5897C29.1391 26 28.0849 26 25.9765 26H6.02353C3.9151 26 2.86088 26 2.05557 25.5897C1.34719 25.2287 0.771263 24.6528 0.410328 23.9444C0 23.1391 0 22.0849 0 19.9765V12.0235Z" fill="url(#paint0_radial_3173:26341)"></path><mask id="mask0_3173:26341" style="mask-type: alpha" maskUnits="userSpaceOnUse" x="0" y="6" width="32" height="20"><rect y="6" width="32" height="20" fill="white"></rect>
                                                    </mask><g mask="url(#mask0_3173:26341)"><path fill-rule="evenodd" clip-rule="evenodd" d="M13.9036 10.25C12.9282 10.25 12.137 11.0445 12.137 12.0248C12.137 13.0043 12.9282 13.7997 13.9036 13.7997C14.879 13.7997 15.6711 13.0043 15.6711 12.0248C15.6711 11.0445 14.879 10.25 13.9036 10.25ZM13.9036 13.492C13.1553 13.492 12.5512 12.8835 12.5512 12.1341C12.5512 12.0047 12.5693 11.8811 12.6037 11.7613H15.2044C15.2388 11.8811 15.2579 12.0047 15.2579 12.1341C15.2579 12.8835 14.6518 13.492 13.9036 13.492ZM22.7325 10.25C21.7571 10.25 20.9649 11.0445 20.9649 12.0248C20.9649 13.0043 21.7571 13.7997 22.7325 13.7997C23.7088 13.7997 24.5 13.0043 24.5 12.0248C24.5 11.0445 23.7088 10.25 22.7325 10.25ZM22.7325 13.492C21.9852 13.492 21.3791 12.8835 21.3791 12.1341C21.3791 12.0047 21.3982 11.8811 21.4316 11.7613H24.0324C24.0667 11.8811 24.0858 12.0047 24.0858 12.1341C24.0858 12.8835 23.4807 13.492 22.7325 13.492ZM15.5169 15.2111C15.5169 14.7987 15.8213 14.4667 16.2785 14.4667C16.7146 14.4667 17.0391 14.7485 17.0391 15.2111V17.3838L19.5368 14.7485C19.6475 14.6275 19.8403 14.4667 20.1247 14.4667C20.5103 14.4667 20.8758 14.7589 20.8758 15.1912C20.8758 15.4523 20.7135 15.6642 20.3786 15.9962L18.4602 17.8671L20.8052 20.2905C21.0485 20.5326 21.2308 20.754 21.2308 21.0548C21.2308 21.5287 20.8558 21.75 20.4396 21.75C20.1457 21.75 19.9529 21.5788 19.6685 21.2771L17.0391 18.4602V21.0255C17.0391 21.418 16.7347 21.75 16.2785 21.75C15.8414 21.75 15.5169 21.4681 15.5169 21.0255V15.2111ZM9.29616 15.8669H8.19002C7.70233 15.8669 7.5 15.512 7.5 15.1668C7.5 14.8119 7.75387 14.4667 8.19002 14.4667H11.9255C12.3617 14.4667 12.6155 14.8119 12.6155 15.1668C12.6155 15.512 12.4123 15.8669 11.9255 15.8669H10.8194V20.9593C10.8194 21.4667 10.4949 21.75 10.0578 21.75C9.62066 21.75 9.29616 21.4667 9.29616 20.9593V15.8669ZM22.0067 15.2518C22.0067 14.7485 22.3322 14.4667 22.7684 14.4667C23.2045 14.4667 23.529 14.7485 23.529 15.2518V20.9659C23.529 21.4681 23.2045 21.75 22.7684 21.75C22.3322 21.75 22.0067 21.4681 22.0067 20.9659V15.2518ZM13.2263 15.2518C13.2263 14.7485 13.5508 14.4667 13.987 14.4667C14.4241 14.4667 14.7486 14.7485 14.7486 15.2518V20.9659C14.7486 21.4681 14.4241 21.75 13.987 21.75C13.5508 21.75 13.2263 21.4681 13.2263 20.9659V15.2518Z" fill="white"></path>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M2.25 16C2.25 8.40608 8.40608 2.25 16 2.25C23.5939 2.25 29.75 8.40608 29.75 16C29.75 17.1313 29.6131 18.2459 29.3447 19.3257C27.8336 25.4072 22.3523 29.75 16 29.75C8.40608 29.75 2.25 23.5939 2.25 16ZM26.9052 16C26.9052 9.97724 22.0228 5.09483 16 5.09483C9.97724 5.09483 5.09483 9.97724 5.09483 16C5.09483 22.0228 9.97724 26.9052 16 26.9052C21.0378 26.9052 25.3861 23.46 26.5839 18.6397C26.7965 17.7838 26.9052 16.8996 26.9052 16Z" fill="url(#paint1_linear_3173:26341)"></path>
                                                    </g></svg></span>
                                            <span class="icon">
                                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <mask id="mask0_1329:61134" style="mask-type: alpha" maskUnits="userSpaceOnUse" x="0" y="6" width="32" height="20">
                                                        <rect y="6" width="32" height="20" rx="1.81818" fill="white"></rect>
                                                    </mask><g mask="url(#mask0_1329:61134)"><rect opacity="0.01" x="-1" y="4" width="34.04" height="23" fill="white"></rect>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.8116 10.6916L7.26655 17.2114L6.23703 11.6676C6.11637 11.0489 5.63944 10.6916 5.10955 10.6916H0.949103L0.891235 10.9696C1.74526 11.1578 2.7154 11.4606 3.30354 11.7849C3.66323 11.9827 3.76572 12.156 3.88411 12.6263L5.83384 20.2704H8.41786L12.3794 10.6916H9.8116ZM13.4285 10.6916L11.4062 20.2704H13.8514L15.8726 10.6916H13.4285ZM27.4466 13.2791L28.1868 16.8763H26.1588L27.4466 13.2791ZM27.0873 10.6916C26.6187 10.6916 26.2234 10.9688 26.0472 11.3943L22.3792 20.2704H24.945L25.4556 18.8405H28.5911L28.8876 20.2704H31.149L29.1754 10.6916H27.0873ZM16.5398 13.6828C16.5224 15.062 17.7528 15.8321 18.6794 16.2895C19.6318 16.7594 19.9514 17.0603 19.948 17.4805C19.9408 18.1229 19.1881 18.4066 18.4842 18.4177C17.2558 18.4373 16.5417 18.0815 15.9736 17.8128L15.5311 19.9112C16.1007 20.1776 17.1555 20.4095 18.2497 20.4199C20.8175 20.4199 22.4972 19.1353 22.5063 17.1431C22.5165 14.6154 19.0565 14.4755 19.0799 13.3455C19.0883 13.0031 19.4109 12.6374 20.1178 12.5447C20.4676 12.4975 21.4332 12.4615 22.5282 12.9725L22.9579 10.9423C22.3693 10.725 21.6125 10.5168 20.67 10.5168C18.2531 10.5168 16.5534 11.8186 16.5398 13.6828Z" fill="#1A1F71"></path>
                                                    </g></svg></span>
                                            <span class="icon">
                                                <svg width="32" height="33" viewBox="0 0 32 33" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <rect opacity="0.01" x="1" y="6.6665" width="30" height="20" fill="white"></rect><rect x="12.3877" y="10.1254" width="7.17949" height="12.9247" fill="#FF5F00"></rect><path d="M12.8434 16.5889C12.8407 14.0664 13.9964 11.6828 15.9773 10.1254C12.6131 7.47702 7.78209 7.86278 4.87927 11.0116C1.97644 14.1604 1.97644 19.0151 4.87927 22.1639C7.78209 25.3127 12.6131 25.6985 15.9773 23.0501C13.997 21.4931 12.8414 19.1106 12.8434 16.5889Z" fill="#EB001B"></path><path d="M29.2539 16.5889C29.2538 19.7358 27.46 22.6064 24.6343 23.9815C21.8087 25.3567 18.4472 24.995 15.9775 23.0501C17.9569 21.4918 19.1126 19.1096 19.1126 16.5877C19.1126 14.0659 17.9569 11.6837 15.9775 10.1254C18.4472 8.18045 21.8087 7.81875 24.6343 9.19392C27.46 10.5691 29.2538 13.4397 29.2539 16.5866V16.5889Z" fill="#F79E1B"></path></svg></span><span class="icon"><svg width="32" height="33" viewBox="0 0 32 33" fill="none" xmlns="http://www.w3.org/2000/svg"><rect opacity="0.01" y="5.6665" width="32" height="21.3333" fill="white"></rect><path d="M29.5619 22.6087C29.5619 24.9501 27.6552 26.8567 25.3138 26.8567H2.2002V10.0317C2.2002 7.6902 4.10682 5.78358 6.44828 5.78358H29.5619V22.6087Z" fill="white"></path><path d="M22.0356 18.2937H23.7917C23.8419 18.2937 23.959 18.277 24.0092 18.277C24.3437 18.2101 24.628 17.909 24.628 17.4909C24.628 17.0895 24.3437 16.7885 24.0092 16.7048C23.959 16.6881 23.8586 16.6881 23.7917 16.6881H22.0356V18.2937Z" fill="url(#paint0_linear)"></path><path d="M23.5909 7.20518C21.9184 7.20518 20.547 8.55988 20.547 10.2491V13.4101H24.8453C24.9456 13.4101 25.0627 13.4101 25.1463 13.4268C26.1163 13.477 26.8355 13.9787 26.8355 14.8484C26.8355 15.5341 26.3505 16.1195 25.4473 16.2365V16.27C26.4341 16.3369 27.1867 16.8888 27.1867 17.7418C27.1867 18.6616 26.3505 19.2637 25.2467 19.2637H20.5303V25.4519H24.9958C26.6683 25.4519 28.0397 24.0972 28.0397 22.408V7.20518H23.5909Z" fill="url(#paint1_linear)"></path><path d="M24.4106 15.0491C24.4106 14.6477 24.1262 14.3801 23.7917 14.3299C23.7583 14.3299 23.6747 14.3132 23.6245 14.3132H22.0356V15.785H23.6245C23.6747 15.785 23.775 15.785 23.7917 15.7682C24.1262 15.7181 24.4106 15.4505 24.4106 15.0491Z" fill="url(#paint2_linear)"></path><path d="M6.76619 7.20518C5.09372 7.20518 3.72229 8.55988 3.72229 10.2491V17.7585C4.57525 18.1766 5.46166 18.4442 6.34808 18.4442C7.40173 18.4442 7.97038 17.8087 7.97038 16.939V13.3933H10.5794V16.9223C10.5794 18.2937 9.72647 19.4142 6.83309 19.4142C5.077 19.4142 3.70557 19.0296 3.70557 19.0296V25.4351H8.17107C9.84355 25.4351 11.215 24.0804 11.215 22.3912V7.20518H6.76619Z" fill="url(#paint3_linear)"></path><path d="M15.1787 7.20518C13.5062 7.20518 12.1348 8.55988 12.1348 10.2491V14.2296C12.9041 13.5773 14.2421 13.1592 16.3996 13.2595C17.5536 13.3097 18.7912 13.6275 18.7912 13.6275V14.9153C18.1724 14.5975 17.4365 14.3132 16.4832 14.2463C14.8442 14.1292 13.8574 14.932 13.8574 16.3369C13.8574 17.7585 14.8442 18.5613 16.4832 18.4275C17.4365 18.3606 18.1724 18.0595 18.7912 17.7585V19.0463C18.7912 19.0463 17.5703 19.3641 16.3996 19.4142C14.2421 19.5146 12.9041 19.0965 12.1348 18.4442V25.4686H16.6003C18.2727 25.4686 19.6442 24.1139 19.6442 22.4247V7.20518H15.1787Z" fill="url(#paint4_linear)"></path><defs><linearGradient id="paint0_linear" x1="20.5439" y1="19.8203" x2="28.0604" y2="19.8203" gradientUnits="userSpaceOnUse"><stop stop-color="#007940"></stop>
                                                        <stop offset="0.2285" stop-color="#00873F"></stop>
                                                        <stop offset="0.7433" stop-color="#40A737"></stop>
                                                        <stop offset="1" stop-color="#5CB531"></stop>
                                                    </linearGradient>
                                                        <linearGradient id="paint1_linear" x1="20.544" y1="25.4526" x2="28.0602" y2="25.4526" gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="#007940"></stop>
                                                            <stop offset="0.2285" stop-color="#00873F"></stop>
                                                            <stop offset="0.7433" stop-color="#40A737"></stop>
                                                            <stop offset="1" stop-color="#5CB531"></stop>
                                                        </linearGradient>
                                                        <linearGradient id="paint2_linear" x1="20.5438" y1="17.3754" x2="28.0598" y2="17.3754" gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="#007940"></stop>
                                                            <stop offset="0.2285" stop-color="#00873F"></stop>
                                                            <stop offset="0.7433" stop-color="#40A737"></stop>
                                                            <stop offset="1" stop-color="#5CB531"></stop>
                                                        </linearGradient>
                                                        <linearGradient id="paint3_linear" x1="3.71849" y1="25.5849" x2="11.3507" y2="25.5849" gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="#1F286F"></stop>
                                                            <stop offset="0.4751" stop-color="#004E94"></stop>
                                                            <stop offset="0.8261" stop-color="#0066B1"></stop>
                                                            <stop offset="1" stop-color="#006FBC"></stop>
                                                        </linearGradient>
                                                        <linearGradient id="paint4_linear" x1="12.0913" y1="25.3346" x2="19.5036" y2="25.3346" gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="#6C2C2F"></stop>
                                                            <stop offset="0.1735" stop-color="#882730"></stop>
                                                            <stop offset="0.5731" stop-color="#BE1833"></stop>
                                                            <stop offset="0.8585" stop-color="#DC0436"></stop>
                                                            <stop offset="1" stop-color="#E60039"></stop>
                                                        </linearGradient>
                                                    </defs></svg></span><span class="icon"><svg width="32" height="33" viewBox="0 0 32 33" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M30 10.3615C30 8.8731 28.7934 7.6665 27.305 7.6665H4.695C3.20659 7.6665 2 8.8731 2 10.3615V22.9715C2 24.4599 3.20659 25.6665 4.695 25.6665H27.305C28.7934 25.6665 30 24.4599 30 22.9715V10.3615ZM4.695 8.6665H27.305L27.4513 8.67273C28.3189 8.74688 29 9.47465 29 10.3615V22.9715L28.9938 23.1178C28.9196 23.9854 28.1919 24.6665 27.305 24.6665H4.695L4.54875 24.6603C3.6811 24.5861 3 23.8584 3 22.9715V10.3615L3.00622 10.2153C3.08037 9.3476 3.80815 8.6665 4.695 8.6665Z" fill="#052E5C"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8.67528 20.2746L8.14557 21.881H7L9.205 15.6665H10.4582L12.6632 21.881H11.4918L10.9621 20.2746H8.67528ZM8.93368 19.4176H10.6994L9.83377 16.7647H9.80362L8.93368 19.4176ZM15.9535 21.881V16.6054H17.8097V15.6665H12.9862V16.6054H14.8467V21.881H15.9535ZM19.5711 17.471V21.881H18.5676V15.6665H19.8553L21.7589 20.4081H21.7933L23.6968 15.6665H24.9802V21.881H23.9811V17.471H23.9509L22.1551 21.881H21.3971L19.6012 17.471H19.5711Z" fill="#052E5C"></path><rect x="22" y="10.6665" width="5" height="3" rx="1" fill="#0B74E5"></rect></svg></span><span class="icon"><svg width="32" height="33" viewBox="0 0 32 33" fill="none" xmlns="http://www.w3.org/2000/svg"><mask id="mask0" style="mask-type: alpha" maskUnits="userSpaceOnUse" x="3" y="3" width="26" height="27"><path d="M10.6917 3.6665L21.3083 3.6665C23.9829 3.6665 24.9528 3.94498 25.9305 4.4679C26.9083 4.99082 27.6757 5.75819 28.1986 6.73597C28.7215 7.71374 29 8.6836 29 11.3582V21.9748C29 24.6494 28.7215 25.6193 28.1986 26.597C27.6757 27.5748 26.9083 28.3422 25.9305 28.8651C24.9528 29.388 23.9829 29.6665 21.3083 29.6665H10.6917C8.0171 29.6665 7.04724 29.388 6.06946 28.8651C5.09169 28.3422 4.32432 27.5748 3.8014 26.597C3.27848 25.6193 3 24.6494 3 21.9748L3 11.3582C3 8.6836 3.27848 7.71374 3.8014 6.73597C4.32432 5.75819 5.09169 4.99082 6.06946 4.4679C7.04724 3.94498 8.0171 3.6665 10.6917 3.6665Z" fill="white"></path>
                                                    </mask><g mask="url(#mask0)"><path d="M10.6917 3.6665L21.3083 3.6665C23.9829 3.6665 24.9528 3.94498 25.9305 4.4679C26.9083 4.99082 27.6757 5.75819 28.1986 6.73597C28.7215 7.71374 29 8.6836 29 11.3582V21.9748C29 24.6494 28.7215 25.6193 28.1986 26.597C27.6757 27.5748 26.9083 28.3422 25.9305 28.8651C24.9528 29.388 23.9829 29.6665 21.3083 29.6665H10.6917C8.0171 29.6665 7.04724 29.388 6.06946 28.8651C5.09169 28.3422 4.32432 27.5748 3.8014 26.597C3.27848 25.6193 3 24.6494 3 21.9748L3 11.3582C3 8.6836 3.27848 7.71374 3.8014 6.73597C4.32432 5.75819 5.09169 4.99082 6.06946 4.4679C7.04724 3.94498 8.0171 3.6665 10.6917 3.6665Z" fill="#A50064"></path>
                                                        <path d="M21.1624 8.6665C19.0427 8.6665 17.3247 10.2823 17.3247 12.2755C17.3247 14.269 19.0427 15.8849 21.1624 15.8849C23.2819 15.8849 25 14.269 25 12.2755C25 10.2823 23.2819 8.6665 21.1624 8.6665ZM21.1624 13.8159C20.2632 13.8159 19.5325 13.1289 19.5325 12.2833C19.5325 11.4376 20.2632 10.7505 21.1624 10.7505C22.0615 10.7505 22.7922 11.4376 22.7922 12.2833C22.7922 13.1289 22.0615 13.8161 21.1624 13.8161V13.8159ZM16.2168 15.8927H14.0089V11.3546C14.0089 11.0148 13.7198 10.7433 13.3587 10.7433C12.9974 10.7433 12.7083 11.0148 12.7083 11.3546V15.8927H10.5006V11.3546C10.5006 11.0148 10.2117 10.7433 9.85038 10.7433C9.48906 10.7433 9.19994 11.0148 9.19994 11.3546V15.8927H7V11.3772C7 9.8822 8.29262 8.6665 9.88225 8.6665C10.5325 8.6665 11.1267 8.87041 11.6084 9.21008C12.1645 8.84769 12.7399 8.6665 13.3345 8.6665C14.9241 8.6665 16.2168 9.8822 16.2168 11.3772V15.8927ZM21.1624 17.4481C19.0427 17.4481 17.3247 19.0638 17.3247 21.0571C17.3247 23.0506 19.0427 24.6665 21.1624 24.6665C23.2819 24.6663 25 23.0504 25 21.0571C25 19.0638 23.2819 17.4479 21.1624 17.4479V17.4481ZM13.3345 17.4397C14.9241 17.4397 16.2168 18.6554 16.2168 20.1504V24.6659H14.0089V20.1279C14.0089 19.788 13.7198 19.5165 13.3587 19.5165C12.9974 19.5165 12.7083 19.788 12.7083 20.1279V24.6659H10.5006V20.1279C10.5006 19.788 10.2117 19.5165 9.85038 19.5165C9.48906 19.5165 9.19994 19.788 9.19994 20.1279V24.6659H7V20.1504C7 18.6554 8.29262 17.4397 9.88225 17.4397C10.5325 17.4397 11.1267 17.6437 11.6084 17.9833C12.1645 17.6209 12.7399 17.4397 13.3345 17.4397ZM21.1624 19.532C22.0615 19.532 22.7922 20.2191 22.7922 21.0649C22.7922 21.9104 22.0615 22.5975 21.1624 22.5975C20.2632 22.5975 19.5325 21.9104 19.5325 21.0649C19.5325 20.2191 20.2632 19.532 21.1624 19.532Z" fill="white"></path>
                                                    </g></svg></span>
                                    </li>
                                </ul>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                    </section>
                    <!-- Section: Links -->
                </div>
                <!-- Grid container -->

                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    © 2022 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">onetechshop.com</a>
                </div>
                <!-- Copyright -->
            </footer>
            <!-- Footer -->
        </div>
    </form>
    <script src="bootstrap/jquery-3.6.0.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="https://kit.fontawesome.com/45128a02cf.js" crossorigin="anonymous"></script>
</body>
</html>
