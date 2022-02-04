<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<%=request.getContextPath()%>/resources/css/Admin - Service Requests.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admin - Service Requests</title>
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/img-homepage/favicon_img.png" type="image/x-icon">
</head>

<body>
    <header id="head">
        <nav class="navbar navbar-expand-lg aumnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <span class="aumheader">helperland</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link noti" href="#"><img src="<%= request.getContextPath() %>/resources/img/img-AUM/me.png"></a>
                            </div>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <div class="nav-btn">
                                <span class="adminname">
                                    James Smith
                                </span>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link noti" href="#"><img src="<%= request.getContextPath() %>/resources/img/img-AUM/logout.png"></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
    </header>

    <section id="aummain" class="d-flex">
        <div class="sidebar">
            <a href="AdminServiceRequests" class="active">Service Requests</a>
            <div class="divider"></div>
            <a href="AdminUserManagement">User Management</a>
            <div class="divider"></div>
            <a href="#">Coupon Code Management</a>
            <div class="divider"></div>
            <a href="#">Content Management</a>
            <div class="divider"></div>
            <a href="#">Invoices</a>
            <div class="divider"></div>
        </div>

        <div class="d-flex flex-column container-fluid aumbg">
            <div class="aumfirst">
                <span class="um d-flex align-items-center">Service Requests</span>
            </div>

            <div class="aumform d-flex justify-content-between">

                <input type="text" placeholder="Service ID" class="zipaum">

                <select title="Customer" class="userdrop">
                    <option value="A">Customer</option>
                    <option value="B">Customer 2</option>
                </select>

                <select title="Service Provider" class="userdrop">
                    <option value="A">Service Provider</option>
                </select>

                <select title="Status" class="userdrop">
                    <option value="A">Status</option>
                    <option value="B">All</option>
                    <option value="C">Pending Penalty</option>
                    <option value="D">Pending Commission</option>
                </select>

                <div class="d-flex datebox">
                    <span class="SRdate d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/img/img-ASR/admin-calendar-blue.png"
                            class="gcal">From Date</span>
                </div>

                <div class="d-flex datebox">
                    <span class="SRdate d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/img/img-ASR/admin-calendar-blue.png"
                            class="gcal">To Date</span>
                </div>


                <button class="searchaum">Search</button>
                <button class="clearaum">Clear</button>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <table class="table display nowrap" id="example" colspacing="0" style="width: 100%;">
                            <thead>
                                <tr id="firstrow">
                                    <th>
                                        <span class="heading">Service ID</span>
                                    </th>
                                    <th>
                                        <span class="heading">Service date</span>
                                    </th>
                                    <th>
                                        <span class="heading">Customer details</span>
                                    </th>
                                    <th>
                                        <span class="heading">Service Provider</span>
                                    </th>
                                    <th>
                                        <span class="heading">Gross Amount</span>
                                    </th>
                                    <th>
                                        <span class="heading">Net Amount</span>
                                    </th>
                                    <th>
                                        <span class="heading">Discount</span>
                                    </th>
                                    <th>
                                        <span class="heading">Status</span>
                                    </th>
                                    <th>
                                        <span class="heading">Payment Status</span>
                                    </th>
                                    <th>
                                        <span class="heading">Actions</span>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <div class="d-flex">
                                                <span class="cs-time">12:00 - 18:00</span>
                                            </div>

                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
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
                                    <td class="align-middle amnt">
                                        81,00 €
                                    </td>
                                    <td class="align-middle amnt">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="pendingbtn">Pending</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
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
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="reschebtn">Rescheduled</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
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
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="newbtn">New</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Unsettled</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="changedbtn">Changed Service Provider</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="cancelledbtn">Cancelled</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
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
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="pendingbtn">Pending</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle">
                                        8537
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <div class="d-flex">
                                                <img src="<%= request.getContextPath() %>/resources/img/img-CS/greycalendar.png" class="gcal">
                                                <span class="cs-date">15/02/2018</span>
                                            </div>
                                            <span class="cs-time">12:00 - 18:00</span>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex flex-column">
                                            <span class="david">David Bough</span>
                                            <div class="d-flex">
                                                <img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">
                                                <p class="add">Musterstrabe 5,12345 Bonn</p>
                                            </div>
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
                                        81,00 €
                                    </td>
                                    <td class="align-middle">
                                        81,00 €
                                    </td>
                                    <td class="align-middle">

                                    </td>
                                    <td class="align-middle">
                                        <button class="pendingbtn">Pending</button>
                                    </td>
                                    <td class="align-middle">
                                        <button class="SRstatus">Not Applicable</button>
                                    </td>
                                    <td class="details dropdown-container align-middle" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit & Reschedule</div>
                                            </a>
                                            <a href="#">
                                                <div>Refund</div>
                                            </a>
                                            <a href="#">
                                                <div>Inquiry</div>
                                            </a>
                                            <a href="#">
                                                <div>History Log</div>
                                            </a>
                                            <a href="#">
                                                <div>Download Invoice</div>
                                            </a>
                                            <a href="#">
                                                <div>Other Transactions</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <span class="aumrights">©2022 Helperland. All rights reserved.</span>

        </div>
    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>


    <script src="<%=request.getContextPath()%>/resources/js/Admin - Service Requests.js"></script>
</body>

</html>