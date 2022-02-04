<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/BookNow.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/BookNow-responsive.css" type="text/css">
    <title>Book Now</title>
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/img-homepage/favicon_img.png" type="image/x-icon">
</head>

<body>

    <header id="head">
        <button id="topbtn" title="Back to Top" onclick="topFunction()">
            <div class="Ellipse-649">
                <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/forma-1(1).png">
            </div>
        </button>
        <nav class="navbar navbar-expand-lg navbar-inverse bg-dark faqnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/logo-small.png" class="white_logo_transparent_background">
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
                                <a class="nav-link Book-now" href="BookNow">Book now</a>
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
            <a href="BookNow">Book Now</a>
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

    <section id="bannerBookNow">
        <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/book-service-banner.jpg" class="BNbanner img-fluid img-responsive">
    </section>

    <section id="titleBN">
        <span class="BNtitle">
            Set up your cleaning service
        </span>

        <div class="text-center d-flex align-items-center justify-content-center line1">
            <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/forma-1-copy-5.png">
        </div>

    </section>

    <section id="mainBN">
        <div class="d-flex justify-content-center BNmain">
            <div class="d-flex flex-column me-lg-5">
                <div class="d-flex justify-content-center">
                    <ul class="nav nav-pills tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active " data-bs-toggle="pill" href="#" id="service" onclick="changeimg()"><img
                                    src="<%= request.getContextPath() %>/resources/img/img-BookNow/setup-service-white.png" id="servimg"><span>Service</span> </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-bs-toggle="pill" href="#" id="schedule"> <img
                                    src="<%= request.getContextPath() %>/resources/img/img-BookNow/schedule-white.png" id="scheimg">
                                <span>Schedule & Plan</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-bs-toggle="pill" href="#" id="details"> <img
                                    src="<%= request.getContextPath() %>/resources/img/img-BookNow/details-white.png" id="detailsimg">
                                <span>Your Details</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-bs-toggle="pill" href="#" id="payment"> <img
                                    src="<%= request.getContextPath() %>/resources/img/img-BookNow/payment-white.png" id="payimg">
                                <span>Make Payment</span></a>
                        </li>
                    </ul>
                </div>

                <div class="contentdiv">
                    <div class="contenthere">

                    </div>
                </div>



            </div>

            <div class="d-flex justify-content-center">
                <div class="psumm">
                    <div class="paymentsummary d-flex flex-column">
                        <span class="summtitle">Payment Summary</span>
                        <span class="pay">Duration</span>
                        <div class="d-flex justify-content-between">
                            <span class="pay">Basic</span>
                            <span class="pay">0 Hrs</span>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="divider1"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="tst">Total Service Time</span>
                            <span class="tst">3 Hrs</span>
                        </div>
                        <div class="divider2"></div>
                        <div class="d-flex justify-content-between">
                            <span class="pay">Per cleaning</span>
                            <div class="d-flex">
                                <span class="pay1">0,00</span>
                                <div class="d-flex align-items-center">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/euro.png" class="payeuro">
                                </div>
                            </div>
                        </div>
                        <div class="divider2"></div>
                        <div class="d-flex justify-content-between">
                            <span class="total">Total Payment</span>
                            <div class="d-flex">
                                <span class="totalpay">0,00</span>
                                <div class="d-flex align-items-center">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/blue-euro.png" class="totaleuro">
                                </div>
                            </div>
                        </div>
                        <span class="sales">No sales tax is calculated.</span>
                        <div class="d-flex justify-content-between">
                            <span class="pay">Effective Price</span>
                            <div class="d-flex">
                                <span class="pay1">0,00</span>
                                <div class="d-flex align-items-center">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/euro.png" class="payeuro">
                                </div>
                            </div>
                        </div>
                        <span class="sales">You will save 20%</span>
                        <div class="smiley d-flex">
                            <div class="d-flex align-items-center">
                                <img src="<%= request.getContextPath() %>/resources/img/img-BookNow/smiley.png" class="smileyimg">
                            </div>
                            <div>
                                <a class="included text-decoration-none" data-bs-toggle="modal"
                                    data-bs-target="#includedmodal">See what is always included</a>
                                <div class="modal" id="includedmodal">
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <h4 class="modal-title">What we include in cleaning</h4>
                                                <button type="button" class="btn-close"
                                                    data-bs-dismiss="modal"></button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body d-flex">
                                                <div>
                                                    <p class="includedtitle">Bedroom and Living Room</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Dust
                                                        all accessible surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Wipe
                                                        down all mirrors and glass fixtures</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Not
                                                        Included
                                                        Clean all floor surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Take
                                                        out garbage and recycling</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">To clean up
                                                    </p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Make beds
                                                    </p>
                                                </div>
                                                <div>
                                                    <p class="includedtitle">Bathrooms</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Wash
                                                        and sanitize the toilet, shower, tub, sink</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Not
                                                        Included
                                                        Dust all accessible surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Wipe
                                                        down all mirrors and glass fixtures</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Not
                                                        Included
                                                        Clean all floor surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Take
                                                        out garbage and recycling</p>
                                                </div>
                                                <div>
                                                    <p class="includedtitle">Kitchen</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Dust
                                                        all accessible surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Empty
                                                        sink and load up dishwasher</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Clean
                                                        all floor surfaces</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Included
                                                        Take
                                                        out garbage and recycling</p>
                                                    <p class="incpoints"><img src="<%= request.getContextPath() %>/resources/img/img-BookNow/tick.png">Cleaning
                                                        the
                                                        sink and the oven (outside)</p>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <span class="ques">Questions?</span>

                    <div>
                        <div class="accordion">
                            <div class="accordion-item" id="ques1">
                                <a href="#ques1" class="accordion-link">

                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object1">
                                    What's included in cleaning?
                                </a>
                                <div class="answer">
                                    <p>
                                        Bedroom, Living Room & Common Areas,Bathrooms,Kitchen,Extras
                                    </p>
                                </div>
                            </div>

                            <div class="accordion-item" id="ques2">
                                <a href="#ques2" class="accordion-link">

                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object1">
                                    Which Helperland professional will come to my place?
                                </a>
                                <div class="answer">
                                    <p>
                                        Helperland has a vast network of experienced, top-rated cleaners. Based on the
                                        time and date
                                        of
                                        your request, we work to assign the best professional available.Like working
                                        with a specific
                                        pro? Add them to your Pro Team from the mobile app and they'll be requested
                                        first for all
                                        future
                                        bookings.You will receive an email with details about your professional prior to
                                        your
                                        appointment.
                                    </p>
                                </div>
                            </div>

                            <div class="accordion-item" id="ques3">
                                <a href="#ques3" class="accordion-link">

                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object1">
                                    Can I skip or reschedule bookings?
                                </a>
                                <div class="answer">
                                    <p>
                                        You can reschedule any booking for free at least 24 hours in advance of the
                                        scheduled start
                                        time. If you need to skip a booking within the minimum commitment, we’ll credit
                                        the value of
                                        the
                                        booking to your account. You can use this credit on future cleanings and other
                                        Helperland
                                        services.
                                    </p>
                                </div>
                            </div>

                            <div class="accordion-item" id="ques4">
                                <a href="#ques4" class="accordion-link">

                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object">
                                    <img src="<%= request.getContextPath() %>/resources/img/img-FAQ/vector-smart-object.png" class="Vector-Smart-Object1">
                                    Do I need to be home for the booking?
                                </a>
                                <div class="answer">
                                    <p>
                                        We strongly recommend that you are home for the first clean of your booking to
                                        show your
                                        cleaner
                                        around. Some customers choose to give a spare key to their cleaner, but this
                                        decision is
                                        based
                                        on individual preferences.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>


        </div>

    </section>


    <!-- Newsletter -->

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
                            src="<%= request.getContextPath() %>/resources/img/img-BookNow/white-logo-transparent-background-copy-4.png" class="white-logo"
                            alt="logo"></a>
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
                            src="<%= request.getContextPath() %>/resources/img/img-BookNow/facebook.png" class="facebook"></a>
                    <a href="https://www.instagram.com/helperlandde/" target="_blank" class="text-decoration-none "><img
                            src="<%= request.getContextPath() %>/resources/img/img-BookNow/instagram.png" class="instagram"></a>
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

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/resources/js/BookNow.js"></script>

</body>

</html>