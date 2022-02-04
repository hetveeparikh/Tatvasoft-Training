<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/Service Provider - Upcoming Service.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/Service Provider - Upcoming Service - responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">
    <title>Service Provider - Upcoming Service</title>
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/img-homepage/favicon_img.png" type="image/x-icon">
</head>

<body>

    <header id="head">
        <nav class="navbar navbar-expand-lg navbar-inverse bg-dark csnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <img src="<%= request.getContextPath() %>/resources/img/img-US/logo-small.png" class="white_logo_transparent_background">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <div class="bookrect text-center">
                                <a class="nav-link book align-items-center" href="BookNow">Book Now</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link prices" href="prices">Prices</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link warranty" href="warranty">Warranty</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blog">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link contact" href="contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <div class="ver-line">
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link noti" href="#"><img src="<%= request.getContextPath() %>/resources/img/img-US/icon-notification.png"></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="ver-line">
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<%= request.getContextPath() %>/resources/img/img-US/me.png">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="serviceproviderDashboard">Dashboard</a></li>
                                <li><a class="dropdown-item" href="Settings-ServiceProvider">Settings</a></li>
                                <li><a class="dropdown-item" href="#">Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="serviceproviderDashboard">Dashboard</a>
            <a href="upcomingservice">Upcoming Services</a>
            <a href="#">Service Schedule</a>
            <a href="servicehistory">Service History</a>
            <a href="#">My Ratings </a>
            <a href="blockcustomer" class="active">Block Customer</a>
            <a href="BookNow">Book Now</a>
            <a href="prices">Prices</a>
            <a href="warranty">Warranty</a>
            <a href="#">Blog</a>
            <a href="contact">Contact</a>
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <span>Settings</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="serviceproviderDashboard">Dashboard</a></li>
                    <li><a class="dropdown-item" href="Settings-ServiceProvider">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Log out</a></li>
                </ul>
            </li>
        </div>

        <div onclick="openNav()" class="navham">&#9776; </div>

    </header>

    <section id="welcome">
        <span class="Welcome-Sandip wc">
            Welcome,
            <span class="Sandip">Sandip!</span>
        </span>
        <div class="l1"></div>
    </section>

    <section id="maincs" class="row">
        <div class="sidebar col-lg-2 offset-lg-1 container">
            <a href="serviceproviderDashboard" id="dash1">Dashboard</a>
            <a href="upcomingservice">Upcoming Services</a>
            <a href="#">Service Schedule</a>
            <a href="servicehistory">Service History</a>
            <a href="#">My Ratings </a>
            <a href="blockcustomer" class="active">Block Customer</a>
        </div>

        <div class="container col-lg-8 sptable">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 blockbox">
                    <div class="d-flex flex-column">
                        <div class="d-flex justify-content-center">
                            <div class="d-flex justify-content-center align-items-center blocktopicircle">
                                <img class="blocktopi" src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png">
                            </div>
                        </div>
                        <span class="d-flex justify-content-center blockname">cust1</span>
                        <div class="d-flex justify-content-center">
                            <button class="d-flex justify-content-center unblockbtn" type="submit">Unblock</button>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 blockbox">
                    <div class="d-flex flex-column">
                        <div class="d-flex justify-content-center">
                            <div class="d-flex justify-content-center align-items-center blocktopicircle">
                                <img class="blocktopi" src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png">
                            </div>
                        </div>
                        <span class="d-flex justify-content-center blockname">cust2</span>
                        <div class="d-flex justify-content-center">
                            <button class="d-flex justify-content-center blockbtn" type="submit">Block</button>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 blockbox">
                    <div class="d-flex flex-column">
                        <div class="d-flex justify-content-center">
                            <div class="d-flex justify-content-center align-items-center blocktopicircle">
                                <img class="blocktopi" src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png">
                            </div>
                        </div>
                        <span class="d-flex justify-content-center blockname">cust3</span>
                        <div class="d-flex justify-content-center">
                            <button class="d-flex justify-content-center unblockbtn" type="submit">Unblock</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </section>

    <footer>
        <div class="Rectangle-12">
            <div class="row justify-content-between align-items-center">
                <div class="logo col-md-1 col-sm-1">
                    <a href="homepage" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/white-logo-transparent-background-copy-4.png" class="white-logo"
                            alt="logo" /></a>
                </div>
                <div class="links col-md-3 col-lg-5 justify-content-between align-items-center">
                    <ul class="d-flex justify-content-between align-items-center">
                        <li>
                            <a href="homepage" class="text-decoration-none">HOME</a>
                        </li>
                        <li>
                            <a href="about" class="text-decoration-none">ABOUT</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none">TESTIMONIALS</a>
                        </li>
                        <li>
                            <a href="faq" class="text-decoration-none">FAQS</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none">INSURANCE POLICY</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none">IMPRESSUM</a>
                        </li>
                    </ul>
                </div>
                <div class="icons col-md-1">
                    <a href="https://www.facebook.com/helperDE/" target="_blank" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/facebook.png" class="facebook" /></a>
                    <a href="https://www.instagram.com/helperlandde/" target="_blank" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/instagram.png" class="instagram" /></a>
                </div>
                <div class="Rectangle-12-copy-2"></div>

                <span class="-Helperland-All-rights-reserved-Terms-and-Conditions">
                    ©2022 Helperland<span class="text-style-1">.</span> All rights
                    reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="terms text-decoration-none">
                        Terms and Conditions </a>&nbsp; | &nbsp;
                    <a href="#" class="terms text-decoration-none">Privacy Policy</a>
                </span>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/Service Provider - Upcoming Service.js"></script>

</body>

</html>