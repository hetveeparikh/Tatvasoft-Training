<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<%=request.getContextPath()%>/resources/css/Admin.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admin Page | Helperland</title>
    <link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
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
                        <li class="nav-item d-flex align-items-center">
                            <div class="nav-btn">
                                <img src="<%= request.getContextPath() %>/resources/img/img-AUM/me.png">
                            </div>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <div class="nav-btn">
                                <span class="adminname">
                                    &nbsp; ${adminfirstname } ${adminlastname }
                                </span>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btn">
                                <a class="nav-link" onclick="logout()" href="logout"><img class="noti" src="<%= request.getContextPath() %>/resources/img/img-AUM/logout.png"></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
    </header>

    <section id="aummain" class="d-flex">
        <div class="sidebar">
            <a href="#" class="tablinks active" id="defaultOpen" onclick="clickadmin(event, 'adminsr')">Service Requests</a>
            <div class="divider"></div>
            <a href="#"  class="tablinks " id="umtab" onclick="clickadmin(event, 'adminum')">User Management</a>
            <div class="divider"></div>
            <a href="#">Coupon Code Management</a>
            <div class="divider"></div>
            <a href="#">Content Management</a>
            <div class="divider"></div>
            <a href="#">Invoices</a>
            <div class="divider"></div>
        </div>

        <div class="container-fluid aumbg tabcontent" id="adminsr">
            <div class="aumfirst">
                <span class="um d-flex align-items-center">Service Requests</span>
            </div>

            <div class="aumform d-flex justify-content-between">

                <input type="text" placeholder="Service ID" class="zipaum" id="idfilter">
                
                <input type="text" placeholder="Postal Code" class="zipaum" id="pinfilter">
                
                <input type="text" placeholder="Customer Name" class="zipaum" id="custfilter">
                
                <input type="text" placeholder="Service Provider Name" class="zipaum" id="spfilter">

                <button class="clearaum" id="clearsr">Clear</button>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
	                    <div id="requesttable">
	                    	<table class="table display nowrap" id="adminreq" colspacing="0" style="width: 100%;">
	                            <thead>
	                                <tr id="firstrow">
	                                    <th>
	                                        <span class="heading">Service ID</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Service date</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Customer details</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Service Provider</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Amount</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Status</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Payment Status</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Actions</span>
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
    
    	<div class="container-fluid aumbg tabcontent" id="adminum">
            <div class="d-flex justify-content-between aumfirst">
                <span class="um d-flex align-items-center">User Management</span>
                <button class="d-flex addbtn align-items-center">
                    <span>Export</span>
                </button>
            </div>

            <div class="aumform d-flex justify-content-between">
                <input type="text" placeholder="User Name" class="zipaum" id="namefilter">

				<div id="typefilter">
					<select title="User role" class="userdrop">
	                    <option value="">User role</option>
	                </select>
				</div>
                
                <div>
                    <input type="text" placeholder="+91" class="pinaum" disabled>
                    <input type="text" placeholder="Mobile number" class="mnoaum"  id="mobilefilter">
                </div>

                <input type="text" placeholder="Postal Code" class="zipaum"  id="zipcodefilter">
                <button class="clearaum" id="clearaum">Clear</button>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
	                    <div id="managetable">
	                    	<table class="table display nowrap" id="adminman" colspacing="0" style="width: 100%;">
	                            <thead>
	                                <tr id="firstrow">
	                                    <th>
	                                        <span class="heading">User Name</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Date Of Registration</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">User Type</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Phone</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Postal Code</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Active Status</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Approve Status</span>
	                                    </th>
	                                    <th>
	                                        <span class="heading">Actions</span>
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
						<span class="newdate">Select new date and time</span>
						<div class="d-flex justify-content-center">
							
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
								
								<p class="newaddress">Edit Service Address</p>
								
								<div class="d-flex">
									<div>
										<span class="addlabel">Address Line 1</span><br>
										<input type="text" class="street" required
										name="AddressLine1" id="addline1">
									</div>
									<div>
										<span class="addlabel">Address Line 2</span><br>
										<input type="text" class="houseno" 
										name="AddressLine2" id="addline2" required >
									</div>
								</div>

								<div class="d-flex">
									<div>
										<span class="addlabel">Postal Code</span><br>
										<input type="text"  class="postal"
										name="PostalCode" id="addpostalcode" required> 
									</div>
									
									<div>
										<span class="addlabel">Add City</span><br>
										<select title="City" class="city" name="City" id="addcity" required>
											<option value="">Choose your city</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>
								</div>
								<div class="text-center">
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
    </section>
    
    <footer>
    	 <p class="aumrights">©2022 Helperland. All rights reserved.</p>
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <!-- <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>


    <script src="<%=request.getContextPath()%>/resources/js/Admin.js"></script>
    
    <script>
    
    function managedt() {
    	 $(document).ready(function () {
   	        var managetable = $('#adminman').DataTable({
   	            "dom": '<"top">rt<"bottom"lip><"clear">',responsive:true,"aaSorting": [],
   	            columnDefs: [{
   	                orderable: false,
   	                targets: 4
   	            }]
   	        });
   	        
   	     	$('#namefilter').on('keyup', function () {
   	    		managetable
	                .columns(0)
	                .search(this.value)
	                .draw();
        	});
   	     
   	     	$('#mobilefilter').on('keyup', function () {
	    		managetable
	                .columns(3)
	                .search(this.value)
	                .draw();
     		});
   	     	
   	     	$('#zipcodefilter').on('keyup', function () {
	    		managetable
	                .columns(4)
	                .search(this.value)
	                .draw();
  			});
   	     	
	   	     $("#typefilter").each(function () {
	             var select = $('<select title="User role" class="userdrop" ><option value="">User Type</option></select>')
	                 .appendTo($(this).empty())
	                 .on('change', function () {
	                	 managetable.column(2)
	                         .search($(this).val())
	                         .draw();
	                 });
	
	             managetable.column(2).data().unique().sort().each(function (d, j) {
	                 select.append('<option value="' + d + '">' + d + '</option>')
	             });
	         });
   	   	 });
	}
    
	jQuery(document).ready(function($) {
		$("#clearaum").click(function(event) {
			$('#namefilter').val('');
	    	$('#mobilefilter').val('');
	    	$('#zipcodefilter').val('');
	    	$('#typefilter').val('');
			event.preventDefault();
			adminManage();
		});
	});
	
    
	function requestsdt(){
		$(document).ready(function () {
	        var reqtable = $('#adminreq').DataTable({
	            "dom": '<"top">rt<"bottom"lip><"clear">', responsive: true, "aaSorting": [],
	            columnDefs: [{
	                orderable: false,
	                targets: 4
	            }]
	        });
	        
	        $('#idfilter').on('keyup', function () {
	        	reqtable
	                .columns(0)
	                .search(this.value)
	                .draw();
        	});
   	     
   	     	$('#custfilter').on('keyup', function () {
   	     		reqtable
	                .columns(2)
	                .search(this.value)
	                .draw();
     		});
   	     	
   	     	$('#pinfilter').on('keyup', function () {
   	     		reqtable	
	                .columns(2)
	                .search(this.value)
	                .draw();
  			});
   	     	
   	     	$('#spfilter').on('keyup', function () {
	    		reqtable
	                .columns(3)
	                .search(this.value)
	                .draw();
			});
   	     	
	    });
	}
	
	
	jQuery(document).ready(function($) {
		$("#clearsr").click(function(event) {
			$('#idfilter').val('');
	    	$('#custfilter').val('');
	    	$('#pinfilter').val('');
	    	$('#spfilter').val('');
	    	$('#statusfilter').val('');
	    	$('#paystatusfilter').val('');
			event.preventDefault();
			servicerequests();
		});
	});
	
	
    /* Service Requests */

	function servicerequests(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/adminSR/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="adminreq" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><div class="d-flex justify-content-center"><span class="heading">Service ID</span></div></th><th><div class="d-flex"><span class="heading">Service Date</span></div></th><th><div class="d-flex"><span class="heading">Customer Details</span></div></th><th><div class="d-flex "><span class="heading">Service Provider</span></div></th><th><div class="d-flex justify-content-center"><span class="heading">Amount</span></div></th><th><div class="d-flex justify-content-center"><span class="heading">Status</span></div></th><th><div class="d-flex justify-content-center"><span class="heading">Payment Status</span></div></th><th><div class="d-flex justify-content-center"><span class="heading">Actions</span></div></th></tr></thead>';
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
						fname=v.sp.firstName;
						lname=v.sp.lastName;
						profile='<img src="<%=request.getContextPath()%>/resources/img/img-Settings/avatar-' + v.sp.userProfilePicture + '.png" class="topi">';
					}
					
					var rate="";
					if(v.serviceProviderId!=0){
						avgrate = Math.round((v.rating.avgrating) * 100) / 100;
						rate = "Ratings: "+ avgrate +"/5";
					}
					else{
						rate = "";
					}
					
					var paymentstatus="";
					if(v.paymentDone==1){
						paymentstatus='<button class="greenbtn">Completed</button>';
					}
					else if(v.paymentDone==0 && v.status=="Cancelled"){
						paymentstatus='<button class="pinkbtn">Cancelled</button>';
					}
					else if(v.paymentDone==0 && (v.status=="New" || v.status=="Accepted")){
						paymentstatus='<button class="tableorangebtn">Pending</button>';
					}
					
					var status="";
					if(v.status=="Completed"){
						status='<button class="greenbtn">Completed</button>';
					}
					else if(v.status=="Accepted"){
						status='<button class="pinkbtn">Accepted</button>';
					}
					else if(v.status=="New"){
						status='<button class="tableorangebtn">New</button>';
					}
					else if(v.status=="Cancelled"){
						status='<button class="tablegraybtn">Cancelled</button>';
					}
					
					var editreschedule="";
					if(v.status=="New" || v.status=="Accepted"){
						editreschedule='<a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#reschedulemodal" onclick="reschedule('+ v.serviceId +')">Edit and Reschedule</a>';
					}
					
					result += "<tr>";
					result += '<td class="align-middle"><span class="csid"><a class="text-decoration-none detailsid" href="#" data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">27'+ v.serviceId +'</a></span></td>';
					result += '<td class="align-middle">';
					result += '<div class="d-flex flex-column justify-content-center calghadi">';
					result += '<div class="d-flex modalcursor"  data-bs-toggle="modal" data-bs-target="#DetailsModal" onclick="detailsmodal('+ v.serviceId +')">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal"> <span class="cs-date">'+v.serviceStartDate+'</span>';
					result += '</div>';
					result += '<div class="d-flex ">';
					result += '<img	src="<%=request.getContextPath()%>/resources/img/img-ASR/icon-clock.png" class="ghaditime"> <span class="cs-time" id="newtime">'+ v.serviceStartTime + ' (Total Hours: '+ v.extraHours + ') </span>';
					result += '</div>';
					result += '</div>';
					result += "</td>";
					result += '<td class="align-middle">';
					result += '<div class="">';
					result += '<span class="david">'+ v.customer.firstName +' '+v.customer.lastName+'</span>';
					result += '<div class="d-flex">';
					result += '<img class="ghar" src="<%= request.getContextPath() %>/resources/img/img-US/ghar.png">';
					result += '<p class="add">'+ v.serviceRequestAddress.addressLine1 +', '+ v.serviceRequestAddress.addressLine2 + '<br>' + v.serviceRequestAddress.city +', ' + v.serviceRequestAddress.postalCode +'</p>';
					result += '</div>';
					result += '</div>';
					result += '</td>';
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
					result += '<class="totaleuro">';
					result += '<span>&euro; '+v.subTotal+'</span>';
					result += '</span></td>';
					result += '<td class="align-middle tablestatus">'+ status +'</td>';
					result += '<td class="align-middle tablestatus">'+ paymentstatus +'</td>';
					result += '<td><div class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">';
					result += '<img src="<%= request.getContextPath() %>/resources/img/img-AUM/dots.png"></a>';
					result += '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
					result += editreschedule+'<a class="dropdown-item">Inquiry</a>';
					result += '<a class="dropdown-item">History Log</a>';
					result += '<a class="dropdown-item">Download Invoice</a>';
					result += '<a class="dropdown-item">Other Transactions</a>';
					result += '</div> </div></td>';
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#requesttable").html(result);
				requestsdt(); 
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
	window.onload = servicerequests();
	
	$(document).on('click','#defaultOpen', function(){
		servicerequests();
	});
	
	/* Reschedule Request */
	
	function reschedule(v){
		
		jQuery(document).ready(function($) {
			
			$.ajax({
				type: "GET",
				url: "/Helperland-Tatvasoft/readaddressadmin/" + v ,
				success: function(data) {
					console.log("SUCCESS:", data);
					$('#addline1').val(data.addressLine1);
					$('#addline2').val(data.addressLine2);
					$('#addpostalcode').val(data.postalCode);
					$('#addcity').val(data.city);
				},
				error: function(e) {
					console.log("ERROR: ", e);
				},
				done: function(e) {
					console.log("DONE");
				}
			});
			
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
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/rescheduleRequestsAdmin/" +$("#tomorrowdate").val() + "," + $("#updatedtime").val() + "," + v + "," + $("#addline1").val()
			+ "," + $("#addline2").val() + "," + $("#addpostalcode").val() + "," + $("#addcity").val(),
			success: function(data) {
				console.log("SUCCESS: ", data);
				servicerequests();
			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
	
    

    /* User Management */

	function usermanagement(){
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "/Helperland-Tatvasoft/adminUM/",
			success: function(response) {
				console.log("SUCCESS: ", response);

				var result = '<table class="table display nowrap" id="adminman" colspacing="0" style="width: 100%;"><thead><tr id="firstrow"><th><span class="heading">User Name</span></th><th><span class="heading">Date Of Registration</span></th><th><span class="heading">User Type</span></th><th><span class="heading">Phone</span></th><th><span class="heading">Postal Code</span></th><th><span class="heading">Active Status</span></th><th><span class="heading">Approve Status</span></th><th><span class="heading">Actions</span></th></tr></thead>';
				result += "<tbody>";
				$.each(response, function(k, v) {
					
					var usertype="";
					if(v.userTypeId==1){
						usertype="Admin";
					}
					else if(v.userTypeId==2){
						usertype="Customer";
					}
					else{
						usertype="Service Provider";
					}
					
					var pin="";
					if(v.userAddress.postalCode==null){
						pin="";
					}
					else{
						pin=v.userAddress.postalCode;
					}
					
					var activestatus="";
					var active="";
					if(v.isActive==1){
						activestatus='<button class="tablegreenbtn">Active</button>';
						active="Deactivate";
					}
					else{
						activestatus='<button class="tableorangebtn">Inactive</button>';
						active="Activate";
					}
					
					var approvestatus="";
					var approvedrop="";
					if(v.isApproved==1){
						approvestatus='<button class="tablepinkbtn">Approved</button>';
						approvedrop='';
					}
					else{
						approvestatus='<button class="tablegraybtn">Not Approved</button>';
						approvedrop='<a onclick="approvestatus('+ v.userId + ')" class="dropdown-item" href="#">Approve</a>';
					}
					
					var activedrop="";
					if(v.userTypeId==2 || v.userTypeId==1){
						activedrop='';
					}
					else{
						activedrop='<a onclick="activestatus('+ v.userId + "," + v.isActive +')" class="dropdown-item" href="#">'+active+'</a>';
					}
					
					var datecreation = v.createdDate;
					
					result += "<tr>";
					result += '<td class="align-middle tablename">'+ v.firstName + ' ' + v.lastName + '</td>';
					result += '<td class="align-middle tablename"><img src="<%=request.getContextPath()%>/resources/img/img-CS/calendar.png" class="gcal">'+ datecreation.substring(0, datecreation.indexOf(' ')); +'</td>';
					result += '<td class="align-middle tabletype">'+ usertype +'</td>';	
					result += '<td class="align-middle tablepin">'+ v.mobile +'</td>';
					result += '<td class="align-middle tablepin">'+ pin + '</td>';
					result += '<td class="align-middle tablestatus">'+ activestatus +'</td>';
					result += '<td class="align-middle tablestatus">'+ approvestatus +'</td>';
					result += '<td><div class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">';
					result += '<img src="<%= request.getContextPath() %>/resources/img/img-AUM/dots.png"></a>';
					result += '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
					result += activedrop+approvedrop+'<a onclick="deletestatus('+ v.userId + ')" class="dropdown-item">Delete</a>';
					result += '</div> </div></td>';
					result += "</tr>";
				});
				result += "</tbody>";
				result += "</table>";
				$("#managetable").html(result);
				managedt(); 

			},
			error: function(e) {
				console.log("ERROR: ", e);
			},
			done: function(e) {
				console.log("DONE");
			}
		});
	}
		
	$(document).on('click','#umtab', function(){
		usermanagement();
	});
	
	
	/* Active status */
	
	function activestatus(v,p) {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/adminactive/"  + v + "," + p,
			success: function(data) {
				console.log("SUCCESS: activated", data);

				if(data==0){
					alert("Not activated!");
				}
				else{
					usermanagement();
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
	
	/* Approve status */
	
	function approvestatus(v) {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/adminapprove/"  + v,
			success: function(data) {
				console.log("SUCCESS: approved", data);

				if(data==0){
					alert("Not approved!");
				}
				else{
					usermanagement();
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
	
	/* Delete status */
	
	function deletestatus(v) {
		$.ajax({
			type: "GET",
			url: "/Helperland-Tatvasoft/admindelete/"  + v,
			success: function(data) {
				console.log("SUCCESS: deleted", data);

				if(data==0){
					alert("Not deleted!");
				}
				else{
					usermanagement();
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
			url: "/Helperland-Tatvasoft/detailsmodaladmin/"  + v,
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
	
	
	
    </script>
</body>

</html>