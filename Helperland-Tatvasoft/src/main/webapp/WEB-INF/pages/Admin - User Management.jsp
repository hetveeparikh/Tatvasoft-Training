<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<%=request.getContextPath()%>/resources/css/Admin - User Management.css" rel="stylesheet">
    <title>Admin - User Management</title>
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
            <a href="AdminServiceRequests">Service Requests</a>
            <div class="divider"></div>
            <a href="AdminUserManagement" class="active">User Management</a>
            <div class="divider"></div>
            <a href="#">Coupon Code Management</a>
            <div class="divider"></div>
            <a href="#">Content Management</a>
            <div class="divider"></div>
            <a href="#">Invoices</a>
            <div class="divider"></div>
        </div>

        <div class="d-flex flex-column container-fluid aumbg">
            <div class="d-flex justify-content-between aumfirst">
                <span class="um d-flex align-items-center">User Management</span>
                <button class="d-flex addbtn align-items-center">
                    <div class="d-flex align-items-center">
                        <img src="<%= request.getContextPath() %>/resources/img/img-AUM/adduser.png" class="adduserbtn">
                    </div>
                    <span>Add New User</span>
                </button>
            </div>

            <div class="aumform d-flex justify-content-between">
                <select title="User name" class="userdrop">
                    <option value="">User name</option>
                    <option value="A">2</option>
                    <option value="B">3</option>
                    <option value="C">4</option>
                </select>

                <select title="User role" class="userdrop">
                    <option value="">User role</option>
                    <option value="A">Admin</option>
                    <option value="B">Call Center</option>
                    <option value="C">Customer</option>
                    <option value="D">Service Provider</option>
                </select>

                <div>
                    <input type="text" placeholder="+49" class="pinaum" disabled>
                    <input type="text" placeholder="Mobile number" class="mnoaum">
                </div>

                <input type="text" placeholder="Zipcode" class="zipaum">
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
                                        <span class="heading">User Name</span>
                                    </th>
                                    <th>
                                        <span class="heading">User Type</span>
                                    </th>
                                    <th>
                                        <span class="heading">Role</span>
                                    </th>
                                    <th>
                                        <span class="heading">Postal Code</span>
                                    </th>
                                    <th>
                                        <span class="heading">City</span>
                                    </th>
                                    <th>
                                        <span class="heading">Radius</span>
                                    </th>
                                    <th>
                                        <span class="heading">User Status</span>
                                    </th>
                                    <th>
                                        <span class="heading">Actions</span>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td class="align-middle tablename">
                                        Lyum Watson
                                    </td>
                                    <td class="align-middle tabletype">
                                        Call Center
                                    </td>
                                    <td class="align-middle tablerole">
                                        Inquiry Manager
                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Service Provider
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">
                                        10km
                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Call Center
                                    </td>
                                    <td class="align-middle tablerole">
                                        Inquiry Manager
                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Customer
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Call Center
                                    </td>
                                    <td class="align-middle tablerole">
                                        Content Manager
                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Customer
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablepinkbtn">Inactive</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Service Provider
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">
                                        20 km
                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Call Center
                                    </td>
                                    <td class="align-middle tablerole">
                                        Finance Manager
                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Customer
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="align-middle tablename">
                                        John Smith
                                    </td>
                                    <td class="align-middle tabletype">
                                        Customer
                                    </td>
                                    <td class="align-middle tablerole">

                                    </td>
                                    <td class="align-middle tablepin">
                                        123456
                                    </td>
                                    <td class="align-middle tablecity">
                                        Berlin
                                    </td>
                                    <td class="align-middle tableradius">

                                    </td>
                                    <td class="align-middle tablestatus">
                                        <button class="tablegreenbtn">Active</button>
                                    </td>
                                    <td class="details dropdown-container" tabindex="-1">
                                        <div class="three-dots"></div>
                                        <div class="dropdown">
                                            <a href="#">
                                                <div>Edit</div>
                                            </a>
                                            <a href="#">
                                                <div>Deactivate</div>
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

    <script src="<%=request.getContextPath()%>/resources/js/Admin - User Management.js"></script>
</body>

</html>