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
<link href="<%=request.getContextPath()%>/resources/css/Warranty.css"
	type="text/css" rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/Warranty-responsive.css"
	type="text/css" rel="stylesheet">
<title>Warranty</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
</head>

<body>
	<header id="head">
		<button id="topbtn" title="Back to Top" onclick="topFunction()">
			<div class="Ellipse-649">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Warranty/forma-1(1).png">
			</div>
		</button>
		<nav
			class="navbar navbar-expand-lg navbar-inverse bg-dark warrantynav">
			<div class="container-fluid custom-toggler">
				<a class="navbar-brand" href="homepage"> <img
					src="<%=request.getContextPath()%>/resources/img/img-Warranty/logo-small.png"
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
											<form action="addCustomer" id="registerform" method="post" oninput='cpass.setCustomValidity(cpass.value != Password.value ? "Passwords do not match." : "")'>
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
								<a class="nav-link" href="bap">Become a Helper</a>
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
							<form action="addCustomer" id="registerform1" method="post" oninput='cpass.setCustomValidity(cpass.value != Password.value ? "Passwords do not match." : "")'>
								<div>
									<input type="text" placeholder="First name" class="fnamemodal"
										name="FirstName" required /> <input type="text"
										placeholder="Last name" name="LastName" class="lnamemodal"
										required />
								</div>
								<div>
									<input type="email" placeholder="E-mail Address"
										class="signupemailmodal" name="Email" required /> <input
										type="text" placeholder="+91" class="pinmodal" name="pincode"
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



			<a href="bap" class=" linkhelper">Become a Helper</a>
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

	<section id="bannerwarranty">
		<img
			src="<%=request.getContextPath()%>/resources/img/img-Warranty/guarantee-banner.png"
			class="gbanner img-responsive img-fluid">
	</section>

	<section id="guaranteepara">
		<span class="Guarantee"> Our Guarantee </span>

		<div
			class="text-center d-flex align-items-center justify-content-center line1">
			<img
				src="<%=request.getContextPath()%>/resources/img/img-Warranty/forma-1-copy-5.png">
		</div>

		<div class="text-center">
			<p class="gmain">The professionals you'll get</p>
			<p class="gmainpara">All pros on the Helperland's platform are
				screened, background checked and rated by customers like you. And
				for cleaning, your favorite pro can come back again and again to
				clean your home just the way you like it.</p>
			<div class="damagepara">
				<span class="damage"> We covered your damage </span>
				<div
					class="text-center d-flex align-items-center justify-content-center line1">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Warranty/forma-1-copy-5.png">
				</div>
				<span class="text-center damagerare"> In the rare event of
					damage, Helperland's got your back. Every booking on the Helperland
					platform is insured. </span>
			</div>
		</div>

	</section>

	<section id="backed">
		<div class="container d-flex justify-content-between guaflex">
			<div class="d-flex justify-content-center align-items-center guarimg">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Warranty/guarantee.png">
			</div>
			<div class="d-flex flex-column">
				<p class="guarbacked">Backed by the Helperland Service Guarantee</p>
				<p class="guarfinal">Your happiness is our goal. If you're not
					happy, we'll work to make it right. Helperland strives to match you
					with the right pro for you and your home every time. If you are not
					satisfied with the quality of the service, we'll send another pro
					at no extra charge for your next booking.</p>
			</div>
			<div class="d-flex align-items-center justify-content-center ">
				<a type="button" class="bookguarantee text-decoration-none linkbook"
					href="BookNow">Book a Cleaner</a>
			</div>
		</div>
	</section>

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
						src="<%=request.getContextPath()%>/resources/img/img-Warranty/white-logo-transparent-background-copy-4.png"
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
						src="<%=request.getContextPath()%>/resources/img/img-Warranty/facebook.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Warranty/facebook@2x.png 2x,
                            <%=request.getContextPath()%>/resources/img/img-Warranty/facebook@3x.png 3x"
						class="facebook"></a> 
					<a href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none "><img
						src="<%=request.getContextPath()%>/resources/img/img-Warranty/instagram.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Warranty/instagram@2x.png 2x,
                            <%=request.getContextPath()%>/resources/img/img-Warranty/instagram@3x.png 3x"
						class="instagram"></a>
				</div>
				<div class="Rectangle-12-copy-2"></div>

				<span class="-Helperland-All-rights-reserved-Terms-and-Conditions">
					?2022 Helperland<span class="text-style-1">.</span> All rights
					reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
					class="terms text-decoration-none"> Terms and Conditions </a>&nbsp;
					| &nbsp; <a href="#" class="terms text-decoration-none">Privacy
						Policy</a>
				</span>
			</div>
		</div>
	</footer>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/Warranty.js"></script>
	
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
		
	$(document).ready(function() {
		$("#ConfirmPassword").on('keyup', function() {
			var password = $("#Password").val();
			var confirmPassword = $("#ConfirmPassword").val();
			if (password != confirmPassword)
				$("#CheckPasswordMatch").html("Password does not match !").css("color", "red");
			else
				$("#CheckPasswordMatch").html("Password matches !").css("color","green");
		});
		
		$("#Password").on('keyup', function() {
			var password = $("#Password").val();
			var confirmPassword = $("#ConfirmPassword").val();
			if (password != confirmPassword)
				$("#CheckPasswordMatch").html("Password does not match !").css("color", "red");
			else
				$("#CheckPasswordMatch").html("Password matches !").css("color","green");
		});
	});

	$(document).ready(function() {
		$("#ConfirmPassword1").on('keyup',function() {
			var password1 = $("#Password1").val();
			var confirmPassword1 = $("#ConfirmPassword1").val();
			if (password1 != confirmPassword1)
				$("#CheckPasswordMatch1").html("Password does not match !").css("color", "red");
			else
				$("#CheckPasswordMatch1").html("Password matches !").css("color","green");
		});
		
		$("#Password1").on('keyup',function() {
			var password1 = $("#Password1").val();
			var confirmPassword1 = $("#ConfirmPassword1").val();
			if (password1 != confirmPassword1)
				$("#CheckPasswordMatch1").html("Password does not match !").css("color", "red");
			else
				$("#CheckPasswordMatch1").html("Password matches !").css("color","green");
		});
	});
	
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
			if(!phoneno.test(mob)){
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
	});
	
	$("#registerform").submit(function(event) {
		var phoneno = /^\d{10}$/;
		var mobile = document.forms["registerform"]["Mobile"].value;
		if(!phoneno.test(mobile)){
			return false;
		}
		else{
			return true;
		}
	});
	
	
	$("#registerform1").submit(function(event) {
		var password = document.forms["registerform1"]["Password"].value;
		var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
		if(!regularExpression.test(password)){
			return false;
		}
		else{
			return true;
		}
	});
	
	$("#registerform1").submit(function(event) {
		var phoneno = /^\d{10}$/;
		var mobile = document.forms["registerform1"]["Mobile"].value;
		if(!phoneno.test(mobile)){
			return false;
		}
		else{
			return true;
		}
	});
	</script>
</body>

</html>