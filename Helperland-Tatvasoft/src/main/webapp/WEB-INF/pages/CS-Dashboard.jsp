<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<%=request.getContextPath()%>/resources/css/Customer - Service History.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/Customer - Service History - responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">
    <title>Customer - Dashboard</title>
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/img-homepage/favicon_img.png" type="image/x-icon">
</head>

<body>
    <header id="head">
        <nav class="navbar navbar-expand-lg navbar-inverse bg-dark csnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/logo-small.png" class="white_logo_transparent_background">
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
                                <a class="nav-link noti" href="#"><img src="<%= request.getContextPath() %>/resources/img/img-CS/icon-notification.png"></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="ver-line">
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/me.png">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="customerDashboard">Dashboard</a></li>
                                <li><a class="dropdown-item" href="Settings-customer">Settings</a></li>
                                <li><a class="dropdown-item" href="logout" onclick="logout()">Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="customerDashboard" class="active">Dashboard</a>
            <a href="ServiceHistory-customer">Service History</a>
            <a href="#">Service Schedule</a>
            <a href="#">Favourite Pros</a>
            <a href="#">Invoices</a>
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
                    <li><a class="dropdown-item" href="customerDashboard">Dashboard</a></li>
                    <li><a class="dropdown-item" href="Settings-customer">Settings</a></li>
                    <li><a class="dropdown-item" href="logout">Log out</a></li>
                </ul>
            </li>
        </div>

        <div onclick="openNav()" class="navham">&#9776; </div>

    </header>

    <section id="welcomecs">
        <span class="Welcome-Gaurang wc">
            Welcome,
            <span class="Gaurang">Gaurang!</span>
        </span>
        <div class="l1"></div>
    </section>

    <section id="maincs" class="row">

        <div class="sidebar col-lg-3 offset-lg-2 ">
            <a href="customerDashboard" class="active">Dashboard</a>
            <a href="ServiceHistory-customer">Service History</a>
            <a href="#">Service Schedule</a>
            <a href="#">Favourite Pros</a>
            <a href="#">Invoices</a>
            <a href="#">Notifications </a>
        </div>

        <div class="d-flex flex-column justify-content-center datamain col-lg-7">
            <div class="d-flex justify-content-between container">
                <p class="history">Current Service Requests</p>
                <button class="export">Add New Service Request</button>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <table class="table display nowrap" id="exampledash" colspacing="0" style="width: 100%;">
                            <thead>
                                <tr id="firstrow">
                                    <th>
                                        <div class="d-flex">
                                            <span class="heading">Service ID</span>
                                        </div>
                                    </th>
                                    <th>
                                        <div class="d-flex">
                                            <span class="heading">Service Date</span>

                                        </div>
                                    </th>
                                    <th>
                                        <div class="d-flex">
                                            <span class="heading ">Service Provider</span>

                                        </div>
                                    </th>
                                    <th>
                                        <div class="d-flex">
                                            <span class="heading">Payment</span>

                                        </div>
                                    </th>
                                    <th>
                                        <div class="d-flex">
                                            <span class="heading">Actions</span>

                                        </div>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8529</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td></td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8517</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex">
                                            <div class="topicircle text-center">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png" class="topi">
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="csname">Lyum Watson</span>
                                                <div class="d-flex">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star unchecked"></span>
                                                    <span class="num4">4</span>
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8513</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex">
                                            <div class="topicircle text-center">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png" class="topi">
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="csname">Lyum Watson</span>
                                                <div class="d-flex">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star unchecked"></span>
                                                    <span class="num4">4</span>
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8502</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td></td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8496</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex">
                                            <div class="topicircle text-center">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png" class="topi">
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="csname">Lyum Watson</span>
                                                <div class="d-flex">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star unchecked"></span>
                                                    <span class="num4">4</span>
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        <span class="csid">8507</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column justify-content-center">
                                            <div class="d-flex ">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">31/03/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex">
                                            <div class="topicircle text-center">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/hat.png" class="topi">
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="csname">Lyum Watson</span>
                                                <div class="d-flex">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star unchecked"></span>
                                                    <span class="num4">4</span>
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <span class="cs-price ">
                                            <span class="euro">€</span>63
                                        </span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <div>
                                            <button class="csreschedule" data-bs-toggle="modal"
                                                data-bs-target="#reschedulemodal">
                                                Reschedule
                                            </button>
                                            <div class="modal" id="reschedulemodal">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Reschedule Service Request</h4>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                        </div>

                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <span class="newdate">Select new date and time</span>
                                                            <div class="d-flex justify-content-center">
                                                                <div class="d-flex daterect">
                                                                    <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                                    <span class="cs-date">31/03/2018</span>
                                                                </div>
                                                                <div>
                                                                    <select title="Time" class="timerect">
                                                                        <option value="">&nbsp;8:00 </option>
                                                                        <option value="A">8:30</option>
                                                                        <option value="B">9:00</option>
                                                                        <option value="C">9:30</option>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-center">
                                                            <button class="csupdate">Update</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="cscancel">
                                            Cancel
                                        </button>
                                    </td>
                                </tr>






                            </tbody>
                        </table>
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
                            src="<%= request.getContextPath() %>/resources/img/img-CS/white-logo-transparent-background-copy-4.png" class="white-logo"
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
                            src="<%= request.getContextPath() %>/resources/img/img-CS/facebook.png"
                            srcset="<%= request.getContextPath() %>/resources/img/img-CS/facebook@2x.png 2x,<%= request.getContextPath() %>/resources/img/img-CS/facebook@3x.png 3x" class="facebook" /></a>
                    <a href="https://www.instagram.com/helperlandde/" target="_blank" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-CS/instagram.png"
                            srcset="<%= request.getContextPath() %>/resources/img/img-CS/instagram@2x.png 2x, <%= request.getContextPath() %>/resources/img/img-CS/instagram@3x.png 3x"
                            class="instagram" /></a>
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

    <script src="<%=request.getContextPath()%>/resources/js/CS-Dashboard.js"></script>
</body>

</html>