<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Homepage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Homepage-responsive.css" />
<title>Helperland</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
<style>
.first {
	background-image:
		url("<%=request.getContextPath()%>/resources/img/img-Homepage//group-35.png");
}
</style>
</head>

<body>
	<header class="first" id="head">
		<button id="topbtn" title="Back to Top" onclick="topFunction()">
			<div class="Ellipse-649">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-1(1).png" />
			</div>
		</button>
		<nav class="navbar navbar-expand-lg navbar-inverse bg-transparent see">
			<div class="container-fluid custom-toggler">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Homepage//white-logo-transparent-background.png"
					srcset="
              <%=request.getContextPath()%>/resources/img/img-Homepage//white-logo-transparent-background@2x.png 2x,
              <%=request.getContextPath()%>/resources/img/img-Homepage//white-logo-transparent-background@3x.png
            "
					class="white_logo_transparent_background" />

				<button class="navbar-toggler ml-auto" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item linkbook">
							<div class="text-center">
								<a class="nav-link book1 align-items-center" href="BookNow">Book
									Now</a>
							</div>
						</li>
						<li class="nav-item"><a class="nav-link prices" href="prices">Prices
								& Services</a></li>
						<li class="nav-item"><a class="nav-link warranty"
							href="warranty">Warranty</a></li>
						<li class="nav-item"><a class="nav-link blog">Blog</a></li>
						<li class="nav-item"><a class="nav-link contact"
							href="contact">Contact</a></li>
						<li class="nav-item linklogin">
							<div class="loginrect text-center" data-bs-toggle="modal"
								href="#login">
								<a class="nav-link loginbtn">Login</a>
							</div>
							<div class="modal fade" id="login">
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
														name="Email" required />
												</div>
												<div>
													<input type="password" placeholder="Password"
														class="passmodal" name="Password" required />
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
										<div class="text-center">
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
													class="emailmodal" name="Email" required />
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
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="signup">Create an account</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="addCustomer" method="post" id="registerform"
											oninput='ConfirmPassword.setCustomValidity(ConfirmPassword.value != Password.value ? "Passwords do not match." : "")'>
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
														name="pincode" disabled /> <input type="text"
														placeholder="Mobile Number" class="mnomodal" name="Mobile"
														id="Mobile" required />
												</div>
												<div>
													<input type="password" placeholder="Password"
														class="signuppass" name="Password" id="Password" required />
													<input type="password" placeholder="Confirm Password"
														id="ConfirmPassword" name="ConfirmPassword"
														class="confirmsignuppass" required />
												</div>
												
												<div class="text-center mb-2 mt-2"
													id="Mobilediv"></div>
													
												<div class="text-center mb-2 mt-2"
													id="Passworddiv"></div>
												
												
												<div class="text-center mb-2 mt-2"
													id="CheckPasswordMatch"></div>
												<div>
													<input type="checkbox" value="privacy" id="ppcheckbox"
														required /> <label for="ppcheckbox" class="signuppolicy">I
														have read the <a class="pp">Privacy Policy</a>
													</label>
												</div>
												<div class="text-center">
													<button type="submit" onsubmit="return registervalidation()" class="signupreg">Register</button>
												</div>
											</form>
										</div>
										<div class="text-center">
											<p class="alreadyreg">
												Already registered? <a class="text-decoration-none"
													data-bs-target="#login" data-bs-toggle="modal"
													data-bs-dismiss="modal"> Login Now </a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="nav-item linkhelper">
							<div class="bahrect text-center">
								<a class="nav-link helper" href="bap">Become A Helper!</a>
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
								<%-- <li><a class="dropdown-item" href="${user_type == 2 ? 'customerDashboard' :  'ServiceProviderDashboard'}">Dashboard</a></li> --%>
								
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
		
		<div class="position-absolute w-100  d-flex justify-content-center" style="top:140px; z-index:100;">
			<div class="alert alert-danger d-none w-75 h-25 fade show" ${errordiv } role="alert" id="error-alert">
				<div class="d-flex justify-content-between">
				<h5>${error }</h5>
			  	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			  	</div>
			</div>
		</div>
		
		<div class="position-absolute w-100  d-flex justify-content-center" style="top:140px; z-index:100;">
			<div class="alert alert-danger d-none w-75 h-25 fade show" ${plslogindiv } role="alert" id="login-alert">
				<div class="d-flex justify-content-between">
				<h5>${plslogin }</h5>
			  	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			  	</div>
			</div>
		</div>
		
		<div class="position-absolute w-100  d-flex justify-content-center" style="top:140px; z-index:100;">
			<div class="alert alert-success d-none w-75 h-25 fade show" ${successdiv } role="alert" id="success-alert">
				<div class="d-flex justify-content-between">
				<h5>${success }</h5>
			  	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			  	</div>
			</div>
		</div>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="BookNow" class="linkbook">Book Now</a> <a href="prices">Prices</a> <a
				href="warranty">Warranty</a> <a href="#">Blog</a> <a href="contact">Contact</a>
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
						<div class="text-center">
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
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="signup">Create an account</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form  id="registerform1" action="addCustomer" method="post" oninput='ConfirmPassword.setCustomValidity(ConfirmPassword.value != Password.value ? "Passwords do not match." : "")'>
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
										disabled /> <input type="text" placeholder="Mobile Number"
										class="mnomodal" name="Mobile" id="Mobile1" required />
								</div>
								<div>
									<input type="password" placeholder="Password"
										class="signuppass" name="Password" id="Password1" required />
									<input type="password" placeholder="Confirm Password"
										id="ConfirmPassword1" name="ConfirmPassword" class="confirmsignuppass"
										required />
								</div>
								<div class="text-center mb-2 mt-2"
									id="Passworddiv1"></div>
									
								<div class="text-center mb-2 mt-2"
									id="Mobilediv1"></div>	
								
								<div class="text-center mb-2 mt-2"
									id="CheckPasswordMatch1"></div>
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
								Already registered? <a class="text-decoration-none"
									data-bs-target="#loginnn" data-bs-toggle="modal"
									data-bs-dismiss="modal"> Login Now </a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<a href="bap" class="linkhelper">Become a Helper</a>
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

		<div class="row points">
			<div class="col-lg-4 col-md-5">
				<div class="housework">Do not feel like housework?</div>
				<p class="great">Great! Book now for Helperland and enjoy the
					benefits</p>
				<div class="newlist">
					<ul>
						<li>certified & insured helper</li>
						<li>easy booking procedure</li>
						<li>friendly customer service</li>
						<li>secure online payment method</li>
					</ul>
				</div>
			</div>

			<div
				class="col-lg-4 col-md-6 d-flex justify-content-center align-items-center">
				<a class="letsbook Lets-Book-a-Cleaner-copy text-decoration-none linkbook"
					href="BookNow" type="button"> Book a Helper! </a>
			</div>

			<div class="text-center loginmsg">Please login first!</div>
		</div>

		<div class="d-flex justify-content-between arrowline container">
			<div class="d-flex flex-column al1">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-1-copy.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-1-copy@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//forma-1-copy@3x.png 3x"
						class="Forma-1-copy" />
				</div>
				<span class="Enter-your-postcode">Enter postal code</span>
			</div>

			<img
				src="<%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1.png"
				srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1@3x.png 3x"
				class="step-arrow1 a1" />

			<div class="d-flex flex-column al2">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-22.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-22@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-22@3x.png 3x"
						class="Group-22" />
				</div>
				<span class="Select-your-plan"> Select desired date </span>
			</div>

			<img
				src="<%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy.png"
				srcset="
            <%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy@2x.png 2x,
            <%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy@3x.png 3x
          "
				class="step-arrow1-copy a2" />

			<div class="d-flex flex-column al3">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-1.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-1@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//forma-1@3x.png 3x"
						class="Forma-11" />
				</div>
				<span class="Pay-securely-online"> Secure online payment </span>
			</div>

			<img
				src="<%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy-2.png"
				srcset="
            <%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy-2@2x.png 2x,
            <%=request.getContextPath()%>/resources/img/img-Homepage//step-arrow-1-copy-2@3x.png 3x
          "
				class="step-arrow1-copy-2 a3" />

			<div class="d-flex flex-column al4">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-2.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//forma-2@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//forma-2@3x.png 3x"
						class="Forma-2" />
				</div>
				<span class="Enjoy-amazing-service"> Feel at home </span>
			</div>
		</div>

		<div class="text-center">
			<a href="#cy" class="text-decoration-none"><img
				src="<%=request.getContextPath()%>/resources/img/img-Homepage//ellipse-525.png"
				srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//ellipse-525@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//ellipse-525@3x.png 3x"
				class="Ellipse-525" /></a>
		</div>
		<div class="text-center">
			<a href="#cy" class="text-decoration-none"><img
				src="<%=request.getContextPath()%>/resources/img/img-Homepage//shape-1.png"
				srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//shape-1@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//shape-1@3x.png 3x"
				class="Shape-1" /></a>
		</div>
	</header>

	<section id="cy">
		<span class="convince"> Convince yourself! </span>

		<div class="d-flex justify-content-between container cyrow">
			<div class="d-flex flex-column cy1">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-21.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-21@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-21@3x.png 3x"
						class="Group-21" />
				</div>
				<div class="d-flex justify-content-center">
					<span class="whytitle"> Friendly & Certified Helpers </span>
				</div>
				<div class="d-flex justify-content-center">
					<span class="whydesc"> We want you to be completely
						satisfied with our service and feel comfortable at home. In order
						to guarantee this, our helpers go through a test procedure. Only
						when the cleaners meet our high standards, they may call
						themselves Helper. </span>
				</div>
			</div>

			<div class="d-flex flex-column cy2">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-23.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-23@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-23@3x.png 3x"
						class="Group-23" />
				</div>
				<div class="d-flex justify-content-center">
					<span class="whytitle"> Transparent and secure payment </span>
				</div>
				<div class="d-flex justify-content-center">
					<span class="whydesc"> We have transparent prices, you do
						not have to scratch money or money on the sideboard Leave it: Pay
						your helper easily and securely via the online payment method. You
						will also receive an invoice for each completed cleaning. </span>
				</div>
			</div>

			<div class="d-flex flex-column cy3">
				<div class="text-center">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-24.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-24@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-24@3x.png 3x"
						class="Group-24" />
				</div>
				<div class="d-flex justify-content-center">
					<span class="whytitle we"> We're here for you </span>
				</div>
				<div class="d-flex justify-content-center">
					<span class="whydesc"> You have a question or need
						assistance with the booking process? Our customer service is happy
						to help and advise you. How you can reach us you will find out
						when you look under "Contact". We look forward to hearing from you
						or reading. </span>
				</div>
			</div>
		</div>
	</section>

	<section id="wdk">
		<span id="sp1"><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp1.png"
			class="i1home" /></span> <span id="sp2"><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp2.png"
			class="i2home" /></span>
		<div class="d-flex justify-content-between container wdkrow">
			<div class="wdkpara">
				<span class="wdk-title"> We do not know what makes you happy,
					but ... </span> <span class="wdk-desc"> If it's not dusting off,
					our friendly helpers will free you from this burden - do not worry
					anymore about spending valuable time doing housework, but savor
					life, you're well worth your time with beautiful experiences. Free
					yourself and enjoy the gained time: Go celebrate, relax, play with
					your children, meet friends or dare to jump on the bungee.Other
					leisure ideas and exclusive events can be found in our blog -
					guaranteed free from dust and cleaning tips! </span>
			</div>
			<div class="text-right grp36">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-36.png"
					srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-36@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-36@3x.png 3x"
					class="Group-36" />
			</div>
		</div>
		<span><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp3.png"
			class="i3home" /></span> <span><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp4.png"
			class="i4home" /></span> <span><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp5.png"
			class="i5home" /></span> <span><img
			src="<%=request.getContextPath()%>/resources/img/img-Homepage//sp6.png"
			class="i6home" /></span>
	</section>

	<section id="customers">
		<span class="customers-title"> What Our Customers Say </span>
		<div class="d-flex container justify-content-between c-row">
			<div class="box">
				<div class="msgimg">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//message.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//message@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//message@3x.png 3x"
						class="message" />
				</div>
				<div class="d-flex">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-31.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-31@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-31@3x.png 3x"
						class="c-img" />
					<div class="d-flex flex-column">
						<p class="cname">Lary Watson</p>
						<p class="Manchester">Manchester</p>
					</div>
				</div>
				<p class="cdesc">Super Service!</p>
			</div>

			<div class="box">
				<div class="msgimg">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//message.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//message@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//message@3x.png 3x"
						class="message" />
				</div>
				<div class="d-flex">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-32.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-32@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-32@3x.png 3x"
						class="c-img" />
					<div class="d-flex flex-column">
						<p class="cname">John Smith</p>
						<p class="Manchester">Manchester</p>
					</div>
				</div>
				<p class="cdesc">Very good..!</p>
			</div>

			<div class="box b3">
				<div class="msgimg">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//message.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//message@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//message@3x.png 3x"
						class="message" />
				</div>
				<div class="d-flex">
					<img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//group-33.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//group-33@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//group-33@3x.png 3x"
						class="c-img" />
					<div class="d-flex flex-column">
						<p class="cname">Lars Johnson</p>
						<p class="Manchester">Manchester</p>
					</div>
				</div>
				<p class="cdesc">Nice work.</p>
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

	<!-- Logout Modal -->
		
	<div class="modal fade" id="logoutmodal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="text-center">
	      		<img class="success-booking-img" src="<%=request.getContextPath()%>/resources/img/img-BookNow/correct-white-medium.png">
	      	</div>
	        <p class="text-center ques1">You are successfully logged out! </p>
	      </div>
	    </div>
	  </div>
	</div>

	<footer>
		<div class="Rectangle-12">
			<div class="row justify-content-between align-items-center">
				<div class="logo col-md-1 col-sm-1">
					<a href="#head" class="text-decoration-none"><img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//white-logo-transparent-background-copy-4.png"
						class="white-logo" alt="logo" /></a>
				</div>
				<div
					class="links col-md-3 col-lg-5 justify-content-between align-items-center">
					<ul class="d-flex justify-content-between align-items-center">
						<li><a href="homepage" class="text-decoration-none">HOME</a>
						</li>
						<li><a href="about" class="text-decoration-none">ABOUT</a></li>
						<li><a href="#" class="text-decoration-none">TESTIMONIALS</a>
						</li>
						<li><a href="faq" class="text-decoration-none">FAQS</a></li>
						<li><a href="#" class="text-decoration-none">INSURANCE
								POLICY</a></li>
						<li><a href="#" class="text-decoration-none">IMPRESSUM</a></li>
					</ul>
				</div>
				<div class="icons col-md-1">
					<a href="https://www.facebook.com/helperDE/" target="_blank"
						class="text-decoration-none"><img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//facebook.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//facebook@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//facebook@3x.png 3x"
						class="facebook" /></a> <a
						href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none"><img
						src="<%=request.getContextPath()%>/resources/img/img-Homepage//instagram.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Homepage//instagram@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-Homepage//instagram@3x.png 3x"
						class="instagram" /></a>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollTrigger.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/Homepage.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/gsap.min.js"
		integrity="sha512-eP6ippJojIKXKO8EPLtsUMS+/sAGHGo1UN/38swqZa1ypfcD4I0V/ac5G3VzaHfDaklFmQLEs51lhkkVaqg60Q=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>


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
		
		$("#error-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#error-alert").slideUp(500);
		});
		
		$("#login-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#login-alert").slideUp(500);
		});
		
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
		    $("#success-alert").slideUp(500);
		});
		
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