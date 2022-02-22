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
<link href="<%=request.getContextPath()%>/resources/css/Contact.css"
	type="text/css" rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/Contact-responsive.css"
	type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Contact</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
</head>

<body>

	<header id="head">
		<button id="topbtn" title="Back to Top" onclick="topFunction()">
			<div class="Ellipse-649">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Contact/forma-1(1).png">
			</div>
		</button>
		<nav class="navbar navbar-expand-lg navbar-inverse bg-dark contactnav">
			<div class="container-fluid custom-toggler">
				<a class="navbar-brand" href="homepage"> <img
					src="<%=request.getContextPath()%>/resources/img/img-Contact/logo-small.png"
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

												<!-- 
												<table align="center">
													<tr>
														<td style="font-style: italic; color: red;">${message}</td>
													</tr>
												</table> -->
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
											<form action="addCustomer" method="post">
												<div>
													<input type="text" placeholder="First name"
														class="fnamemodal" name="FirstName" required /> <input
														type="text" placeholder="Last name" name="LastName"
														class="lnamemodal" required />
												</div>
												<div>
													<input type="email" placeholder="E-mail Address"
														class="signupemailmodal" name="Email" required /> <input
														type="text" placeholder="+49" class="pinmodal"
														name="pincode" disabled /> <input type="text"
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
												<div style="margin-top: 7px;" class="text-center mb-2"
													id="CheckPasswordMatch"></div>
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
			<a href="BookNow">Book Now</a> <a href="prices">Prices &
				Services</a> <a href="warranty">Warranty</a> <a href="#">Blog</a> <a
				href="contact">Contact</a>
			<div data-bs-toggle="modal" href="#loginnn">
				<a class="lm">Login</a>
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

								<!-- 
												<table align="center">
													<tr>
														<td style="font-style: italic; color: red;">${message}</td>
													</tr>
												</table> -->
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
							<form action="addCustomer" method="post">
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
										disabled /> <input type="text" placeholder="Mobile Number"
										class="mnomodal" name="Mobile" required />
								</div>
								<div>
									<input type="password" placeholder="Password"
										class="signuppass" name="Password" id="Password1" required />
									<input type="password" placeholder="Confirm Password"
										id="ConfirmPassword1" name="cpass" class="confirmsignuppass"
										required />
								</div>
								<div style="margin-top: 7px;" class="text-center mb-2"
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
								Already registered? <a class="text-decoration-none "
									data-bs-target="#loginnn" data-bs-toggle="modal"
									data-bs-dismiss="modal"> Login Now </a>
							</p>
						</div>

					</div>
				</div>
			</div>



			<a href="bap">Become a Helper</a>
		</div>

		<div onclick="openNav()" class="sideham">&#9776;</div>

	</header>

	<section>
		<img
			src="<%=request.getContextPath()%>/resources/img/img-Contact/group-16.png"
			srcset="<%=request.getContextPath()%>/resources/img/img-Contact/group-16@2x.png 2x,
        <%=request.getContextPath()%>/resources/img/img-Contact/group-16@3x.png 3x"
			class="Group-16 img-responsive img-fluid"> <span
			class="Contact-us"> Contact us </span>

		<div
			class="text-center d-flex align-items-center justify-content-center line1">
			<img
				src="<%=request.getContextPath()%>/resources/img/img-Contact/forma-1-copy-5.png">
		</div>


		<div class="c-row mx-auto container justify-content-between r12">
			<div class="img1 text-center">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Contact/forma-1.png"
					srcset="<%=request.getContextPath()%>/resources/img/img-Contact/forma-1@2x.png 2x,
                <%=request.getContextPath()%>/resources/img/img-Contact/forma-1@3x.png 3x"
					class="Forma-1 text-center align-items-center justify-content-center">

				<span class="-Lorem-ipsum-text-100-Lorem-ipsum-AB flex-column">
					Konigswinterer Str. 116 53227 Bonn </span>
			</div>

			<div class="text-center img2 align-center">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Contact/phone-call.png"
					srcset="<%=request.getContextPath()%>/resources/img/img-Contact/phone-call@2x.png 2x,
                <%=request.getContextPath()%>/resources/img/img-Contact/phone-call@3x.png 3x"
					class="phone-call"> <span class="num1"> +49 (40) 123
					56 7890 </span> <span class="num2"> +49 (40) 987 56 0000 </span>
			</div>

			<div class="text-center img3">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-Contact/vector-smart-object.png"
					srcset="<%=request.getContextPath()%>/resources/img/img-Contact/vector-smart-object@2x.png 2x,
                <%=request.getContextPath()%>/resources/img/img-Contact/vector-smart-object@3x.png 3x"
					class="Vector-Smart-Object"> <span class="infohelperlandcom">
					info@helperland.com </span>
			</div>

		</div>

		<div class="text-center">
			<div class="Rectangle-21"></div>
		</div>

	</section>

	<section id="getInTouch">
		<span class="Get-in-touch-with-us"> Get in touch with us </span>

		<div class="text-center">
			<form action="savecontact" method="post">
				<div class="f1">

					<input type="text" placeholder="First Name" name="FName"
						class="Rounded-Rectangle-2" required> <input type="text"
						placeholder="Last Name" class="Rounded-Rectangle-2-copy-2"
						name="LName" required>

				</div>


				<div class="f2">
					<input type="text" placeholder="+49"
						class="Rounded-Rectangle-2-copy-20" disabled> <input
						type="text" placeholder="Mobile number" name="PhoneNumber"
						class="Rounded-Rectangle-2-copy-10" required> <input
						type="email" name="Email" placeholder="Email address"
						class="Rounded-Rectangle-2-copy-7" required>
				</div>

				<div>
					<select title="Subject" name="Subject"
						class="Rounded-Rectangle-2-copy-12" required>
						<option value="General">&nbsp;&nbsp;General</option>
						<option value="Inquiry">&nbsp;&nbsp;Inquiry</option>
						<option value="Renewal">&nbsp;&nbsp;Renewal</option>
						<option value="Revocation">&nbsp;&nbsp;Revocation</option>
					</select>
				</div>

				<div>
					<input type="text" placeholder="Message" name="Message"
						class="Rounded-Rectangle-2-copy-11" required>
				</div>

				<label class="attachment">Attachment</label><br>
				<div class="d-flex justify-content-center">
					<div class="input-group mb-3 Rounded-Rectangle-2-copy-12"
						style="height: auto">
						<input type="file" class="form-control" id="inputGroupFile02">
					</div>
				</div>

				<button type="submit" class="Rounded-Rectangle-2-copy-6">Submit</button>
			</form>
		</div>

	</section>

	<section id="maps">
		<div style="width: 100%">
			<iframe width="100%" height="400" frameborder="0" scrolling="no"
				marginheight="0" marginwidth="0"
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.6979157244114!2d72.49824711445191!3d23.034861321650208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1640187081460!5m2!1sen!2sin"></iframe>
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
						src="<%=request.getContextPath()%>/resources/img/img-Contact/white-logo-transparent-background-copy-4.png"
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
						src="<%=request.getContextPath()%>/resources/img/img-Contact/facebook.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Contact/facebook@2x.png 2x,
                            <%=request.getContextPath()%>/resources/img/img-Contact/facebook@3x.png 3x"
						class="facebook"></a> <a
						href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none "><img
						src="<%=request.getContextPath()%>/resources/img/img-Contact/instagram.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-Contact/instagram@2x.png 2x,
                            <%=request.getContextPath()%>/resources/img/img-Contact/instagram@3x.png 3x"
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

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/Contact.js"></script>
</body>

</html>