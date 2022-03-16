<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/FAQ.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/FAQ-responsive.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>FAQ</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
</head>

<body>

	<header id="head">
		<button id="topbtn" title="Back to Top" onclick="topFunction()">
			<div class="Ellipse-649">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-FAQ/forma-1(1).png">
			</div>
		</button>
		<nav class="navbar navbar-expand-lg navbar-inverse bg-dark faqnav">
			<div class="container-fluid custom-toggler">
				<a class="navbar-brand" href="homepage"> <img
					src="<%=request.getContextPath()%>/resources/img/img-FAQ/logo-small.png"
					class="white_logo_transparent_background">
				</a>
				<button class="navbar-toggler ml-auto " type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto ">
						<li class="nav-item linkbook">
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
						<li class="nav-item linklogin">
							<div class="nav-btn Rounded-Rectangle-5" data-bs-toggle="modal"
								href="#login">
								<a class="nav-link" href="#">Login</a>
							</div>
							<div class="modal fade" id="login" aria-hidden="true"
								aria-labelledby="log" tabindex="-1">
								<div class="modal-dialog modal-dialog-centered modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="lmodal">Login to your
												account</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal"></button>
										</div>

										<div class="modal-body">
											<form action="loginprocess" method="post">
												<div>
													<input type="email" placeholder="Email" class="emailmodal"
														name="Email" />
												</div>
												<div>
													<input type="password" placeholder="Password"
														class="passmodal" name="Password" />
												</div>
												<div>
													<input type="checkbox" value="Remember me" id="rem" /> <label
														for="rem" class="remmodal">Remember me</label>
												</div>
												<div class="text-center">
													<button type="submit" class="loginbtnmodal">Login</button>
												</div>

											</form>
										</div>
										<div class="text-center">
											<a class="text-decoration-none fpassmodal"
												data-bs-target="#passm" data-bs-toggle="modal"
												data-bs-dismiss="modal">Forgot Password?</a>
										</div>
										<div class=" text-center">
											<a class="accmodal" data-bs-target="#signupmodal"
												data-bs-toggle="modal" data-bs-dismiss="modal">Don't
												have an account? <span class="create"> Create an
													account </span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="passm" aria-hidden="true"
								aria-labelledby="pass" tabindex="-1">
								<div class="modal-dialog modal-dialog-centered modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="pass">Forgot Password</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="forgotpassword" method="post">
												<input type="email" placeholder="Email Address"
													class="emailmodal" name="Email" />
												<button type="submit" class="sendemail">Send</button>
											</form>
										</div>
										<a class="text-decoration-none text-center loginnowmodal"
											data-bs-target="#login" data-bs-toggle="modal"
											data-bs-dismiss="modal">Login Now</a>
									</div>
								</div>
							</div>

							<div class="modal fade" id="signupmodal" aria-hidden="true"
								aria-labelledby="signup" tabindex="-1">
								<div class="modal-dialog modal-dialog-centered ">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="signup">Create an account</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="addCustomer" method="post" oninput='cpass.setCustomValidity(cpass.value != Password.value ? "Passwords do not match." : "")'>
												<div>
													<input type="text" placeholder="First name"
														class="fnamemodal" name="FirstName" required /> <input
														type="text" placeholder="Last name" name="LastName"
														class="lnamemodal" required />
												</div>
												<div>
													<input type="email" placeholder="E-mail Address"
														class="signupemailmodal" name="Email" required /> <input
														type="text" placeholder="+91" class="pinmodal"
														name="pincode" disabled /> <input type="text" id="Mobile"
														placeholder="Mobile Number" class="mnomodal" name="Mobile"
														required />
												</div>
												<div>
													<input type="password" placeholder="Password"
														class="signuppass" name="Password" id="Password" required />
													<input type="password" placeholder="Confirm Password"
														id="ConfirmPassword" name="cpass"
														class="confirmsignuppass" required />
												</div>
												<div class="text-center mb-2 mt-2" id="Passworddiv"></div>

												<div class="text-center mb-2 mt-2" id="Mobilediv"></div>

												<div class="text-center mb-2 mt-2" id="CheckPasswordMatch"></div>
												<div>
													<input type="checkbox" value="privacy" id="ppcheckbox"
														required /> <label for="ppcheckbox" class="signuppolicy">I
														have read the <a class="pp">Privacy Policy</a>
													</label>
												</div>
												<div class="text-center">
													<button type="submit" class="signupreg">Register</button>
												</div>
											</form>
										</div>
										<div class="text-center">
											<p class="alreadyreg">
												Already registered? <a class="text-decoration-none "
													data-bs-target="#login" data-bs-toggle="modal"
													data-bs-dismiss="modal"> Login Now </a>
											</p>
										</div>

									</div>
								</div>
							</div>
						</li>
						<li class="nav-item linkhelper">
							<div class="nav-btn Rounded-Rectangle-5-copy">
								<a class="nav-link " href="bap">Become a Helper</a>
							</div>
						</li>
						<li class="nav-item verline" >
							<div class="ver-line"></div>
						</li>
						<li class="nav-item notiflink">
							<div class="nav-btn">
								<a class="nav-link noti" href="#"><img
									src="<%=request.getContextPath()%>/resources/img/img-CS/icon-notification.png"></a>
							</div>
						</li>
						<li class="nav-item verline" >
							<div class="ver-line" ></div>
						</li>
						<li class="nav-item dropdown melink"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img
								src="<%=request.getContextPath()%>/resources/img/img-CS/me.png">
							</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdown">
								<c:if test="${user_type == 2 }">
									<li><a class="dropdown-item" href="customerDashboard">Dashboard</a></li>
								</c:if>
								
								<c:if test="${user_type == 3 }">
									<li><a class="dropdown-item" href="ServiceProviderDashboard">Dashboard</a></li>
								</c:if>
								
								<c:if test="${user_type == 1 }">
									<li><a class="dropdown-item" href="admin">Dashboard</a></li>
								</c:if>
								<li><a class="dropdown-item" href="logout"
									onclick="logout()">Log out</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

		</nav>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="BookNow" class="linkbook">Book Now</a> <a href="prices">Prices &
				Services</a> <a href="warranty">Warranty</a> <a href="#">Blog</a> <a
				href="contact">Contact</a>
			<div data-bs-toggle="modal" href="#loginnn">
				<a class="lm linklogin">Login</a>
			</div>
			<div class="modal fade" id="loginnn" aria-hidden="true"
				aria-labelledby="log" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="lmodal">Login to your account</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<div class="modal-body">
							<form action="loginprocess" method="post">
								<div>
									<input type="email" placeholder="Email" class="emailmodal"
										name="Email" />
								</div>
								<div>
									<input type="password" placeholder="Password" class="passmodal"
										name="Password" />
								</div>
								<div>
									<input type="checkbox" value="Remember me" id="rem" /> <label
										for="rem" class="remmodal">Remember me</label>
								</div>
								<div class="text-center">
									<button type="submit" class="loginbtnmodal">Login</button>
								</div>

							</form>
						</div>
						<div class="text-center">
							<a class="text-decoration-none fpassmodal"
								data-bs-target="#passm1" data-bs-toggle="modal"
								data-bs-dismiss="modal">Forgot Password?</a>
						</div>
						<div class=" text-center">
							<a class="accmodal" data-bs-target="#signupmodal1"
								data-bs-toggle="modal" data-bs-dismiss="modal">Don't have an
								account? <span class="create"> Create an account </span>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="passm1" aria-hidden="true"
				aria-labelledby="pass" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="pass">Forgot Password</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="forgotpassword" method="post">
								<input type="email" placeholder="Email Address"
									class="emailmodal" name="Email" />
								<button type="submit" class="sendemail">Send</button>
							</form>
						</div>
						<a class="text-decoration-none text-center loginnowmodal"
							data-bs-target="#loginnn" data-bs-toggle="modal"
							data-bs-dismiss="modal">Login Now</a>
					</div>
				</div>
			</div>

			<div class="modal fade" id="signupmodal1" aria-hidden="true"
				aria-labelledby="signup" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered ">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="signup">Create an account</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="addCustomer" method="post" oninput='cpass.setCustomValidity(cpass.value != Password.value ? "Passwords do not match." : "")'>
								<div>
									<input type="text" placeholder="First name" class="fnamemodal"
										name="FirstName" required /> <input type="text"
										placeholder="Last name" name="LastName" class="lnamemodal"
										required />
								</div>
								<div>
									<input type="email" placeholder="E-mail Address"
										class="signupemailmodal" name="Email" required /> <input
										type="text" placeholder="+49" class="pinmodal" name="pincode"
										disabled /> <input type="text" placeholder="Mobile Number" id="Mobile1"
										class="mnomodal" name="Mobile" required />
								</div>
								<div>
									<input type="password" placeholder="Password"
										class="signuppass" name="Password" id="Password1" required />
									<input type="password" placeholder="Confirm Password"
										id="ConfirmPassword1" name="cpass" class="confirmsignuppass"
										required />
								</div>
								<div class="text-center mb-2 mt-2" id="Passworddiv1"></div>

								<div class="text-center mb-2 mt-2" id="Mobilediv1"></div>

								<div class="text-center mb-2 mt-2" id="CheckPasswordMatch1"></div>
								<div>
									<input type="checkbox" value="privacy" id="ppcheckbox" required />
									<label for="ppcheckbox" class="signuppolicy">I have
										read the <a class="pp">Privacy Policy</a>
									</label>
								</div>
								<div class="text-center">
									<button type="submit" class="signupreg">Register</button>
								</div>
							</form>
						</div>
						<div class="text-center">
							<p class="alreadyreg">
								Already registered? <a class="text-decoration-none "
									data-bs-target="#loginnn" data-bs-toggle="modal"
									data-bs-dismiss="modal"> Login Now </a>
							</p>
						</div>

					</div>
				</div>
			</div>



			<a href="bap linkhelper">Become a Helper</a>
			<a class="nav-link noti notiflink" href="#">
				<span>Notifications</span></a>
			<li class="nav-item dropdown melink">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<span>My Account</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<c:if test="${user_type == 2 }">
						<li><a class="dropdown-item" href="customerDashboard">Dashboard</a></li>
					</c:if>
					
					<c:if test="${user_type == 3 }">
						<li><a class="dropdown-item" href="ServiceProviderDashboard">Dashboard</a></li>
					</c:if>
					
					<c:if test="${user_type == 1 }">
						<li><a class="dropdown-item" href="admin">Dashboard</a></li>
					</c:if>
					<li><a class="dropdown-item" href="logout"
						onclick="logout()">Log out</a></li>
				</ul>
			</li>
		</div>

		<div onclick="openNav()" class="sideham">&#9776;</div>

	</header>

	<section id="bannerFAQ">
		<img
			src="<%=request.getContextPath()%>/resources/img/img-FAQ/group-16.png"
			srcset="<%=request.getContextPath()%>/resources/img/img-FAQ/group-16@2x.png 2x,
    <%=request.getContextPath()%>/resources/img/img-FAQ/group-16@3x.png 3x"
			class="Group-16 img-fluid img-responsive">
	</section>

	<section id="titleFAQ">
		<span class="FAQs"> FAQs </span>


		<div
			class="text-center d-flex align-items-center justify-content-center line1">
			<img
				src="<%=request.getContextPath()%>/resources/img/img-FAQ/forma-1-copy-5.png">
		</div>

		<p
			class="Whether-you-are-Customer-or-Service-provider-We-have-tried-our justify-content-center text-center">
			Whether you are Customer or Service provider,<br> We have tried
			our best to solve all your queries and questions.
		</p>
	</section>

	<section id="contentFAQ">
		<div class="d-flex justify-content-center">
			<ul class="nav nav-pills tabs" role="tablist">
				<li class="nav-item custrect"><a
					class="nav-link active forcust" data-bs-toggle="pill" href="#cust">FOR
						CUSTOMER</a></li>
				<li class="nav-item sprect"><a class="nav-link forsp"
					data-bs-toggle="pill" href="#sp">FOR SERVICE PROVIDER</a></li>
			</ul>
		</div>


		<div class="tab-content">
			<div id="cust" class="accordion container tab-pane active">
				<div class="accordion-item" id="ques1">
					<a href="#ques1" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> What's included in cleaning?
					</a>
					<div class="answer">
						<p>Bedroom, Living Room & Common
							Areas,Bathrooms,Kitchen,Extras</p>
					</div>
				</div>

				<div class="accordion-item" id="ques2">
					<a href="#ques2" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> Which Helperland professional
						will come to my place?
					</a>
					<div class="answer">
						<p>Helperland has a vast network of experienced, top-rated
							cleaners. Based on the time and date of your request, we work to
							assign the best professional available.Like working with a
							specific pro? Add them to your Pro Team from the mobile app and
							they'll be requested first for all future bookings.You will
							receive an email with details about your professional prior to
							your appointment.</p>
					</div>
				</div>

				<div class="accordion-item" id="ques3">
					<a href="#ques3" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> Can I skip or reschedule
						bookings?
					</a>
					<div class="answer">
						<p>You can reschedule any booking for free at least 24 hours
							in advance of the scheduled start time. If you need to skip a
							booking within the minimum commitment, we’ll credit the value
							of the booking to your account. You can use this credit on future
							cleanings and other Helperland services.</p>
					</div>
				</div>

				<div class="accordion-item" id="ques4">
					<a href="#ques4" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> Do I need to be home for the
						booking?
					</a>
					<div class="answer">
						<p>We strongly recommend that you are home for the first clean
							of your booking to show your cleaner around. Some customers
							choose to give a spare key to their cleaner, but this decision is
							based on individual preferences.</p>
					</div>
				</div>
			</div>

			<div id="sp" class="container tab-pane fade accordion">
				<div class="accordion-item" id="ques5">
					<a href="#ques5" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> How much do service providers
						earn?
					</a>
					<div class="answer">
						<p>The self-employed service providers working with Helperland
							set their own payouts, this means that they decide how much they
							earn per hour.</p>
					</div>
				</div>

				<div class="accordion-item" id="ques6">
					<a href="#ques6" class="accordion-link"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object"> <img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
						class="Vector-Smart-Object1"> What support do you provide to
						the service providers?
					</a>
					<div class="answer">
						<p>Our call-centre is available to assist the service
							providers with all queries or issues in regards to their bookings
							during office hours. Before a service provider starts receiving
							jobs, every individual partner receives an orientation session to
							familiarise with the online platform and their profile.</p>
					</div>
				</div>


			</div>
		</div>



	</section>

	<!-- Newsletter -->

	<section id="news">
		<span class="text-center newsletter"> SUBSCRIBE TO NEWSLETTER </span>
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
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/white-logo-transparent-background-copy-4.png"
						class="white-logo" alt="logo"></a>
				</div>
				<div
					class=" links col-md-3 col-lg-5 justify-content-between align-items-center">
					<ul class=" d-flex justify-content-between align-items-center">
						<li><a href="homepage" class="text-decoration-none">HOME</a>
						</li>
						<li><a href="about" class="text-decoration-none ">ABOUT</a></li>
						<li><a href="#" class="text-decoration-none ">TESTIMONIALS</a>
						</li>
						<li><a href="faq" class="text-decoration-none ">FAQS</a></li>
						<li><a href="#" class="text-decoration-none">INSURANCE
								POLICY</a></li>
						<li><a href="#" class="text-decoration-none">IMPRESSUM</a></li>
					</ul>
				</div>
				<div class="icons col-md-1">
					<a href="https://www.facebook.com/helperDE/" target="_blank"
						class="text-decoration-none "><img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/facebook.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-FAQ/facebook@2x.png 2x,
              <%=request.getContextPath()%>/resources/img/img-FAQ/facebook@3x.png 3x"
						class="facebook"></a> <a
						href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none "><img
						src="<%=request.getContextPath()%>/resources/img/img-FAQ/instagram.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-FAQ/instagram@2x.png 2x,
              <%=request.getContextPath()%>/resources/img/img-FAQ/instagram@3x.png 3x"
						class="instagram"></a>
				</div>
				<div class="Rectangle-12-copy-2"></div>

				<span class="-Helperland-All-rights-reserved-Terms-and-Conditions">
					©2022 Helperland<span class="text-style-1">.</span> All rights
					reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
					class="terms text-decoration-none"> Terms and Conditions </a>&nbsp;
					| &nbsp; <a href="#" class="terms text-decoration-none">Privacy
						Policy</a>
				</span>
			</div>
		</div>
	</footer>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/FAQ.js"></script>
	<script>
		let name =
	<%=request.getAttribute("hideshow")%>
		if (name == null) {
			$(".notiflink").css("display", "none");
			$(".melink").css("display", "none");
			$(".verline").css("display", "none");
		}
		
		if (name != null) {
			$(".linklogin").css("display", "none");
			$(".linkhelper").css("display", "none");
		}
		
		let booknowsp = <%=request.getAttribute("booknowbtn")%>
		if (booknowsp == 3 || booknowsp == 1) {
			$(".linkbook").css("display", "none");
		}
				
	</script>
	
	<script>
		
		/* Validation msg for Password */
	
		$(document).ready(function() {
			$("#Password").on('keyup', function() {
				var password = $("#Password").val();
				var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
				if(!regularExpression.test(password)){
					$('#Passworddiv').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.<br><hr>").css("color", "red");
				}
				else{
					$('#Passworddiv').html("Password strength : Good<br><hr>").css("color", "green");
				}
			});
		});
		
		$(document).ready(function() {
			$("#Password1").on('keyup', function() {
				var password = $("#Password1").val();
				var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
				if(!regularExpression.test(password)){
					$('#Passworddiv1').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.<br><hr>").css("color", "red");
				}
				else{
					$('#Passworddiv1').html("Password strength : Good<br><hr>").css("color", "green");
				}
			});
		});
		
		/* Validation msg for Mobile */
		
		$(document).ready(function() {
			$("#Mobile").on('keyup', function() {
				var mob = $("#Mobile").val();
				var phoneno = /^\d{10}$/;
				if(!phoneno.test(mob)){
					$('#Mobilediv').html("Invalid mobile number.<br><hr>").css("color", "red");
				}
				else{
					$('#Mobilediv').html("");
				}
			});
		});
		
		$(document).ready(function() {
			$("#Mobile1").on('keyup', function() {
				var mob = $("#Mobile1").val();
				var phoneno = /^\d{10}$/;
				if(mob.match(phoneno)){
					$('#Mobilediv1').html("Invalid mobile number.<br><hr>").css("color", "red");
				}
				else{
					$('#Mobilediv1').html("");
				}
			});
		});
		
		
		/* Form Validations */
		
		$("#registerform").submit(function(event) {
			var password = document.forms["registerform"]["Password"].value;
			var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
			if(!regularExpression.test(password)){
				return false;
			}
			else{
				return true;
			}
			
			var phoneno = /^\d{10}$/;
			var mobile = document.forms["registerform"]["Mobile"].value;
			if(mobile.match(phoneno)){
			    return true;
			}
			else{
			    return false;
			}
		});
		
		
		$("#registerform").submit(function(event) {
			var password = document.forms["registerform"]["Password1"].value;
			var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
			if(!regularExpression.test(password)){
				return false;
			}
			else{
				return true;
			}
			
			var phoneno = /^\d{10}$/;
			var mobile = document.forms["registerform"]["Mobile"].value;
			if(mobile.match(phoneno)){
			    return true;
			}
			else{
			    return false;
			}
		});
		
	</script>
</body>

</html>