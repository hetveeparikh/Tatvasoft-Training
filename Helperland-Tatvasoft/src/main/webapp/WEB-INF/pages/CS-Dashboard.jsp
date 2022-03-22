<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="<%=request.getContextPath()%>/resources/css/Customer-Page.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/Customer-Page-responsive.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">
<title>Customer Page | Helperland</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">

</head>

<body>
	<header id="head">
		<nav class="navbar navbar-expand-lg navbar-inverse bg-dark csnav">
			<div class="container-fluid custom-toggler">
				<a class="navbar-brand" href="homepage"> <img
					src="<%=request.getContextPath()%>/resources/img/img-CS/logo-small.png"
					class="white_logo_transparent_background">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item linkbook">
							<div class="text-center">
								<a class="nav-link book1 align-items-center" href="BookNow">Book
									Now</a>
							</div>
						</li>
						<li class="nav-item"><a class="nav-link prices" href="prices">Prices & Services</a>
						</li>
						<li class="nav-item"><a class="nav-link warranty"
							href="warranty">Warranty</a></li>
						<li class="nav-item"><a class="nav-link blog">Blog</a></li>
						<li class="nav-item"><a class="nav-link contact"
							href="contact">Contact</a></li>
						<li class="nav-item">
							<div class="ver-line"></div>
						</li>
						<li class="nav-item">
							<div class="nav-btn">
								<a class="nav-link noti" href="#"><img
									src="<%=request.getContextPath()%>/resources/img/img-CS/icon-notification.png"></a>
							</div>
						</li>
						<li class="nav-item">
							<div class="ver-line"></div>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img
								src="<%=request.getContextPath()%>/resources/img/img-CS/me.png">
						</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#" onclick="clickcust(event, 'custdashboard')">Dashboard</a></li>
								<li><a class="dropdown-item" href="#"
									onclick="clickcust(event, 'custsettings')">Settings</a></li>
								<li><a class="dropdown-item" href="logout"
									onclick="logout()">Log out</a></li>
							</ul></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a class="active tablinks"
				onclick="clickcust(event, 'custdashboard')" id="dashnav">Dashboard</a> <a
				class="tablinks" onclick="clickcust(event, 'custrequests')" id="historynav">Service
				History</a> <a href="#">Service Schedule</a> <a href="#">Favourite
				Pros</a> <a href="#">Invoices</a> <a href="BookNow">Book Now</a> <a
				href="prices">Prices</a> <a href="warranty">Warranty</a> <a href="#">Blog</a>
			<a href="contact">Contact</a>
			<li class="dropdown"><a class="dropdown-toggle" href="#"
				id="navbarDropdown" role="button" data-bs-toggle="dropdown"
				aria-expanded="false"> <span>My Account</span>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item tablinks" href="#"
						onclick="clickcust(event, 'custdashboard')">Dashboard</a></li>
					<li><a class="dropdown-item tablinks" href="#"
						onclick="clickcust(event, 'custsettings')">Settings</a></li>
					<li><a class="dropdown-item" href="logout" onclick="logout()"> Log out</a></li>
				</ul></li>
		</div>

		<div onclick="openNav()" class="navham">&#9776;</div>

	</header>

	<section id="welcomecs">
		<span class="Welcome-Gaurang wc"> Welcome, <span class="Gaurang" id="bannername">${settingsfirstname }</span><strong>!</strong>
		</span>
		<div class="l1"></div>
	</section>

	<section id="maincs" class="row">

		<div class="sidebar col-lg-3 offset-lg-2 ">
			<a href="#" class="tablinks active" id="defaultOpen"
				onclick="clickcust(event, 'custdashboard')">Dashboard</a> 
			<a href="#" class="tablinks " id="historytab"
				onclick="clickcust(event, 'custrequests')">Service History</a> 
			<a href="#">Service Schedule</a> <a href="#">Favourite Pros</a> 
			<a href="#">Invoices</a> 
			<a href="#">Notifications</a>
		</div>

		<div id="custdashboard" class="tabcontent col-lg-7">
			<div class="d-flex flex-column justify-content-center datamain ">
				<div class="d-flex justify-content-between container">
					<p class="history">Current Service Requests</p>
					<a class="export text-decoration-none" href="BookNow">Add New
						Service Request</a>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div id="showrequests">
								<table class="table display nowrap" id="exampledash"
									colspacing="0" style="width: 100%;">
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
	
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- requestsssssssssssss -->


		<div class="tabcontent col-lg-7" id="custrequests">
			<div class="d-flex flex-column justify-content-center datamain ">
				<div class="d-flex justify-content-between container">
					<p class="history">Service History</p>
					<a class="exportt text-decoration-none">Export</a>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div id="showhistory">
								<table class="table display nowrap" id="example" colspacing="0"
									style="width: 100%;">
									<thead>
										<tr id="firstrow">
											<th>
												<div class="d-flex">
													<span class="heading">Service ID</span>
												</div>
											</th>
											<th>
												<div class="d-flex">
													<span class="heading">Service Details</span>
	
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
													<span class="heading">Report</span>
												</div>
											</th>
											<th>
												<div class="d-flex">
													<span class="heading">Status</span>
												</div>
											</th>
											<th>
												<div class="d-flex">
													<span class="heading">Rate SP</span>
												</div>
											</th>
										</tr>
									</thead>
	
									<tbody>
	
	
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- settingssssssssss -->

		<div id="custsettings" class="tabcontent col-lg-7">

			<div class="d-flex justify-content-center">
				<ul class="nav nav-pills tabs" role="tablist">
					<li class="nav-item"><a class="nav-link tablinks1 active1"
						data-bs-toggle="pill" href="#" id="defaultOpen1"
						onclick="clickSettings(event, 'SettingsDetails')"> My Details
					</a></li>
					<li class="nav-item"><a class="nav-link tablinks1"
						data-bs-toggle="pill" href="#" id="addresstab"
						onclick="clickSettings(event, 'SettingsAddress')"> My
							Addresses </a></li>
					<li class="nav-item"><a class="nav-link tablinks1"
						data-bs-toggle="pill" href="#"
						onclick="clickSettings(event, 'SettingsPassword')"> Change
							Password </a></li>
				</ul>
			</div>


			<div id="SettingsDetails" class="tabcontent1">
				<form class="detailsform row" id="addDetailsForm">
					<div class="col-sm-4">
						<label>First Name</label> <input type="text" class="setinput"
							id="detailsFirstname" required value=${settingsfirstname }>
					</div>
					<div class="col-sm-4">
						<label>Last Name</label> <input type="text" class="setinput"
							id="detailsLastname" required value=${settingslastname }>
					</div>
					<div class="col-sm-4">
						<label>Email Address</label> <input type="email" disabled
							class="setinput" id="detailsEmail" value=${settingsemail }>
					</div>
					<div class="col-sm-4">
						<label>Mobile Number</label>
						<div class="d-flex">
							<span class="d-flex align-items-center numset" disabled>+91</span> <input
								type="text" class="setinput" id="detailsMobile" name="Mobile" required
								value=${settingsmobile }>
						</div>
						<div class="text-center mb-2 mt-2" id="Mobiledivdetails"></div>
					</div>
					<div class="col-sm-8">
						<label>Date of birth</label>
						<div>
							<select class="bdayset" id="detailsBdate" required>
								<option value="">Day</option>
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
							</select> <select class="bdayset" id="detailsBMonth" required>
								<option value="">Month</option>
								<option value="January">January</option>
								<option value="February">February</option>
								<option value="March">March</option>
								<option value="April">April</option>
								<option value="May">May</option>
								<option value="June">June</option>
								<option value="July">July</option>
								<option value="August">August</option>
								<option value="September">September</option>
								<option value="October">October</option>
								<option value="November">November</option>
								<option value="December">December</option>
							</select> <select class="bdayset" id="detailsBYear" required>
								<option value="">Year</option>
								<option value="2022">2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
								<option value="1999">1999</option>
								<option value="1998">1998</option>
								<option value="1997">1997</option>
								<option value="1996">1996</option>
								<option value="1995">1995</option>
								<option value="1994">1994</option>
								<option value="1993">1993</option>
								<option value="1992">1992</option>
								<option value="1991">1991</option>
								<option value="1990">1990</option>
								<option value="1989">1989</option>
								<option value="1988">1988</option>
								<option value="1987">1987</option>
								<option value="1986">1986</option>
								<option value="1985">1985</option>
								<option value="1984">1984</option>
								<option value="1983">1983</option>
								<option value="1982">1982</option>
							</select>
						</div>
					</div>

					<div class="divider"></div>
					<div class="detailsform">
						<label>My Preferred Language</label> <select id="detailsLanguage"
							class="bdayset">
							<option value="English">English</option>
							<option value="Hindi">Hindi</option>
						</select>
					</div>
					<button type="submit" class="savedetails">Save</button>

				</form>
			</div>


			<div class="table-responsive  mt-2 mb-2 p-2 tabcontent1" id="SettingsAddress">
				<div class="" id="showaddress">
					<table class="table">
						<thead>
							<tr>
								<th>Addresses</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>

				<!-- Modalsssssss -->

				<div class="modal fade" id="editaddress" aria-hidden="true" aria-labelledby="log" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="addmodal">Edit address</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<form id="editAddressSettingsForm" method="post" name="editAddressSettingsForm">
								<div class="modal-body">

									<div>
										<input type="text" placeholder="Street Name" class="street" name="AddressLine1" id="addline1" required> <input type="text" placeholder="House Number" class="houseno" name="AddressLine2" id="addline2" required>
									</div>

									<div>
										<input type="text" placeholder="Postal Code" class="postal" name="PostalCode" id="addpostalcode" required> <select title="City" class="city" name="City" id="addcity" required>
											<option value="">Choose your city</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>

									<div>
										<input type="text" placeholder="Phone Number" class="number" name="Mobile" id="addmobile" required>
									</div>
									
									<div class="text-center mb-2 mt-2" id="Mobilediveditadd"></div>
								</div>
								<div class="text-center">
									<button type="submit" class="saveadd">Save</button>
									<input type="button" class="canceladd" value="Close" data-bs-dismiss="modal">
								</div>

							</form>
						</div>
					</div>
				</div>

				<div class="modal fade" id="deleteaddress">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Confirm Delete Address</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<form id="deleteAddressSettingsForm" method="post"
								name="deleteAddressSettingsForm">
								<div class="modal-body">
									<span class="newdate">Are you sure you want to delete
										this address?</span>
	
								</div>
								<div class="d-flex justify-content-center">
									<button type="submit" class="csupdate" data-bs-dismiss="modal">Delete Address</button>
								</div>
							</form>

						</div>
					</div>
				</div>
				
				

				<!--Add address-->

				<div>
					<input type="button" value="+ Add new Address" class="addbtn" data-bs-toggle="modal" href="#address">
				</div>

				<div class="modal fade" id="address" aria-hidden="true"
					aria-labelledby="log" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="addmodal">Add new address</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<form id="addAddressSettingsForm" name="addAddressSettingsForm">
								<div class="modal-body">

									<div>
										<input type="text" placeholder="Street Name" class="street"
											name="AddressLine1" id="addlinee1" required/> <input type="text"
											placeholder="House Number" class="houseno"
											name="AddressLine2" id="addlinee2" required />
									</div>

									<div>
										<input type="text" placeholder="Postal Code" class="postal"
											name="PostalCode" id="addpostalcodee"  required/> <select
											title="City" class="city" name="City" id="addcityy"  required>
											<option value="">Choose your city</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>

									<div>
										<input type="text" placeholder="Phone Number" class="number"
											name="Mobile" id="addmobilee"  required/>

									</div>
									
									<div class="text-center mb-2 mt-2" id="Mobiledivnewadd"></div>
								</div>
								<div class="text-center">
									<button type="submit" class="saveadd">Save</button>
									<input type="button" class="canceladd" value="Close"
										data-bs-dismiss="modal" />
								</div>
								
								

							</form>
						</div>
					</div>
				</div>
			</div>

			<div id="SettingsPassword" class="tabcontent1">
				<form id="passwordform"
					oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'>
					<label class="setpass">Old Password</label> <br> 
					<input type="password" placeholder="Current Password" class="passbox"
						id="settingsoldpassword" required> <br> 
					<label class="setpass">New Password</label> <br> 
					<input type="password" placeholder="Password" class="passbox"
						id="settingsnewpassword" name="password" required> <br>
					<div class="mb-2 mt-2 w-25" id="Passwordspdetailsdiv"></div>
					<label class="setpass">Confirm Password</label> <br> 
					<input type="password" placeholder="Confirm Password" class="passbox"
						id="settingsconfirmpassword" name="confirmpassword" required><br>
					<button type="submit" class="savedetails">Save</button>
				</form>
			</div>

		</div>
		
		<!-- reschedule modal -->
		
		<div class="modal fade" id="reschedulemodal">
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
						<span class="newdate">&nbsp;&nbsp;Select new date and time</span>
						<div class="d-flex">
							<form id="rescheduleform" name="rescheduleform">
								<div class="d-flex">
									<div class="d-flex">
										<input type="date" id="tomorrowdate" name="TomorrowDate" >
									</div>
									<div>
										<select title="Time" class="timerect" id="updatedtime">
											<option disabled>Time</option>
											<option value="8:00" selected>8:00</option>
											<option value="8:30">8:30</option>
											<option value="9:00">9:00</option>
											<option value="9:30">9:30</option>
										</select>
										
									</div>
								</div>
								<div>
									<button type="submit" class="saveadd"> Reschedule</button>
									<input type="button" class="canceladd" value="Close"
										data-bs-dismiss="modal" />
								</div>
							</form>
						</div>
					</div>
					

				</div>
			</div>
		</div>
		
		<!-- Cancel Modal -->
		
		<div class="modal fade" id="cancelmodal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Cancel Service Request</h4>
						<button type="button" class="btn-close"
							data-bs-dismiss="modal"></button>
					</div>
					
					<form id="cancelform">
						<!-- Modal body -->
						<div class="modal-body">
							<span class="newdate">Are you sure you want to
								cancel this service request?</span>
	
						</div>
						<div class="d-flex justify-content-center">
							<button type="submit" class="csupdate" data-bs-dismiss="modal" >Cancel
								Request</button>
						</div>
					</form>

				</div>
			</div>
		</div>
		
		<!-- Details Modal -->

		<div class="modal fade" id="DetailsModal">
			<div class="modal-dialog  modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><strong>Service Details</strong></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
	
						<h3></h3>
						<p><strong>Duration: </strong><span id="detailsduration"></span> </p>
						<hr>
						<p><strong>Service Id: </strong>27<span id="detailsid"></span>  </p>
						<p><strong>Extras: </strong><span id="detailsextras"></span>  </p>
						<p><strong>Net Amount: </strong><span id="detailsamount"></span>  </p>
						<hr>
						<p><strong>Service Address: </strong><span id="detailsaddress"></span>  </p>
						<p><strong>Billing Address: </strong><span> Same as Service Address</span> </p>
						<p><strong>Phone: </strong> <span id="detailsphone"></span> </p>
						<p><strong>Email: </strong> <span id="detailsemail"></span> </p>
						<hr>
						<span><strong>Comments </strong> <br></span><span id="detailscomments"></span><br>
						<div class="detailsdiv"><span id="detailspets"></span> </div>
					</div>
	
				</div>
			</div>
		</div>
		
		<!-- Rating Modal -->
		
		<div class="modal fade" id="ratingmodal">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <div class="modal-header">
	                	 <h4>Rate your Service Provider</h4>
	                    <!-- <div class="d-flex">
	                        <img src="avatar-hat.png">
	                        <div>
	                            <h5 class="modal-title" id="ratingspname"></h5>
	                            <div id="rating-form" id="ratingsp"></div>
	                        </div>
	                    </div> -->
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body" >
	                    
	                    <form id="ratingform">
		                    <div>
		                        <h5 class="d-flex align-items-center">On time arrival</h5>
		                        <div id="rating-form3">
		                            <span class="rating-star3">
		                                <input type="radio" name="rating3" value="5"><span class="star"></span>
		    
		                                <input type="radio" name="rating3" value="4"><span class="star"></span>
		    
		                                <input type="radio" name="rating3" value="3"><span class="star"></span>
		    
		                                <input type="radio" name="rating3" value="2"><span class="star"></span>
		    
		                                <input type="radio" name="rating3" value="1"><span class="star"></span>
		                            </span>
		                        </div>
		                    </div>
		                    <br>
		                    <div>
		                        <h5 class="d-flex align-items-center">Friendly</h5>
		                        <div id="rating-form1">
		                            <span class="rating-star1">
		                                <input type="radio" name="rating1" value="5"><span class="star"></span>
		    
		                                <input type="radio" name="rating1" value="4"><span class="star"></span>
		    
		                                <input type="radio" name="rating1" value="3"><span class="star"></span>
		    
		                                <input type="radio" name="rating1" value="2"><span class="star"></span>
		    
		                                <input type="radio" name="rating1" value="1"><span class="star"></span>
		                            </span>
		                        </div>
		                    </div>
		                    <br>
		                    <div>
		                        <h5 class="d-flex align-items-center">Quality Of Service</h5>
		                        <div id="rating-form2">
		                            <span class="rating-star2">
		                                <input type="radio" name="rating2" value="5"><span class="star"></span>
		    
		                                <input type="radio" name="rating2" value="4"><span class="star"></span>
		    
		                                <input type="radio" name="rating2" value="3"><span class="star"></span>
		    
		                                <input type="radio" name="rating2" value="2"><span class="star"></span>
		    
		                                <input type="radio" name="rating2" value="1"><span class="star"></span>
		                            </span>
		                        </div>
		                    </div>
		                    <br>
		                    <h5>Feedback on service provider</h5>
		                    <textarea rows="2" style="width: 100%;" id="ratingcomments"></textarea>
		                    
		                    <button type="submit" class="saveadd" data-bs-dismiss="modal"> Submit</button>
							<input type="button" class="canceladd" value="Close" data-bs-dismiss="modal" />
		            	</form>
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
						src="<%=request.getContextPath()%>/resources/img/img-CS/white-logo-transparent-background-copy-4.png"
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
						src="<%=request.getContextPath()%>/resources/img/img-CS/facebook.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-CS/facebook@2x.png 2x,<%=request.getContextPath()%>/resources/img/img-CS/facebook@3x.png 3x"
						class="facebook" /></a> <a
						href="https://www.instagram.com/helperlandde/" target="_blank"
						class="text-decoration-none"><img
						src="<%=request.getContextPath()%>/resources/img/img-CS/instagram.png"
						srcset="<%=request.getContextPath()%>/resources/img/img-CS/instagram@2x.png 2x, <%=request.getContextPath()%>/resources/img/img-CS/instagram@3x.png 3x"
						class="instagram" /></a>
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

	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<!-- <script type="text/javascript" charset="utf8"
		src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
		
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/CS-Dashboard.js"></script>
	

	<script>
	
	function dashdt(){
		$(document).ready(function() {
			$('#exampledash').DataTable({
				"dom": '<"top">rt<"bottom"lip><"clear">', responsive: true, "aaSorting": [],
				columnDefs: [{
					orderable: false,
					targets: 4
				}]
			});
		});
	}
	
	function historydt(){
		$(document).ready(function() {
			$('#historytable').DataTable({
				"dom": '<"top">rt<"bottom"lip><"clear">', responsive: true, "aaSorting": [],
				columnDefs: [{
					orderable: false,
					targets: 4
				}]
			});
		});
	}
	
	/*Settings Add Address*/
 
	jQuery(document).ready(function($) {
		$("#addAddressSettingsForm").submit(function(event) {
			event.preventDefault();
			addAddressSettings();
		});
	});
	function addAddressSettings() {

		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/addAddressSettings/" + $("#addlinee1").val() + "," + $("#addlinee2").val() + "," + $("#addpostalcodee").val() + "," + $("#addcityy").val() + "," + $("#addmobilee").val(),
			success: function(data) {
				console.log("SUCCESS: Address added", data);
				document.getElementById("addresstab").click();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
	
	/* Show Address */

	$(document).on('click','#addresstab',function(){
		console.log("hii");
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/readaddresssettings/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = "<table class='table' border='1'><thead><tr><th>Address</th><th>Actions</th></tr></thead>"
				result += "<tbody>";
				$.each(response, function(k, v) {
					result += "<tr>";
					result += "<td class='address'>";
					result += '<div class="row"><span><strong>Address:  </strong>' + v.addressLine1 + ', ' + v.addressLine2 + '</span> <span><strong>Phone number:  </strong>' + v.mobile + '</span></div>';
					result += "</td>";
					result += "<td class='actions'>";
					result += '<a data-bs-toggle="modal" href="#editaddress" class="text-decoration-none" onclick="editfun('+ v.addressId +')">';
					result += "<img class='actionimg mt-2' src='<%=request.getContextPath()%>/resources/img/img-CS/edit.png'>";
					result += "</a>";
					result += '<a data-bs-toggle="modal" href="#deleteaddress" class="text-decoration-none" onclick="deletefun('+ v.addressId +')">';
					result += '<img class="actionimg mt-2" src="<%=request.getContextPath()%>/resources/img/img-CS/delete.png">';
					result += "</a>";
					result += "</td>";
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#showaddress").html(result);
				
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}	
		});
		
	});
	
	
	/* Edit Address */
	
	function editfun(v){
		jQuery(document).ready(function($) {
			$("#editAddressSettingsForm").submit(function(event) {
				event.preventDefault();
				editAddressSettings(v);
				console.log(v);
			});
		});
	}
	function editAddressSettings(v) {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/editAddressSettings/" + $("#addline1").val() + "," + $("#addline2").val() + "," + $("#addpostalcode").val() + "," + $("#addcity").val() + "," + $("#addmobile").val() + "," + v,
			success: function(data) {
				console.log("SUCCESS: Address updated", data);
				document.getElementById("addresstab").click();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
	/* Delete Address */
	
	function deletefun(v){
		jQuery(document).ready(function($) {
			$("#deleteAddressSettingsForm").submit(function(event) {
				event.preventDefault();
				deleteAddressSettings(v);
				console.log(v);
			});
		});
	}
	function deleteAddressSettings(v) {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/deleteAddressSettings/"  + v,
			success: function(data) {
				console.log("SUCCESS: Address deleted", data);
				document.getElementById("addresstab").click();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	

	/* Show Requests */

	function custdashboard(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/custDashboard/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="exampledash" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Date</span></div></th><th><div class="d-flex"><span class="heading">Service Provider</span></div></th><th><div class="d-flex"><span class="heading">Payment</span></div></th><th><div class="d-flex"><span class="heading">Actions</span></div></th></tr></thead>';
				result += "<tbody>";
				$.each(response, function(k, v) {
					
					var fname="";
					var lname="";
					var profile="";
					
					if(v.serviceProviderId==0){
						fname="";
						lname="";
						profile="";
					}
					else{
						fname=v.customer.firstName;
						lname=v.customer.lastName;
						profile='<img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-'+v.customer.userProfilePicture+'.png" class="topi">';
					}
					
					var rate="";
					if(v.serviceProviderId!=0){
						avgrate = Math.round((v.rating.avgrating) * 100) / 100;
						rate = "Ratings: "+ avgrate +"/5";
					}
					else{
						rate = "";
					}
					
					//var ratingavg = Math.round(rate);
					
					result += "<tr>";
					result += '<td class="align-middle"><span class="csid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi">';
					result += '<div class="d-flex modalcursor"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += '<td class="align-middle">';
					result += '<div class="d-flex topidiv">';
					result += '<div class="topicircle text-center">';
					result += profile;
					result += '</div>';
					result += '<div class="d-flex flex-column">';
					result += '<span class="csname">'+fname+' '+lname+'</span>';
					result += '<div class="d-flex">';
					result += '<span class="csname">'+rate+'</span>';
					result += '</div>';
					result += '</div>';
					result += '</div>';
					result += '</td>';
					result += '<td class="align-middle"><span class="cs-price ">';
					result += '<img src="<%=request.getContextPath()%>/resources/img/img-BookNow/blue-euro.png" class="totaleuro">';
					result += '<span>'+v.subTotal+'</span>';
					result += '</span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex schecancel">';
					result += '<button class="csreschedule" data-bs-toggle="modal" data-bs-target="#reschedulemodal" onclick="reschedule('+ v.serviceId +')">Reschedule</button>';
					result += '<button class="cscancel" data-bs-toggle="modal"	data-bs-target="#cancelmodal" onclick="cancelreq('+ v.serviceId +')">Cancel</button>';
					result += '</div>';
					result += '</td>';
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#showrequests").html(result);
				dashdt();

			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
	window.onload = custdashboard();
	
	$(document).on('click','#defaultOpen', function(){
		custdashboard();
	});
	
	/* Reschedule Request */
		
		function reschedule(v){
			
			jQuery(document).ready(function($) {
				$("#rescheduleform").submit(function(event) {
					var x = document.forms["rescheduleform"]["TomorrowDate"].value;
					if (x == "" || x == null) {
						alert("Please select date!");
						return false;
					}
					event.preventDefault();
					reschedulerequest(v);
					console.log(v);
				});
			});
		}
		function reschedulerequest(v) {
			console.log(document.getElementById("updatedtime").value);
			$.ajax({
				type: "GET",
				url: "/Helperland-Tatvasoft/rescheduleRequests/" +$("#tomorrowdate").val() + "," + $("#updatedtime").val() + "," + v,
				success: function(data) {
					console.log("SUCCESS: resch", data);
					custdashboard();
					/* if(data==0){
						alert("Not rescheduled!");
					}
					else{
						
						alert("Rescheduled successfully! \n\nServiceId : 27" + v);
					} */
				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
		}
		

		/* Cancel request */
		
		function cancelreq(v){
			jQuery(document).ready(function($) {
				$("#cancelform").submit(function(event) {
					event.preventDefault();
					cancelrequest(v);
					console.log(v);
				});
			});
		}
		function cancelrequest(v) {
			$.ajax({
				type: "GET",
				url: "/Helperland-Tatvasoft/cancelrequest/"  + v,
				success: function(data) {
					console.log("SUCCESS: request cancelled", data);

					if(data==0){
						alert("Not cancelled!");
					}
					else{
						custdashboard();
						alert("Cancelled successfully! \n\nServiceId : 27" + v);
					}
				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
		}
		
		/* Details Modal */
		
		function detailsmodal(v) {
			$.ajax({
				type: "GET",
				contentType: "application/json",
				url: "/Helperland-Tatvasoft/detailsmodal/"  + v,
				success: function(data) {
					var petsbool="";
					if(data.servicerequest.hasPets=="true"){
						petsbool='<img src="<%=request.getContextPath()%>/resources/img/img-CS/haspets.png">  I have pets at home';
					}
					else{
						petsbool=`<img src="<%=request.getContextPath()%>/resources/img/img-CS/notpets.png">  I don't have pets at home`;
					}
					
					console.log("SUCCESS: modal", data);
					
					$("#detailsduration").html(data.servicerequest.serviceStartTime);
					$("#detailsextras").html(data.servicerequestextra);
					$("#detailsid").html(data.servicerequest.serviceId);
					$("#detailsamount").html(data.servicerequest.subTotal + " &euro;");
					$("#detailsaddress").html(data.servicerequestaddress.addressLine1 + ", " + data.servicerequestaddress.addressLine2);
					$("#detailsphone").html(data.servicerequestaddress.mobile);
					$("#detailsemail").html(data.servicerequestaddress.email);
					$("#detailscomments").html(data.servicerequest.comments);
					$("#detailspets").html(petsbool);
				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
		}
		
		/* Service History */
		
		function custhistory(){
			$.ajax({
				type: "GET",
				contentType: "application/json",
				url: "/Helperland-Tatvasoft/customerServiceHistory/",
				success: function(response) {
					console.log("SUCCESS: ", response);
	
					var result = '<table class="table display nowrap" id="historytable" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Details</span></div></th><th><div class="d-flex"><span class="heading">Service Provider</span></div></th><th><div class="d-flex"><span class="heading">Payment</span></div></th><th><div class="d-flex"><span class="heading">Report</span></div></th><th><div class="d-flex"><span class="heading">Status</span></div></th><th><div class="d-flex"><span class="heading">Rate SP</span></div></th></tr></thead>'
					result += "<tbody>";
					$.each(response, function(k, v) {
						
						var status="";
						var disabledRate="";
						if(v.status=="Completed"){
							status='<button class="greenbtn">Completed</button>';
							disabledRate="";
						}
						else{
							status='<button class="pinkbtn">Cancelled</button>';
							disabledRate="disabled";
						}
						
						
						var fname="";
						var lname="";
						var profile="";
						
						if(v.serviceProviderId==0){
							fname="";
							lname="";
							profile="";
						}
						else{
							fname=v.customer.firstName;
							lname=v.customer.lastName;
							profile='<img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-'+v.customer.userProfilePicture+'.png" class="topi">';
						}
						
						var rate="";
						if(v.serviceProviderId!=0){
							avgrate = Math.round((v.rating.avgrating) * 100) / 100;
							rate = "Ratings: "+ avgrate +"/5";
						}
						else{
							rate = "";
						}
						
						result += "<tr>";
						result += '<td class="align-middle"><span class="csid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
						result += '<td class="align-middle">';
						result += '<div class="d-flex flex-column justify-content-center calghadi">';
						result += '<div class="d-flex modalcursor"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
						result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
						result += '</div>';
						result += '<div class="d-flex ">';
						result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
						result += '</div>';
						result += '</div>';
						result += "</td>";
						result += '<td class="align-middle">';
						result += '<div class="d-flex ">';
						result += '<div class="topicircle text-center">';
						result += profile;
						result += '</div>';
						result += '<div class="d-flex flex-column">';
						result += '<span class="csname">'+fname+' '+lname+'</span>';
						result += '<div class="d-flex">';
						result += '<span class="csname">'+rate+'</span>';
						result += '</div>';
						result += '</div>';
						result += '</div>';
						result += '</td>';
						result += '<td class="align-middle"><span class="cs-price ">';
						result += '<img src="<%=request.getContextPath()%>/resources/img/img-BookNow/blue-euro.png" class="totaleuro">';
						result += '<span>'+v.subTotal+'</span>';
						result += '</span></td>';
						result += '<td class="align-middle">';
						result += '<div class="reportimg"><a href="contact"><img src="<%=request.getContextPath()%>/resources/img/img-CS/inquiry.png"></a></div>';
						result += '</td>';
						result += '<td class="align-middle">';
						result += '<div class="statusdiv">'+status+'</div>';
						result += '</td>';
						result += '<td class="align-middle">';
						result += '<button class="rate" '+ disabledRate +' data-bs-toggle="modal" data-bs-target="#ratingmodal" onclick="ratingsmodal('+ v.serviceId +','+ v.serviceProviderId +')">Rate SP</button>';
						result += '</td>';
						result += "</tr>";
					});
					result += "</tbody>";
					result += "</table>";
					$("#showhistory").html(result);
					historydt();

				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
		}
		
		$(document).on('click','#historytab', function(){
			custhistory();
		});
		
		$(document).on('click','#historynav', function(){
			custhistory();
		});
		
		/* Ratingsss */
		
		var r1="";
        $('#rating-form1').on('change', '[name="rating1"]', function () {
            r1 = $('[name="rating1"]:checked').val();
        });

        var r2="";
        $('#rating-form2').on('change', '[name="rating2"]', function () {
            r2 = $('[name="rating2"]:checked').val();
        });

        var r3="";
        $('#rating-form3').on('change', '[name="rating3"]', function () {
            r3 = $('[name="rating3"]:checked').val();
        });
		
		function ratingsmodal(v,k){
			jQuery(document).ready(function($) {
				$("#ratingform").submit(function(event) {
					event.preventDefault();
					ratings(v,k);
					console.log(v + k);
				});
			});
		}
		function ratings(v,k) {
			$.ajax({
				type: "GET",
				url: "/Helperland-Tatvasoft/ratingsp/"  + r2 + "," + r3 + "," + r1 + "," + v + "," + k +"," + $('#ratingcomments').val() ,
				success: function(data) {
					console.log("SUCCESS: ratings given", data);
					$('#rating-form1').prop('checked', false);
				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
		}
		
		
		
		
	</script>


</body>

</html>