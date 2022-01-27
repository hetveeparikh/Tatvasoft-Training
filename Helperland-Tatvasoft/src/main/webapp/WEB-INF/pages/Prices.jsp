<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <link href='<%= request.getContextPath() %>/resources/css/Prices.css' rel='stylesheet' type='text/css'>
    <link href='<%= request.getContextPath() %>/resources/css/Prices-responsive.css' rel='stylesheet' type='text/css'>

    <title>Prices</title>
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/img-Homepage/favicon_img.png" type="image/x-icon">
</head>

<body>

    <header id="head">
        <button id="topbtn" title="Back to Top" onclick="topFunction()">
            <div class="Ellipse-649">
                <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1(1).png">
            </div>
        </button>
        <nav class="navbar navbar-expand-lg navbar-inverse bg-dark pricesnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/logo-small.png" class="white_logo_transparent_background">
                </a>
                <button class="navbar-toggler ml-auto " type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item">
                            <div class="nav-btn Rounded-Rectangle-5-copy-5">
                                <a class="nav-link Book-now" href="BookNow.jsp">Book now</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn Rounded-Rectangle-5-copy-4">
                                <a class="nav-link Prices-services " href="prices">Prices &
                                    services</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link Warranty" href="warranty">Warranty</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link Blog" href="#">Blog</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link Contact" href="contact">Contact</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn Rounded-Rectangle-5" data-bs-toggle="modal" href="#login">
                                <a class="nav-link" href="#">Login</a>
                            </div>
                            <div class="modal fade" id="login" aria-hidden="true" aria-labelledby="log" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="lmodal">Login to your account</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>

                                        <div class="modal-body">
                                            <div>
                                                <input type="email" placeholder="Email" class="emailmodal" />
                                            </div>
                                            <div>
                                                <input type="password" placeholder="Password" class="passmodal" />
                                            </div>
                                            <div>
                                                <input type="checkbox" value="Remember me" id="rem" />
                                                <label for="rem" class="remmodal">Remember me</label>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="loginbtnmodal">
                                                    Login
                                                </button>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a class="text-decoration-none fpassmodal" data-bs-target="#passm"
                                                data-bs-toggle="modal" data-bs-dismiss="modal">Forgot Password?</a>
                                        </div>
                                        <div class=" text-center">
                                            <a class="accmodal" data-bs-target="#signupmodal" data-bs-toggle="modal"
                                                data-bs-dismiss="modal">Don't have an account?
                                                <span class="create"> Create an account </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="passm" aria-hidden="true" aria-labelledby="pass" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="pass">Forgot Password</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <input type="email" placeholder="Email Address" class="emailmodal">
                                                <button type="submit" class="sendemail">Send</button>
                                            </form>
                                        </div>
                                        <a class="text-decoration-none text-center loginnowmodal"
                                            data-bs-target="#login" data-bs-toggle="modal" data-bs-dismiss="modal">Login
                                            Now</a>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="signupmodal" aria-hidden="true" aria-labelledby="signup"
                                tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered ">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="signup">Create an account</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div>
                                                    <input type="text" placeholder="First name" class="fnamemodal">
                                                    <input type="text" placeholder="Last name" class="lnamemodal">
                                                </div>
                                                <div>
                                                    <input type="email" placeholder="E-mail Address"
                                                        class="signupemailmodal">
                                                    <input type="text" placeholder="+49" class="pinmodal" disabled>
                                                    <input type="text" placeholder="Mobile Number" class="mnomodal">
                                                </div>
                                                <div>
                                                    <input type="password" placeholder="Password" class="signuppass">
                                                    <input type="password" placeholder="Confirm Password"
                                                        class="confirmsignuppass">
                                                </div>
                                                <div>
                                                    <input type="checkbox" value="privacy" id="ppcheckbox" />
                                                    <label for="ppcheckbox" class="signuppolicy">I have read the
                                                        <a class="pp">Privacy Policy</a></label>
                                                </div>
                                                <div class="text-center">
                                                    <button type="submit" class="signupreg">Register</button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="text-center">
                                            <p class="alreadyreg">Already registered? <a class="text-decoration-none "
                                                    data-bs-target="#login" data-bs-toggle="modal"
                                                    data-bs-dismiss="modal"> Login Now
                                                </a></p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn Rounded-Rectangle-5-copy">
                                <a class="nav-link" href="bap">Become a Helper</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="BookNow.jsp">Book Now</a>
            <a href="prices">Prices & Services</a>
            <a href="warranty">Warranty</a>
            <a href="#">Blog</a>
            <a href="contact">Contact</a>
            <div data-bs-toggle="modal" href="#loginnn">
                <a class="lm">Login</a>
            </div>
            <div class="modal fade" id="loginnn" aria-hidden="true" aria-labelledby="log" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="lmodal">Login to your account</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">
                            <div>
                                <input type="email" placeholder="Email" class="emailmodal" />
                            </div>
                            <div>
                                <input type="password" placeholder="Password" class="passmodal" />
                            </div>
                            <div>
                                <input type="checkbox" value="Remember me" id="rem" />
                                <label for="rem" class="remmodal">Remember me</label>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="loginbtnmodal">
                                    Login
                                </button>
                            </div>
                        </div>
                        <div class="text-center">
                            <a class="text-decoration-none fpassmodal" data-bs-target="#passm1" data-bs-toggle="modal"
                                data-bs-dismiss="modal">Forgot Password?</a>
                        </div>
                        <div class=" text-center">
                            <a class="accmodal" data-bs-target="#signupmodal1" data-bs-toggle="modal"
                                data-bs-dismiss="modal">Don't have an account?
                                <span class="create"> Create an account </span></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="passm1" aria-hidden="true" aria-labelledby="pass" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="pass">Forgot Password</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <input type="email" placeholder="Email Address" class="emailmodal">
                                <button type="submit" class="sendemail">Send</button>
                            </form>
                        </div>
                        <a class="text-decoration-none text-center loginnowmodal" data-bs-target="#loginnn"
                            data-bs-toggle="modal" data-bs-dismiss="modal">Login
                            Now</a>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="signupmodal1" aria-hidden="true" aria-labelledby="signup" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="signup">Create an account</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div>
                                    <input type="text" placeholder="First name" class="fnamemodal">
                                    <input type="text" placeholder="Last name" class="lnamemodal">
                                </div>
                                <div>
                                    <input type="email" placeholder="E-mail Address" class="signupemailmodal">
                                    <input type="text" placeholder="+49" class="pinmodal" disabled>
                                    <input type="text" placeholder="Mobile Number" class="mnomodal">
                                </div>
                                <div>
                                    <input type="password" placeholder="Password" class="signuppass">
                                    <input type="password" placeholder="Confirm Password" class="confirmsignuppass">
                                </div>
                                <div>
                                    <input type="checkbox" value="privacy" id="ppcheckbox" />
                                    <label for="ppcheckbox" class="signuppolicy">I have read the
                                        <a class="pp">Privacy Policy</a></label>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="signupreg">Register</button>
                                </div>
                            </form>
                        </div>
                        <div class="text-center">
                            <p class="alreadyreg">Already registered? <a class="text-decoration-none "
                                    data-bs-target="#loginnn" data-bs-toggle="modal" data-bs-dismiss="modal"> Login Now
                                </a></p>
                        </div>

                    </div>
                </div>
            </div>



            <a href="bap">Become a Helper</a>
        </div>

        <div onclick="openNav()" class="sideham">&#9776; </div>

    </header>

    <section id="bannerprices">
        <img src="<%= request.getContextPath() %>/resources/img/img-Prices/group-18.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/group-18@2x.png 2x,
        <%= request.getContextPath() %>/resources/img/img-Prices/group-18@3x.png 3x" class="Group-18 img-fluid img-responsive pricesbanner">
    </section>

    <section id="box">
        <span class="Prices">
            Prices
        </span>


        <div class="text-center d-flex align-items-center justify-content-center line1">
            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1-copy-5.png">
        </div>

        <div class="d-flex justify-content-center">
            <div class="Rectangle-20">
                <div class="Rectangle-20-copy">
                    <span class="One-Time">
                        One Time
                    </span>
                </div>

                <div class="d-flex justify-content-center">
                    <div class="euroimg">
                        <img src="<%= request.getContextPath() %>/resources/img/img-Prices/euro.png" class="euro">
                    </div>
                    <span class="hr">
                        <span class="text-style-1">20</span>/hr
                    </span>
                </div>

                <div class="firstline">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1@2x.png 2x,
                    <%= request.getContextPath() %>/resources/img/img-Prices/forma-1@3x.png 3x" class="Forma-11">
                    <p class="Lower-prices">
                        Lower prices
                    </p>
                </div>

                <div class="secondline">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1@2x.png 2x,
                    <%= request.getContextPath() %>/resources/img/img-Prices/forma-1@3x.png 3x" class="Forma-11">
                    <p class="Easy-online-secure-payment">
                        Easy online & secure payment
                    </p>
                </div>

                <div class="thirdline">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1@2x.png 2x,
                          <%= request.getContextPath() %>/resources/img/img-Prices/forma-1@3x.png 3x" class="Forma-11">
                    <p class="Easy-amendment">
                        Easy amendment
                    </p>
                </div>

            </div>

        </div>

        <div class="pricesline"></div>
    </section>

    <section id="extra">
        <span class="Extra-services">
            Extra services
        </span>

        <div class="text-center d-flex align-items-center justify-content-center line1">
            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1-copy-5.png">
        </div>

        <div class=" d-flex justify-content-between container es">


            <div class=" d-flex flex-column align-items-center">
                <div class="esellipse">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/firstimg.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/firstimg.png 2x,
                                      <%= request.getContextPath() %>/resources/img/img-Prices/firstimg.png 3x" class="esimg">
                </div>

                <span class="esinside">
                    Inside cabinets
                </span>
                <span class="esminutes">
                    30 minutes
                </span>
            </div>

            <div class="d-flex flex-column align-items-center ">
                <div class="esellipse">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/secondimg.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/secondimg.png 2x,
                                      <%= request.getContextPath() %>/resources/img/img-Prices/secondimg.png 3x" class="esimg">
                </div>

                <span class="esinside">
                    Inside fridge
                </span>
                <span class="esminutes">
                    30 minutes
                </span>
            </div>

            <div class=" d-flex flex-column align-items-center">
                <div class="esellipse">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/thirdimg.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/thirdimg.png 2x,
                                      <%= request.getContextPath() %>/resources/img/img-Prices/thirdimg.png 3x" class="esimg">
                </div>

                <span class="esinside">
                    Inside oven
                </span>
                <span class="esminutes">
                    30 minutes
                </span>
            </div>

            <div class=" d-flex flex-column align-items-center">
                <div class="esellipse">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/fourthimg.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/fourthimg.png 2x,
                                    <%= request.getContextPath() %>/resources/img/img-Prices/fourthimg.png 3x" class="esimg">
                </div>

                <span class="esinside">
                    Laundry wash & dry
                </span>
                <span class="esminutes">
                    30 minutes
                </span>
            </div>

            <div class=" d-flex flex-column align-items-center">
                <div class="esellipse">
                    <img src="<%= request.getContextPath() %>/resources/img/img-Prices/fifthimg.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/fifthimg.png 2x,
                                    <%= request.getContextPath() %>/resources/img/img-Prices/fifthimg.png 3x" class="esimg">
                </div>

                <span class="esinside">
                    Interior windows
                </span>
                <span class="esminutes">
                    30 minutes
                </span>
            </div>



        </div>
    </section>

    <section id="whatweinclude">
        <div class="Rectangle-21-copy">
            <span class="What-we-include-in-cleaning">
                What we include in cleaning
            </span>

            <div class="text-center d-flex align-items-center justify-content-center line1">
                <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1-copy-5.png">
            </div>


            <div class="card-deck justify-content-between container d-flex justify-content-center">
                <div class="card bg-transparent">
                    <img class="card-img-top" src="<%= request.getContextPath() %>/resources/img/img-Prices/what1.png" alt="Card image cap">
                    <div class="card-body">
                        <span class="Bedroom-and-Living-Room">
                            Bedroom and Living Room
                        </span>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="dust">Dust all accessible surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="dust">Wipe down all mirrors and glass fixtures</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="dust">Clean all floor surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="dust">Take out garbage and recycling</span>
                        </div>

                    </div>
                </div>
                <div class="card bg-transparent">
                    <img class="card-img-top" src="<%= request.getContextPath() %>/resources/img/img-Prices/what2.png" alt="Card image cap">
                    <div class="card-body">
                        <span class="Bathrooms">
                            Bathrooms
                        </span>

                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="wash">Wash and sanitize the toilet, shower, tub, sink</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="wash">Dust all accessible surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="wash">Wipe down all mirrors and glass fixtures</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="wash">Clean all floor surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="wash">Take out garbage and recycling</span>
                        </div>
                    </div>
                </div>
                <div class="card bg-transparent">
                    <img class="card-img-top" src="<%= request.getContextPath() %>/resources/img/img-Prices/what3.png" alt="Card image cap">
                    <div class="card-body">
                        <span class="Kitchen">
                            Kitchen
                        </span>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="kit">Dust all accessible surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="kit">Empty sink and load up dishwasher</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <p class="kit">Wipe down exterior of stove, oven and fridge</p>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="kit">Clean all floor surfaces</span>
                        </div>
                        <div class="d-flex">
                            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/vector-smart-object.png" class="Vector-smart-object">
                            <span class="kit">Take out garbage and recycling</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </section>

    <section id="whyhelperland">
        <span class="Why-Helperland ">
            Why Helperland
        </span>

        <div class="text-center d-flex align-items-center justify-content-center line1">
            <img src="<%= request.getContextPath() %>/resources/img/img-Prices/forma-1-copy-5.png">
        </div>

        <div class="d-flex container mx-auto whyrow row">
            <div class="d-flex justify-content-center col-lg-4 col-md-4">
                <div>
                    <p class="Experienced-and-vetted-professionals">
                        Experienced and vetted professionals
                    </p>
                    <p class="dominate-the-industry-in-scale-and-scope-with-an-adaptable-ext">
                        dominate the industry in scale and scope with
                        an adaptable, extensive network that
                        consistently delivers exceptional results.
                    </p>
                    <p class="Dedicated-customer-service">
                        Dedicated customer service
                    </p>
                    <p class="to-our-customers-and-are-guided-in-all-we-do-by-their-needs-Th">
                        to our customers and are guided in all we do
                        by their needs. The team is always happy to
                        support you and offer all the information.
                    </p>
                </div>

            </div>

            <div class="d-flex align-items-center whyimg justify-content-center col-lg-4 col-md-4">
                <img src="<%= request.getContextPath() %>/resources/img/img-Prices/the-best-img-1.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/the-best-img-1@2x.png 2x,
                <%= request.getContextPath() %>/resources/img/img-Prices/the-best-img-1@3x.png 3x" class="the-best-img-1">
            </div>

            <div class="d-flex flex-column col-lg-4 col-md-4">
                <span class="Every-cleaning-is-insured ">
                    Every cleaning is insured
                </span>
                <span class="and-seek-to-provide-exceptional-service-and-engage-in-proactive">
                    and seek to provide exceptional service and engage in proactive behavior. We'll be happy to clean
                    your homes.
                </span>
                <span class="Secure-online-payment">
                    Secure online payment
                </span>
                <span class="Payment-is-processed-securely-online-Customers-pay-safely-onli">
                    Payment is processed securely online. Customers pay safely online and manage the booking.
                </span>
            </div>
        </div>

    </section>


    <section id="news">
        <span class="text-center newsletter">
            SUBSCRIBE TO NEWSLETTER
        </span>
        <form>
            <div class="text-center">
                <input type="text" placeholder="YOUR EMAIL" class="email" />
                <button type="submit" class="submitbtn" disabled>SUBMIT</button>
            </div>
        </form>
    </section>

    <footer>
        <div class="Rectangle-12">
            <div class="row justify-content-between align-items-center">
                <div class="logo col-md-1 col-sm-1">
                    <a href="homepage" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-Prices/white-logo-transparent-background-copy-4.png" class="white-logo" alt="logo"></a>
                </div>
                <div class=" links col-md-3 col-lg-5 justify-content-between align-items-center">
                    <ul class=" d-flex justify-content-between align-items-center">
                        <li>
                            <a href="homepage" class="text-decoration-none">HOME</a>
                        </li>
                        <li>
                            <a href="about" class="text-decoration-none ">ABOUT</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none ">TESTIMONIALS</a>
                        </li>
                        <li>
                            <a href="faq" class="text-decoration-none ">FAQS</a>
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
                    <a href="https://www.facebook.com/helperDE/" target="_blank" class="text-decoration-none "><img
                            src="<%= request.getContextPath() %>/resources/img/img-Prices/facebook.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/facebook@2x.png 2x,
                                    <%= request.getContextPath() %>/resources/img/img-Prices/facebook@3x.png 3x" class="facebook"></a>
                    <a href="https://www.instagram.com/helperlandde/" target="_blank" class="text-decoration-none "><img
                            src="<%= request.getContextPath() %>/resources/img/img-Prices/instagram.png" srcset="<%= request.getContextPath() %>/resources/img/img-Prices/instagram@2x.png 2x,
                                    <%= request.getContextPath() %>/resources/img/img-Prices/instagram@3x.png 3x" class="instagram"></a>
                </div>
                <div class="Rectangle-12-copy-2"></div>

                <span class="-Helperland-All-rights-reserved-Terms-and-Conditions">
                    ©2022 Helperland<span class="text-style-1">.</span> All rights reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a
                        href="#" class="terms text-decoration-none"> Terms and
                        Conditions </a>&nbsp; | &nbsp; <a href="#" class="terms text-decoration-none">Privacy Policy</a>
                </span>
            </div>
        </div>
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath() %>/resources/js/Prices.js"></script>

</body>

</html>