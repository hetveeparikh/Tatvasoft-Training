<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

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
	href="<%=request.getContextPath()%>/resources/css/BookNow.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/BookNow-responsive.css"
	type="text/css">

<title>Book Now | Helperland</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
</head>

<body>

	<header id="head">
		<button id="topbtn" title="Back to Top" onclick="topFunction()">
			<div class="Ellipse-649">
				<img
					src="<%=request.getContextPath()%>/resources/img/img-BookNow/forma-1(1).png">
			</div>
		</button>
		<nav class="navbar navbar-expand-lg navbar-inverse bg-dark faqnav">
			<div class="container-fluid custom-toggler">
				<a class="navbar-brand" href="homepage"> <img
					src="<%=request.getContextPath()%>/resources/img/img-BookNow/logo-small.png"
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
								<li><a class="dropdown-item" href="customerDashboard" id="dash">Dashboard</a></li>
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
			<a href="BookNow">Book Now</a> <a href="prices">Prices & Services</a>
			<a href="warranty">Warranty</a> <a href="#">Blog</a> <a
				href="contact">Contact</a>
			
			<a class="nav-link noti notiflink" href="#">
				<span>Notifications</span></a>
			<li class="nav-item dropdown melink">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<span>My Account</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="customerDashboard">Dashboard</a></li>
					<li><a class="dropdown-item" href="logout"
						onclick="logout()">Log out</a></li>
				</ul>
			</li>
		</div>

		<div onclick="openNav()" class="sideham">&#9776;</div>

	</header>

	<section id="bannerBookNow">
		<img
			src="<%=request.getContextPath()%>/resources/img/img-BookNow/book-service-banner.jpg"
			class="BNbanner img-fluid img-responsive">
	</section>

	<section id="titleBN">
		<span class="BNtitle"> Set up your cleaning service </span>

		<div
			class="text-center d-flex align-items-center justify-content-center line1">
			<img
				src="<%=request.getContextPath()%>/resources/img/img-BookNow/forma-1-copy-5.png">
		</div>

	</section>

	<section id="mainBN">
		<div class="d-flex justify-content-center BNmain">
			<div class="d-flex flex-column me-lg-5">
				<div class="d-flex justify-content-center">
					<ul class="nav nav-pills tabs" role="tablist">
						<li class="nav-item"><button class="nav-link "
								data-bs-toggle="pill" id="service" disabled>
								<img
									src="<%=request.getContextPath()%>/resources/img/img-BookNow/setup-service-white.png"
									id="servimg"><span>Service</span>
							</button></li>
						<li class="nav-item"><button class="nav-link "
								data-bs-toggle="pill" id="schedule" disabled>
								<img
									src="<%=request.getContextPath()%>/resources/img/img-BookNow/schedule-white.png"
									id="scheimg"> <span>Schedule & Plan</span>
							</button></li>
						<li class="nav-item"><button class="nav-link "
								data-bs-toggle="pill" id="details" disabled>
								<img
									src="<%=request.getContextPath()%>/resources/img/img-BookNow/details-white.png"
									id="detailsimg"> <span>Your Details</span>
							</button></li>
						<li class="nav-item"><button class="nav-link "
								data-bs-toggle="pill" id="payment" disabled>
								<img
									src="<%=request.getContextPath()%>/resources/img/img-BookNow/payment-white.png"
									id="payimg"> <span>Make Payment</span>
							</button></li>
					</ul>
				</div>

				<div class="contentdiv">
					<div class="contenthere">
					
						<!-- First tab -->

						<div id="firsttab">

							<span class="posttitle">Enter Your Postal Code</span>
							<form id="firstform">
								<input type="text" name="PostalCode" placeholder="Postal Code"
									class="postaltext" id="pincode"  > 
								<input type="submit"
									onclick="firstvalid()" class="checkpostal" id="checkpin"
									value="Check Availability">
							</form>
							<div id="firstdiv"></div>

						</div>

						<!-- second tab -->

						<div id="secondtab">

							<form id="secondform" action="schedule-plan" method="post">
								<div class="d-flex scheque">
									<div class="sche1">
										<span class="posttitle">When do you need the cleaner?</span>
										<div class="d-flex when">
											<div class="d-flex">
												<input type="date" id="tomorrowdate" name="TomorrowDate" >
											</div>
											<div>
												<select title="Time" class="timerect"
													name="ServiceStartTime" id="starttime">
													<option value="8.0" selected>8:00</option>
													<option value="8.5">8:30</option>
													<option value="9.0">9:00</option>
													<option value="9.5">9:30</option>
													<option value="10.0">10:00</option>
													<option value="11.5">11:30</option>
												</select>
											</div>
										</div>
									</div>
									
									<div>
										<span class="posttitle">How long do you need your
											cleaner to stay?</span>

										<div>
											<select title="Time" class="timerect" id="timeneeded"
												name="ServiceHours"   onclick="clicktime()">
												<option value="3">3.0 Hrs</option>
												<option value="4">4.0 Hrs</option>
												<option value="5">5.0 Hrs</option>
												<option value="6">6.0 Hrs</option>
											</select>
										</div>
									</div>
								</div>


								<div class="divider3"></div>

								<span class="posttitle">Extra Services</span>

								<div class=" d-flex justify-content-between es row">


									<div
										class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-4"
										onclick="chngimg1()" id="changediv1">
										<div class="esellipse" id="ellipse1">
											<img
												src="<%=request.getContextPath()%>/resources/img/img-Prices/firstimg.png"
												class="esimg" id="img1">
										</div>

										<span class="esinside" id="es1"> Inside cabinets </span>
									</div>

									<div
										class="d-flex flex-column align-items-center es1 col-lg-2 col-md-4"
										onclick="chngimg2()">
										<div class="esellipse">
											<img
												src="<%=request.getContextPath()%>/resources/img/img-Prices/secondimg.png"
												class="esimg" id="img2">
										</div>

										<span class="esinside" id="es2"> Inside fridge </span>
									</div>

									<div
										class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-4"
										onclick="chngimg3()">
										<div class="esellipse">
											<img
												src="<%=request.getContextPath()%>/resources/img/img-Prices/thirdimg.png"
												class="esimg" id="img3">
										</div>

										<span class="esinside" id="es3"> Inside oven </span>
									</div>

									<div
										class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-6"
										onclick="chngimg4()">
										<div class="esellipse">
											<img
												src="<%=request.getContextPath()%>/resources/img/img-Prices/fourthimg.png"
												class="esimg" id="img4">
										</div>

										<span class="esinside" id="es4"> Laundry wash & dry </span>
									</div>

									<div
										class=" d-flex flex-column align-items-center es1 col-lg-2 col-md-6"
										onclick="chngimg5()">
										<div class="esellipse">
											<img
												src="<%=request.getContextPath()%>/resources/img/img-Prices/fifthimg.png"
												class="esimg" id="img5">
										</div>

										<span class="esinside" id="es5"> Interior windows </span>
									</div>

								</div>
								
								<input type="hidden" id="ExtraHours"  
										name="ExtraHours"> 
									<input type="hidden"
										id="TotalCost"   name="TotalCost">
									<input type="hidden" id="SubTotal" form="mainServiceForm"
										name="SubTotal"> 
									<input type="hidden"
										name="CreatedDate"   id="CreatedDate">
									<input type="hidden" name="ModifiedDate"
										  id="ModifiedDate"> 

								<div class="divider3"></div>

								<span class="posttitle">Comments</span> <textarea
									placeholder="Comments" class="comments" name="Comments"  id="secondcomments"></textarea>

								<div>
									<input type="checkbox" id="petsathome" /> 
									<label for="petsathome" class="pets">I have pets at home</label>
								</div>


								<div class="divider3"></div>

								<div class="cbtn">
									<button type="button" class="schecontinue" onclick="firsttab()">Go back</button>
									<input type="button" class="schecontinue" onclick="thirdtab()"
										value="Continue">
								</div>
							</form>
						</div>

						<!-- third tab -->

						<div id="thirdtab">


							<span class="posttitle">Enter your contact details, so we
								can serve you in better way!</span>


							<div id="showadd" class="table-responsive  mt-2 mb-2 p-2">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
							</div>

							<div data-bs-toggle="modal" href="#address">
								<input type="button" value="+ Add new Address" class="addbtn">
							</div>

							<div class="modal fade" id="address" aria-hidden="true"
								aria-labelledby="log" tabindex="-1">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="addmodal">Add new address</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal"></button>
										</div>
										<form id="addAddressForm" name="addAddressForm">
											<div class="modal-body">

												<div>
													<input type="text" placeholder="Street Name" class="street"
														name="AddressLine1" id="addline1" required/> <input type="text"
														placeholder="House Number" class="houseno"
														name="AddressLine2" id="addline2" required/>
												</div>

												<div>
													<input type="text" placeholder="Postal Code" class="postal"
														name="PostalCode" id="addpostalcode" required/> <select
														title="City" class="city" name="City" id="addcity" required>
														<option value="">Choose your city</option>
														<option value="A">A</option>
														<option value="B">B</option>
														<option value="C">C</option>
														<option value="D">D</option>
													</select>
												</div>

												<div>
													<input type="text" placeholder="Phone Number"
														class="number" name="Mobile" id="addmobile" required/>

												</div>
											</div>
											<div class="text-center mb-2 mt-2" id="Mobiledivnewadd"></div>
											<div class="text-center">
												<button type="submit" class="saveadd">Save</button>
												<input type="button" class="canceladd" value="Close" data-bs-dismiss="modal"/>
											</div>

										</form>
									</div>
								</div>
							</div>

							<!-- <div>
								<input type="checkbox" id="invoice" /> <label for="invoice"
									class="invoice">Send invoice on this address</label>
							</div> -->

							<div class="divider3"></div>

							<div class="cbtn">
								<button class="schecontinue" onclick="secondtab()">Go back</button>
								<button class="schecontinue" onclick="fourthtab()" id="thirdcontinue">Continue</button>
							</div>



						</div>

						<!-- fourth tab -->

						<div id="fourthtab">

							<form id="finaltab" method="post">
								<span class="posttitle">Pay securely with Helperland
									payment gateway!</span>
								<div>
									<span class="pcodetitle">Promo code (optional)</span>
									<div>
										<input type="text" placeholder="Promo code (optional)"
											class="pcode">
										<button class="apply">Apply</button>
									</div>
								</div>

								<div class="divider3"></div>
								<div class="d-flex booklabel">
									<input type="checkbox" id="payment" name="PaymentCheck" required/> 
									<label for="payment" class="bookpayment">I accepted terms and conditions,
										the cancellation policy and the privacy policy. </label>
								</div>
								<div class="divider3"></div>
								<div class="cbtn">
									<button type="button" class="bookbtn" onclick="thirdtab();" id="selectadd">Select Address</button>
									<button type="submit" class="bookbtn">Complete
										Booking</button>
								</div>
							 </form>
						</div>
					</div>
				</div>


			</div>

			<div class="d-flex justify-content-center">
				<div class="psumm">
					<div class="paymentsummary d-flex flex-column">
						<span class="summtitle">Payment Summary</span> <span class="pay">Duration</span>
						<div class="d-flex justify-content-between">
							<span class="pay">Basic</span> <span class="pay" id="basictime">3
								Hrs</span>
						</div>

						<span class="pay extras" id="extras"></span>
						<div id="extrahere"></div>

						<div class="d-flex justify-content-center">
							<div class="divider1"></div>
						</div>
						<div class="d-flex justify-content-between">
							<span class="tst">Total Service Time</span> <span class="tst"
								id="totaltime">3 Hrs</span>
						</div>
						<div class="divider2"></div>
						<div class="d-flex justify-content-between">
							<span class="pay">Per cleaning</span>
							<div class="d-flex">
								<span class="pay1" id="perclean">54,00</span>
								<div class="d-flex align-items-center">
									<img
										src="<%=request.getContextPath()%>/resources/img/img-BookNow/euro.png"
										class="payeuro">
								</div>
							</div>
						</div>
						<div class="divider2"></div>
						<div class="d-flex justify-content-between">
							<span class="total">Total Payment</span>
							<div class="d-flex">
								<span class="totalpay" id="totalpay">54,00</span>
								<div class="d-flex align-items-center">
									<img
										src="<%=request.getContextPath()%>/resources/img/img-BookNow/blue-euro.png"
										class="totaleuro">
								</div>
							</div>
						</div>
						<span class="sales">No sales tax is calculated.</span>

						<div class="smiley d-flex">
							<div class="d-flex align-items-center">
								<img
									src="<%=request.getContextPath()%>/resources/img/img-BookNow/smiley.png"
									class="smileyimg">
							</div>
							<div>
								<a class="included text-decoration-none" data-bs-toggle="modal"
									data-bs-target="#includedmodal">See what is always included</a>
								<div class="modal" id="includedmodal">
									<div
										class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
										<div class="modal-content">

											<div class="modal-header">
												<h4 class="modal-title">What we include in cleaning</h4>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal"></button>
											</div>

											<!-- Modal body -->
											<div class="modal-body d-flex includeflex">
												<div>
													<p class="includedtitle">Bedroom and Living Room</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Dust all accessible surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Wipe down all mirrors and glass fixtures
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Not
														Included Clean all floor surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Take out garbage and recycling
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">To
														clean up
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Make
														beds
													</p>
												</div>
												<div>
													<p class="includedtitle">Bathrooms</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Wash and sanitize the toilet, shower, tub, sink
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Not
														Included Dust all accessible surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Wipe down all mirrors and glass fixtures
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Not
														Included Clean all floor surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Take out garbage and recycling
													</p>
												</div>
												<div>
													<p class="includedtitle">Kitchen</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Dust all accessible surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Empty sink and load up dishwasher
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Clean all floor surfaces
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Included
														Take out garbage and recycling
													</p>
													<p class="incpoints">
														<img
															src="<%=request.getContextPath()%>/resources/img/img-BookNow/tick.png">Cleaning
														the sink and the oven (outside)
													</p>
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
								<a href="#ques1" class="accordion-link"> <img
									src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
									class="Vector-Smart-Object"> <img
									src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
									class="Vector-Smart-Object1"> What's included in
									cleaning?
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
									class="Vector-Smart-Object1"> Which Helperland
									professional will come to my place?
								</a>
								<div class="answer">
									<p>Helperland has a vast network of experienced, top-rated
										cleaners. Based on the time and date of your request, we work
										to assign the best professional available.Like working with a
										specific pro? Add them to your Pro Team from the mobile app
										and they'll be requested first for all future bookings.You
										will receive an email with details about your professional
										prior to your appointment.</p>
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
									<p>You can reschedule any booking for free at least 24
										hours in advance of the scheduled start time. If you need to
										skip a booking within the minimum commitment, we'll credit the
										value of the booking to your account. You can use this credit
										on future cleanings and other Helperland services.</p>
								</div>
							</div>

							<div class="accordion-item" id="ques4">
								<a href="#ques4" class="accordion-link"> <img
									src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
									class="Vector-Smart-Object"> <img
									src="<%=request.getContextPath()%>/resources/img/img-FAQ/vector-smart-object.png"
									class="Vector-Smart-Object1"> Do I need to be home for
									the booking?
								</a>
								<div class="answer">
									<p>We strongly recommend that you are home for the first
										clean of your booking to show your cleaner around. Some
										customers choose to give a spare key to their cleaner, but
										this decision is based on individual preferences.</p>
								</div>
							</div>
						</div>
					</div>

					<a class="text-decoration-none morehelp" href="faq">For more
						help</a>
				</div>
			</div>


		</div>
		
		<!-- Success Modal -->
		
		<div class="modal fade" id="successmodal">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<div class="text-center">
		      		<img class="success-booking-img" src="<%=request.getContextPath()%>/resources/img/img-BookNow/correct-white-medium.png">
		      	</div>
		        <p class="text-center ques1">Booking has been successfully submitted </p>
		        <p class="text-center ques1">Service Request Id : &nbsp;<span id="bookingid"></span> </p>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Date Modal -->
		
		<div class="modal fade" id="datemodal">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body">
		        <p class="text-center ques1">Please enter date!</p>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Date Modal -->
		
		<div class="modal fade" id="addressmodal">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body">
		        <p class="text-center ques1">Please go to previous page and select address!</p>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Loader -->

		<div id="loading-image">
			<div class="loader"></div>
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
						src="<%=request.getContextPath()%>/resources/img/img-BookNow/white-logo-transparent-background-copy-4.png"
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
						src="<%=request.getContextPath()%>/resources/img/img-BookNow/facebook.png"
						class="facebook"></a> <a
						href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none "><img
						src="<%=request.getContextPath()%>/resources/img/img-BookNow/instagram.png"
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/BookNow.js"></script>

	<script type="text/javascript">
	
		array=[];
	
		function chngimg1() {

			var image1 = document.getElementById('img1');
			
			
			if (image1.src.match("firstimg.png")) {
				image1.src = "<%=request.getContextPath()%>/resources/img/img-BookNow/assets/3-green.png";
				document.getElementById('extras').innerHTML="<b>Extras</b>";
				
				array.push("Inside-Cabinets...");
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++){
					html = html + array[i];
				}
				items.innerHTML=html;
				
				console.log(array);
				updatetime();
				addcost();
				
			} else {
				image1.src = "<%=request.getContextPath()%>/resources/img/img-Prices/firstimg.png";
				
				var myIndex = array.indexOf("Inside-Cabinets...");
				if (myIndex !== -1) {
				    array.splice(myIndex, 1);
				}
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				if(array.length === 0){
					document.getElementById('extras').innerHTML="";
				}
				
				
				console.log(array);
				updatetime();
				removecost();
			}
		
		}

		
		function chngimg2() {
			var image2 = document.getElementById('img2');
			var time = parseFloat(document.getElementById('timeneeded').value);	
			
			var price = parseFloat(document.getElementById('perclean').innerText);

			if (image2.src.match("secondimg.png")) {
				image2.src = "<%=request.getContextPath()%>/resources/img/img-BookNow/assets/5-green.png";
				document.getElementById('extras').innerHTML="<b>Extras</b>"
				
				array.push("Inside-fridge...");
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				console.log(array);
				updatetime();
				addcost();
				
			} else {
				image2.src = "<%=request.getContextPath()%>/resources/img/img-Prices/secondimg.png";
				
				var myIndex = array.indexOf('Inside-fridge...');
				if (myIndex !== -1) {
				    array.splice(myIndex, 1);
				}
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				if(array.length === 0){
					document.getElementById('extras').innerHTML="";
				}
				
				console.log(array);
				updatetime();
				removecost();
			}
			
		}
		
		function chngimg3() {
			var image3 = document.getElementById('img3');
			
			if (image3.src.match("thirdimg.png")) {
				image3.src = "<%=request.getContextPath()%>/resources/img/img-BookNow/assets/4-green.png";
				document.getElementById('extras').innerHTML="<b>Extras</b>"
				
				array.push("Inside-oven...");
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				console.log(array);
				updatetime();
				addcost();
				
			} else {
				image3.src = "<%=request.getContextPath()%>/resources/img/img-Prices/thirdimg.png";

				var myIndex = array.indexOf('Inside-oven...');
				if (myIndex !== -1) {
				    array.splice(myIndex, 1);
				}
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				if(array.length === 0){
					document.getElementById('extras').innerHTML="";
				}
				
				console.log(array);
				updatetime();
				removecost();
			}
			
		}
		
		function chngimg4() {
			var image4 = document.getElementById('img4');
			
			if (image4.src.match("fourthimg.png")) {
				image4.src = "<%=request.getContextPath()%>/resources/img/img-BookNow/assets/2-green.png";
				document.getElementById('extras').innerHTML="<b>Extras</b>"
				
				array.push("Laundry-wash-dry...");
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				console.log(array);
				updatetime();
				addcost();
				
			} else {
				image4.src = "<%=request.getContextPath()%>/resources/img/img-Prices/fourthimg.png";
				
				var myIndex = array.indexOf('Laundry-wash-dry...');
				if (myIndex !== -1) {
				    array.splice(myIndex, 1);
				}
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				if(array.length === 0){
					document.getElementById('extras').innerHTML="";
				}
				
				console.log(array);
				updatetime();
				removecost();
			}
			
		}
		
		function chngimg5() {
			var image5 = document.getElementById('img5');
			
			if (image5.src.match("fifthimg.png")) {
				image5.src = "<%=request.getContextPath()%>/resources/img/img-BookNow/assets/1-green.png";
				document.getElementById('extras').innerHTML="<b>Extras</b>"
				
				array.push("Interior-windows...");
				var items=document.getElementById('extrahere');
				var html='';
				for(var i=0; i<array.length; i++) html += array[i];
				items.textContent=html;
				
				console.log(array);
				updatetime();
				addcost();
				
			} else {
				image5.src = "<%=request.getContextPath()%>/resources/img/img-Prices/fifthimg.png";

				var myIndex = array.indexOf('Interior-windows...');
				if (myIndex !== -1) {
					array.splice(myIndex, 1);
				}
				var items = document.getElementById('extrahere');
				var html = '';
				for (var i = 0; i < array.length; i++)
					html += array[i];
				items.textContent = html;

				if (array.length === 0) {
					document.getElementById('extras').innerHTML = "";
				}
				console.log(array);
				updatetime();
				removecost();
			}

		}
		

		function clicktime(){
			var time = parseFloat(document.getElementById('timeneeded').value);
			
			var image1 = document.getElementById('img1');
			var image2 = document.getElementById('img2');
			var image3 = document.getElementById('img3');
			var image4 = document.getElementById('img4');
			var image5 = document.getElementById('img5');
			
			image1.src = "<%=request.getContextPath()%>/resources/img/img-Prices/firstimg.png";
			image2.src = "<%=request.getContextPath()%>/resources/img/img-Prices/secondimg.png";
			image3.src = "<%=request.getContextPath()%>/resources/img/img-Prices/thirdimg.png";
			image4.src = "<%=request.getContextPath()%>/resources/img/img-Prices/fourthimg.png";
			image5.src = "<%=request.getContextPath()%>/resources/img/img-Prices/fifthimg.png";
			document.getElementById('totaltime').innerHTML = time + " Hrs";
			document.getElementById('basictime').innerHTML = time + " Hrs";
			array = [];
			document.getElementById('extrahere').innerText = "";
			document.getElementById('extras').innerHTML = "";

			if (time == 3) {
				document.getElementById('perclean').innerHTML = "54" + ",00";
				document.getElementById('totalpay').innerHTML = "54" + ",00";
			} else if (time == 4) {
				document.getElementById('perclean').innerHTML = "72" + ",00";
				document.getElementById('totalpay').innerHTML = "72" + ",00";
			} else if (time == 5) {
				document.getElementById('perclean').innerHTML = "90" + ",00";
				document.getElementById('totalpay').innerHTML = "90" + ",00";
			} else {
				document.getElementById('perclean').innerHTML = "108" + ",00";
				document.getElementById('totalpay').innerHTML = "108" + ",00";
			}
		}

		function updatetime() {
			var time = parseFloat(document.getElementById('timeneeded').value);
			var price = parseFloat(document.getElementById('perclean').innerText);

			if (array.length === 0) {
				document.getElementById('totaltime').innerHTML = time + " Hrs";
			} else if (array.length === 1) {
				document.getElementById('totaltime').innerHTML = time + 0.5
						+ " Hrs";
			} else if (array.length === 2) {
				document.getElementById('totaltime').innerHTML = time + 1
						+ " Hrs";
			} else if (array.length === 3) {
				document.getElementById('totaltime').innerHTML = time + 1.5
						+ " Hrs";
			} else if (array.length === 4) {
				document.getElementById('totaltime').innerHTML = time + 2
						+ " Hrs";
			} else {
				document.getElementById('totaltime').innerHTML = time + 2.5
						+ " Hrs";
			}
		}

		function addcost() {
			var price = parseFloat(document.getElementById('perclean').innerText);
			if (array.length === 0) {
				document.getElementById('perclean').innerHTML = price + ",00";
				document.getElementById('totalpay').innerHTML = price + ",00";
			} else if (array.length === 1) {
				document.getElementById('perclean').innerHTML = price + 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price + 9
						+ ",00";
			} else if (array.length === 2) {
				document.getElementById('perclean').innerHTML = price + 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price + 9
						+ ",00";
			} else if (array.length === 3) {
				document.getElementById('perclean').innerHTML = price + 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price + 9
						+ ",00";
			} else if (array.length === 4) {
				document.getElementById('perclean').innerHTML = price + 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price + 9
						+ ",00";
			} else {
				document.getElementById('perclean').innerHTML = price + 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price + 9
						+ ",00";
			}
		}

		function removecost() {
			var price = parseFloat(document.getElementById('perclean').innerText);
			if (array.length === 0) {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			} else if (array.length === 1) {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			} else if (array.length === 2) {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			} else if (array.length === 3) {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			} else if (array.length === 4) {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			} else {
				document.getElementById('perclean').innerHTML = price - 9
						+ ",00";
				document.getElementById('totalpay').innerHTML = price - 9
						+ ",00";
			}
		}
		
		console.log(array+"arrayyyyyyyyy");

		var extraitems=array.toString();
		
		$("#thirdcontinue").click(function(){
			console.log(extraitems + "eeeeeeeee");
		});
		
		jQuery(document).ready(function($) {
			$("#finaltab").submit(function(event) {
				event.preventDefault();
				servicerequestajax();
			});
		});
		function servicerequestajax() {
			
			var finalarray="";
			
			array.map(e => {
				finalarray += e+" ";
			});
			
			console.log(finalarray);
			$('#loading-image').show();
			$.ajax({
				
				type: "GET",
				url: "/Helperland-Tatvasoft/servicerequest/" + $('#pincode').val() + "," + $('#addressradio:checked').val() + "," + $('#totalpay').text().replace(",00", "")
					+ "," + $('#timeneeded').val() + "," + $('#tomorrowdate').val()
					+ "," + $('#totaltime').text().replace(" Hrs", "") + "," + $('#perclean').text().replace(",00", "") + "," + $('#secondcomments').val()
					+ "," + $('#starttime').val().replace(":", ".") + "," +  $('#petsathome').is(':checked') 
					+ "," + finalarray,
				success: function(data) {
					console.log("SUCCESS: ", data);
					$('#bookingid').html(" 27"+data);
					$('#successmodal').modal("show");
					
				},
				error: function(e) {
					console.log("ERROR: ", e);
					$('#loading-image').hide();
					$('#addressmodal').modal("show");
				},
				done: function(e) {
					console.log("DONE");
				},
				complete: function() {
					$('#loading-image').hide();
				}
			});
		}
		
		$('#successmodal').on('hidden.bs.modal', function () {
			document.getElementById("dash").click();
		});
		
		
	</script>
	
	

</body>

</html>