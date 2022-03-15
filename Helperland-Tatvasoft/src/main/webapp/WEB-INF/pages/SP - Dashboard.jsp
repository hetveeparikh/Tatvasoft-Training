<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/ServiceProviderPage.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/ServiceProviderPage-responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">
    <title>Service Provider Page | Helperland</title>
    <link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">

</head>

<body>

    <header id="head">
        <nav class="navbar navbar-expand-lg navbar-inverse bg-dark csnav">
            <div class="container-fluid custom-toggler">
                <a class="navbar-brand" href="homepage">
                    <img src="<%= request.getContextPath() %>/resources/img/img-US/logo-small.png" class="white_logo_transparent_background">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link prices" href="prices">Prices & Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link warranty" href="warranty">Warranty</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blog">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link contact" href="contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <div class="ver-line">
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link noti" href="#"><img src="<%= request.getContextPath() %>/resources/img/img-US/icon-notification.png"></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="ver-line">
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<%= request.getContextPath() %>/resources/img/img-US/me.png">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#" onclick="clicksp(event, 'spdashboard')">Dashboard</a></li>
                                <li><a class="dropdown-item" href="#" onclick="clicksp(event, 'spsettings')">Settings</a></li>
                                <li><a class="dropdown-item" href="logout" onclick="logout()">Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#" class="active tablinks" onclick="clicksp(event, 'spdashboard')" id="dashnav">Dashboard</a>
            <a href="#" class="tablinks" onclick="clicksp(event, 'spupcoming')" id="upcomingnav">Upcoming Services</a>
            <a href="#">Service Schedule</a>
            <a href="#" class="tablinks" onclick="clicksp(event, 'sphistory')" id="historynav">Service History</a>
            <a href="#" class="tablinks" onclick="clicksp(event, 'sprating')" id="ratingnav">My Ratings </a>
            <a href="#" class="tablinks">Block Customer</a>
            <a href="BookNow">Book Now</a>
            <a href="prices">Prices</a>
            <a href="warranty">Warranty</a>
            <a href="#">Blog</a>
            <a href="contact">Contact</a>
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <span>Settings</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#" onclick="clicksp(event, 'spdashboard')">Dashboard</a></li>
                    <li><a class="dropdown-item" href="#" onclick="clicksp(event, 'spsettings')">Settings</a></li>
                    <li><a class="dropdown-item" href="logout" onclick="logout()">Log out</a></li>
                </ul>
            </li>
        </div>

        <div onclick="openNav()" class="navham">&#9776; </div>

    </header>

    <section id="welcome">
        <span class="Welcome-Sandip wc">
            Welcome,
            <span class="Sandip" id="bannername">${settingsfirstname }</span>!
        </span>
        <div class="l1"></div>
    </section>

    <section id="maincs" class="row">
        <div class="sidebar col-lg-3 offset-lg-2 ">
            <a href="#" class="tablinks active" onclick="clicksp(event, 'spdashboard')" id="defaultOpen">Dashboard</a>
            <a href="#" onclick="clicksp(event, 'spupcoming')" class="tablinks " id="upcomingtab">Upcoming Services</a>
            <a href="#">Service Schedule</a>
            <a href="#" onclick="clicksp(event, 'sphistory')" class="tablinks " id="historytab" >Service History</a>
            <a href="#"  class="tablinks " onclick="clicksp(event, 'sprating')" id="ratingtab">My Ratings </a>
            <a href="#" class="tablinks ">Block Customer</a>
        </div>

        <div class="col-lg-7 tabcontent" id="spdashboard">
            <div class="row">
                <div class="col-lg-12" id="dashboardtable">
                    <table class="table display nowrap" id="dashboard" colspacing="0" style="width: 100%;">
                        <thead>
                            <tr id="firstrow">
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service ID</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service date</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Customer details</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Payment</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Time conflict</span>
                                    </div>
                                </th>
                                <th>
                                    <span class="heading">&nbsp;Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
							
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- Upcominggg -->
        
         <div class="col-lg-7 tabcontent" id="spupcoming">
            <div class="row">
                <div class="col-lg-12" id="upcomingtable">
                    <table class="table display nowrap" id="upcoming" colspacing="0" style="width: 100%;">
                        <thead>
                            <tr id="firstrow">
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service ID</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service date</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Customer details</span>
                                    </div>
                                </th>
                                <th>
                                    <span class="heading">&nbsp;Payment</span>
                                </th>
                                <th>
                                    <span class="heading">&nbsp;Cancel?</span>
                                </th>
                                <th>
                                    <span class="heading">&nbsp;Completed?</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- historyy -->
        
		
        <div class="col-lg-7 tabcontent" id="sphistory">
            <div class="row">
                <div class="col-lg-12" id="historytable">
                    <table class="table display nowrap" id="history" colspacing="0" style="width: 100%;">
                        <thead>
                            <tr id="firstrow">
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service ID</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Service date</span>
                                    </div>
                                </th>
                                <th>
                                    <div class="d-flex">
                                        <span class="heading">Customer details</span>
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
                                        <span class="heading">Payment Status</span>
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
        
        
        <!-- Ratingss -->
        
		
        <div class="col-lg-7 tabcontent" id="sprating">
            <div class="row">
                <div class="col-lg-12" id="ratingtable">
                    <table class="table display nowrap" id="rating" colspacing="0" style="width: 100%;">
                        <thead>
                            
                        </thead>
                        <tbody>
                            
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        
        
        
        <!-- settings -->
        
        <div class="col-lg-7 tabcontent" id="spsettings">

            <div class="d-flex justify-content-center">
				<ul class="nav nav-pills tabs" role="tablist">
					<li class="nav-item"><a class="nav-link tablinks1 active1"
						data-bs-toggle="pill" href="#" id="defaultOpen1"
						onclick="clickSettings(event, 'SettingsDetails')"> My Details
					</a></li>
					<li class="nav-item"><a class="nav-link tablinks1"
						data-bs-toggle="pill" href="#"
						onclick="clickSettings(event, 'SettingsPassword')"> Change
							Password </a></li>
				</ul>
			</div>

            <div class="settingshere d-flex flex-column">
				<div  class="tabcontent1" id="SettingsDetails">
					<form id="addDetailsForm">
						<p class="status">Account Status:<span class="activestatus">Active</span></p>
						
						<div class="d-flex justify-content-between">
						    <div class="detailsdivider">
						        <p class="basicdetails">Basic Details</p>
						        <div class="divider2"></div>
						    </div>
							<div id="change">
								<img
									src="<%= request.getContextPath() %>/resources/img/img-Settings/avatar-${settingsavatar }.png">
							</div>
						</div>
						
						<div class="detailsform row">
					
						    <div class="col-lg-4">
						        <label>First Name</label>
						        <input type="text" placeholder="First Name" class="setinput" name="FirstName" id="detailsFirstname" required value=${settingsfirstname } >
						    </div>
						    <div class="col-lg-4">
						        <label>Last Name</label>
						        <input type="text" placeholder="Last Name" class="setinput"  name="LastName" id="detailsLastname"  required value=${settingslastname }>
						    </div>
						    <div class="col-lg-4">
						        <label>Email Address</label>
						        <input type="email" placeholder="Email Address" disabled class="setinput" name="Email" id="detailsEmail" value=${settingsemail }>
						    </div>
						    <div class="col-lg-4">
						        <label>Mobile Number</label>
						        <div class="d-flex">
						            <span class="d-flex align-items-center numset" disabled>+91</span>
						            <input type="text" placeholder="Mobile number" class="setinput" name="Mobile" id="detailsMobile" required value=${settingsmobile }>
						        </div>
						    </div>
						    <div class="col-lg-4">
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
						            </select>
						            <select class="bdayset"  id="detailsBMonth" required>
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
						            </select>
						            <select class="bdayset" id="detailsBYear" required>
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
						    <div class="col-lg-4">
						        <label>Nationality</label>
						        <select class="nationality" id="detailsNationality">
						            <option>Indian</option>
						            <option>German</option>
						        </select>
						    </div>
						
						    <div class="col-sm-12">
						        <label>Gender</label>
						        <div class="d-flex">
						            <label class="gender"><input type="radio" name="gender" value="Male" checked="checked">Male</label>
						            <label class="gender"><input type="radio" name="gender" value="Female">Female</label>
						            <label class="gender"><input type="radio" name="gender" value="Not to say">Rather not to say</label>
						        </div>
						    </div>
						
						    <div class="col-sm-12">
						        <label>Select avatar</label>
						        <div class="row container">
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="car" class="input-hidden" value="car"/>
						                <label for="car">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-car.png" alt="Car" class="avatarimg" />
						                </label>
						            </div>
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="female" class="input-hidden" value="female" />
						                <label for="female">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-female.png" alt="female" class="avatarimg" />
						                </label>
						            </div>
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="hat" class="input-hidden" value="hat"/>
						                <label for="hat">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-hat.png" alt="hat" class="avatarimg" />
						                </label>
						            </div>
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="iron" class="input-hidden" value="iron"/>
						                <label for="iron">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-iron.png" alt="iron" class="avatarimg" />
						                </label>
						            </div>
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="male" class="input-hidden" value="male"/>
						                <label for="male">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-male.png" alt="male" class="avatarimg" />
						                </label>
						            </div>
						            <div class="col-lg-2 col-md-4 d-flex justify-content-center ava">
						                <input type="radio" name="avatar" id="ship" class="input-hidden" value="ship"/>
						                <label for="ship">
						                    <img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-ship.png" alt="ship" class="avatarimg" />
						                </label>
						            </div>
						        </div>
						    </div>
						
						    <label class="basicdetails">My address</label>
						    <div class="divider1"></div>
						
						    <div class="col-lg-4">
						        <label>Street Name</label>
						        <input type="text" placeholder="Street Name" class="setinput" id="addline1" name="AddressLine1" required value=${settingsaddline1 }>
						    </div>
						    <div class="col-lg-4">
						        <label>House Number</label>
						        <input type="text" placeholder="House Number" class="setinput"  id="addline2" name="AddressLine2" required value=${settingsaddline2 }>
						    </div>
						    <div class="col-lg-4">
						        <label>Postal Code</label>
						        <input type="text" placeholder="Postal Code" class="setinput" id="addpostalcode" name="PostalCode" required value=${settingspostalcode }>
						    </div>
						    <div class="col-lg-4">
						        <label>City</label>
						        <input type="text" placeholder="City" class="setinput" id="addcity" name="City" required value=${settingscity }>
						    </div>
						</div>
					
						<button class="savedetails">Save</button>
					
					</form>
				</div>
				
				<div id="SettingsPassword" class="tabcontent1">
					<form id="passwordform"
						oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'>
						<label class="setpass">Old Password</label> <br> <input
							type="password" placeholder="Current Password" class="passbox"
							id="settingsoldpassword" required> <br> <label
							class="setpass">New Password</label> <br> <input
							type="password" placeholder="Password" class="passbox"
							id="settingsnewpassword" name="password" required> <br>
						<label class="setpass">Confirm Password</label> <br> <input
							type="password" placeholder="Confirm Password" class="passbox"
							id="settingsconfirmpassword" name="confirmpassword" required><br>
						<button type="submit" class="savedetails">Save</button>
					</form>
				</div>
			</div>

   		</div>
   
    </section>
    
    <!-- Modalssssss -->
    
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
						<p><strong>Service Id: </strong><span id="detailsid"></span>  </p>
						<p><strong>Extras: </strong><span id="detailsextras"></span>  </p>
						<p><strong>Net Amount: </strong><span id="detailsamount"></span>  </p>
						<hr>
						<p><strong>Service Address: </strong><span id="detailsaddress"></span>  </p>
						<p><strong>Phone: </strong> <span id="detailsphone"></span> </p>
						<p><strong>Email: </strong> <span id="detailsemail"></span> </p>
						<hr>
						<span><strong>Comments </strong> <br></span><span id="detailscomments"></span><br>
						<div class="detailsdiv"><span id="detailspets"></span> </div>
					</div>
	
				</div>
			</div>
		</div>
		
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
							<button class="csupdate" data-bs-dismiss="modal" >Cancel
								Request</button>
						</div>
					</form>

				</div>
			</div>
		</div>

	<div class="modal fade" id="acceptmodal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Accept Service Request</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<!-- Modal body -->

					<span class="newdate">Are you sure you want to accept this
						service request?</span>
					<br><br>

					<div class="d-flex justify-content-center">
						<button type="button" class="csupdate" data-bs-dismiss="modal"
							id="acceptbtn">Accept Request</button>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>

	<div class="modal fade" id="completedmodal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Completed Service Request</h4>
						<button type="button" class="btn-close"
							data-bs-dismiss="modal"></button>
					</div>
					
					<form id="completedform">
						<!-- Modal body -->
						<div class="modal-body">
							<span class="newdate">Have you completed this service request?</span>
	
						</div>
						<div class="d-flex justify-content-center">
							<button class="csupdate" data-bs-dismiss="modal" >Completed
								Request</button>
						</div>
					</form>

				</div>
			</div>
		</div>

    <footer>
        <div class="Rectangle-12">
            <div class="row justify-content-between align-items-center">
                <div class="logo col-md-1 col-sm-1">
                    <a href="homepage" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/white-logo-transparent-background-copy-4.png" class="white-logo"
                            alt="logo" /></a>
                </div>
                <div class="links col-md-3 col-lg-5 justify-content-between align-items-center">
                    <ul class="d-flex justify-content-between align-items-center">
                        <li>
                            <a href="homepage" class="text-decoration-none">HOME</a>
                        </li>
                        <li>
                            <a href="about" class="text-decoration-none">ABOUT</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none">TESTIMONIALS</a>
                        </li>
                        <li>
                            <a href="faq" class="text-decoration-none">FAQS</a>
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
                    <a href="https://www.facebook.com/helperDE/" target="_blank" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/facebook.png" class="facebook" /></a>
                    <a href="https://www.instagram.com/helperlandde/" target="_blank" class="text-decoration-none"><img
                            src="<%= request.getContextPath() %>/resources/img/img-US/instagram.png" class="instagram" /></a>
                </div>
                <div class="Rectangle-12-copy-2"></div>

                <span class="-Helperland-All-rights-reserved-Terms-and-Conditions">
                    ©2022 Helperland<span class="text-style-1">.</span> All rights
                    reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="terms text-decoration-none">
                        Terms and Conditions </a>&nbsp; | &nbsp;
                    <a href="#" class="terms text-decoration-none">Privacy Policy</a>
                </span>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/SP-Dashboard.js"></script>
    
    <script>
    
	function dashboarddt(){
		$(document).ready(function() {
			$("#dashboard").DataTable({
				dom: '<"top">rt<"bottom"lip><"clear">',
				responsive: true,
				aaSorting: [],
				columnDefs: [
					{
						orderable: false,
						targets: 4,
					},
				],
			});
		});
	}    
    
    function upcomingdt() {
    	$(document).ready(function() {
    		$("#upcoming").DataTable({
    			"dom": '<"top">rt<"bottom"lip><"clear">',
    			responsive: true,
    			"aaSorting": [],
    			"order":[[1,"asc"]]
    		});
    	});
    }
    
    function historydt() {
    	$(document).ready(function() {
    		$("#history").DataTable({
    			"dom": '<"top">rt<"bottom"lip><"clear">',
    			responsive: true,
    			"aaSorting": [],
    			"order":[[1,"asc"]]
    		});
    	});
    }
    
   
    /* Details Modal */
	
	function detailsmodal(v) {
    	console.log(v);
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/spdetailsmodal/"  + v,
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
				$("#detailsid").html('27'+data.servicerequest.serviceId);
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
    
  
    /* Dashboard */
    
    function dashboard(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/spDashboard/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="dashboard" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Date</span></div></th><th><div class="d-flex"><span class="heading">Customer Details</span></div></th><th><div class="d-flex"><span class="heading">Payment</span></div></th><th><div class="d-flex"><span class="heading">Time Conflict</span></div></th><th><div class="d-flex"><span class="heading">Actions</span></div></th></tr></thead>'
				result += "<tbody>";
				$.each(response, function(k, v) {
					console.log(v.serviceId);
										
					result += "<tr>";
					result += '<td class="align-middle"><span class="sid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi spmodal">';
					result += '<div class="d-flex"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += '<td class="align-middle">';
					result += '<div class="">';
					result += '<span class="david">'+ v.customer.firstName +' '+v.customer.lastName+'</span>';
					result += '<div class="d-flex">';
					result += '<img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">';
					result += '<p class="add">'+ v.serviceRequestAddress.addressLine1 +', '+ v.serviceRequestAddress.addressLine2 +'</p>';
					result += '</div>';
					result += '</div>';
					result += '</td>';
					result += '<td class="align-middle"><span class="cs-price ">';
					result += '<img src="<%=request.getContextPath()%>/resources/img/img-BookNow/blue-euro.png" class="totaleuro">';
					result += '<span>&nbsp;'+v.subTotal+'</span>';
					result += '</span></td>';
					result += '<td class="align-middle">';
					result += ' ';
					result += '</td>';
					result += '<td class="align-middle">';
					result += '<button class="accept text-white" data-bs-toggle="modal" data-bs-target="#acceptmodal" onclick="acceptreq('+ v.serviceId +')">Accept</button>';
					result += '</td>';
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#dashboardtable").html(result);
				dashboarddt();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
    
    window.onload = dashboard();
    
    $(document).on('click','#defaultOpen', function(){
		dashboard();
	});
	
	$(document).on('click','#dashnav', function(){
		dashboard();
	});
    
    /* Upcoming */
    
    function upcoming(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/upcomingservices/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="upcoming" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Date</span></div></th><th><div class="d-flex"><span class="heading">Customer Details</span></div></th><th><div class="d-flex"><span class="heading">Payment</span></div></th><th><div class="d-flex"><span class="heading">Cancel?</span></div></th><th><div class="d-flex"><span class="heading">Completed?</span></div></th></tr></thead>'
				result += "<tbody>";
				$.each(response, function(k, v) {
					console.log(v.serviceId);

										
					result += "<tr>";
					result += '<td class="align-middle"><span class="sid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi spmodal">';
					result += '<div class="d-flex"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += '<td class="align-middle">';
					result += '<div class="">';
					result += '<span class="david">'+ v.customer.firstName +' '+v.customer.lastName+'</span>';
					result += '<div class="d-flex">';
					result += '<img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">';
					result += '<p class="add">'+ v.serviceRequestAddress.addressLine1 +', '+ v.serviceRequestAddress.addressLine2 +'</p>';
					result += '</div>';
					result += '</div>';
					result += '</td>';
					result += '<td class="align-middle"><span class="cs-price ">';
					result += '<img src="<%=request.getContextPath()%>/resources/img/img-BookNow/blue-euro.png" class="totaleuro">';
					result += '<span>&nbsp;'+v.subTotal+'</span>';
					result += '</span></td>';
					result += '<td class="align-middle">';
					result += ' <button type="submit" class="cancel text-white" data-bs-toggle="modal" data-bs-target="#cancelmodal" onclick="cancelreq('+ v.serviceId +')">Cancel</button>';
					result += '</td>';
					result += '<td class="align-middle">';
					result += ' <button type="submit" class="completed text-white" data-bs-toggle="modal" data-bs-target="#completedmodal" onclick="completedreq('+ v.serviceId +')">Completed</button>';
					result += '</td>';
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#upcomingtable").html(result);
				upcomingdt();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
	$(document).on('click','#upcomingtab', function(){
		upcoming();
	});
	
	$(document).on('click','#upcomingnav', function(){
		upcoming();
	});
	
	function cancelreq(v){
		jQuery(document).ready(function($) {
			$("#cancelform").submit(function(event) {
				event.preventDefault();
				cancelRequest(v);
				console.log(v);
			});
		});
	}
    function cancelRequest(v){
    	$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/cancelsprequest/" + v,
			success: function(data) {
				console.log("SUCCESS: cancelled", data);
				
				if(data==0){
					alert("Not cancelled!");
				}
				else{
					upcoming();
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
    
    /* accept req */
    
    function acceptreq(v){
		jQuery(document).ready(function($) {
			$("#acceptbtn").click(function(event) {
				acceptRequest(v);
				console.log(v);
			});
		});
	}
    function acceptRequest(v){
    	$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/acceptsprequest/" + v,
			success: function(data) {
				console.log("SUCCESS: accepted", data);
				
				if(data==0){
					alert("Not accepted!");
				}
				else{
					dashboard();
					alert("Accepted successfully! \n\nServiceId : 27" + v);
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
    
    
    /* completed req */
    
    function completedreq(v){
		jQuery(document).ready(function($) {
			$("#completedform").submit(function(event) {
				event.preventDefault();
				completeRequest(v);
				console.log(v);
			});
		});
	}
    function completeRequest(v){
    	$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/completedsprequest/" + v,
			success: function(data) {
				console.log("SUCCESS: completed", data);
				
				if(data==0){
					alert("Not completed!");
				}
				else{
					upcoming();
					alert("Completed successfully! \n\nServiceId : 27" + v);
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
    
    
    /* service history */
    
    function sphistory(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/spservicehistory/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="history" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Date</span></div></th><th><div class="d-flex"><span class="heading">Customer Details</span></div></th><th><div class="d-flex"><span class="heading">Payment</span></div></th><th><div class="d-flex"><span class="heading">Report</span></div></th><th><div class="d-flex"><span class="heading">Payment Status</span></div></th></tr></thead>'
				result += "<tbody>";
				$.each(response, function(k, v) {
					console.log(v.serviceId);
					
					var status="";
					if(v.status=="Completed"){
						status='<button class="greenbtn">Completed</button>';
					}
					else{
						status='<button class="pinkbtn">Cancelled</button>';
					}

										
					result += "<tr>";
					result += '<td class="align-middle"><span class="sid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi spmodal">';
					result += '<div class="d-flex"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += '<td class="align-middle">';
					result += '<div class="">';
					result += '<span class="david">'+ v.customer.firstName +' '+v.customer.lastName+'</span>';
					result += '<div class="d-flex">';
					result += '<img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">';
					result += '<p class="add">'+ v.serviceRequestAddress.addressLine1 +', '+ v.serviceRequestAddress.addressLine2 +'</p>';
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
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#historytable").html(result);
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
		sphistory();
	});
	
	$(document).on('click','#historynav', function(){
		sphistory();
	});
	
	
	/* SP Settings Change Password */
	
	jQuery(document).ready(function($) {
		$("#passwordform").submit(function(event) {
			event.preventDefault();
			updatePassword();
		});
	});
	function updatePassword() {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/updateSPPassword/" + $("#settingsoldpassword").val() + "," + $("#settingsnewpassword").val(),
			success: function(data) {
				console.log("SUCCESS: ", data);
				if (data == 0) {
					alert("Please enter correct Old Password!");
				}
				else {
					$("#settingsoldpassword").val('');
					$("#settingsnewpassword").val('');
					$("#settingsconfirmpassword").val('');
					alert("Password Changed Successfully!");
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
	
	/* SP settings details */
	
	jQuery(document).ready(function($) {
		$("#addDetailsForm").submit(function(event) {
			event.preventDefault();
			updatespDetails();
		});
	});
	function updatespDetails() {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/updateSPDetails/" + $("#detailsFirstname").val() + "," + $("#detailsLastname").val() + "," + $("#detailsEmail").val() + "," + $("#detailsMobile").val()
				+ "," + $("#detailsBdate").val() + "," + $("#detailsBMonth").val() + "," + $("#detailsBYear").val() + "," + $("#detailsNationality").val()
				+ "," +  $("input[type=radio][name=gender]:checked").val() + "," + $("#addline1").val() + "," + $("#addline2").val() + "," + $("#addpostalcode").val() 
				+ "," + $("#addcity").val() + "," + $('input[name="avatar"]:checked').val(),
			success: function(data) {
				console.log("SUCCESS: ", data);
				$("#bannername").html($("#detailsFirstname").val());
				alert("Details Updated Successfully!");
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	

	/* Avatar img */

	$(document).on('click', '.input-hidden', function() {
		var changedimg = '<img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-' + $('input[name="avatar"]:checked').val() + '.png"/>';
		$('#change').html(changedimg);
	});
	

	$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
		$("#success-alert").slideUp(500);
	});
	
	/* Ratings modal */
	
	function sprating(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/spratings/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="rating" colspacing="0" style="width: 100%;">'
				result += "<tbody>";
				$.each(response, function(k, v) {
					
					var ratingcomment="";
					if(v.ratings==5){
						ratingcomment="Excellent!";
					}
					else if(v.ratings==4){
						ratingcomment="Very Good!";
					}
					else if(v.ratings==3){
						ratingcomment="Good!";
					}
					else if(v.ratings==2){
						ratingcomment="Normal";
					}
					else{
						ratingcomment="Poor";
					}
										
					result += "<tr>";
					result += '<td class="align-middle"><div class="sid">27'+ v.serviceRequest.serviceId +'</div><div>'+ v.customer.firstName +' '+ v.customer.lastName +'</div></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi">';
					result += '<div class="d-flex">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceRequest.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/ghadi.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceRequest.serviceStartTime + ' (Total Hours: '+ v.serviceRequest.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += "<td>";
					result += "<div><strong style='color: #646464;'>Ratings</strong></div>";
					result += v.ratings+"/5 &nbsp;"+ratingcomment;
					result += "</td>";
					result += "</tr>";
					result += "<tr>";
					result += '<td colspan="3">';
					result += '<div><strong style="color: #646464;">Customer comment</strong></div>';
					result += '<div>'+v.comments+'</div>';
					result += "</td>";
					result += "</tr>";
					result += "<tr>";
					result += '<td colspan="3">';
					result += "</td>";
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#ratingtable").html(result);
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
    $(document).on('click','#ratingtab', function(){
    	sprating();
	});
	
	$(document).on('click','#ratingnav', function(){
		sprating();
	});
	


    </script>

</body>

</html>