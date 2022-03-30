topbtnn = document.getElementById("topbtn");
window.onscroll = function() {
	scrollFunction();
};
function scrollFunction() {
	if (
		document.body.scrollTop > 150 ||
		document.documentElement.scrollTop > 150
	) {
		topbtnn.style.display = "block";
	} else {
		topbtnn.style.display = "none";
	}
}
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}
function logout() {
	alert("You are successfully logged out!");
}
var first = document.getElementById("firsttab");
var second = document.getElementById("secondtab");
var third = document.getElementById("thirdtab");
var fourth = document.getElementById("fourthtab");

var serv = document.getElementById("service");
var sche = document.getElementById("schedule");
var det = document.getElementById("details");
var pay = document.getElementById("payment");


window.onload = firsttab();

function firsttab() {
	first.style.display = "block";
	second.style.display = "none";
	third.style.display = "none";
	fourth.style.display = "none";
	
	$('#service').attr('disabled',false);
	$('#schedule').attr('disabled',true);
	$('#details').attr('disabled',true);
	$('#payment').attr('disabled',true);
	
	serv.style.color = "#fff";
	serv.style.backgroundColor = "#1d7a8c";
	
	sche.style.color = "#646464";
	sche.style.backgroundColor = "#f3f3f3";
}

function secondtab() {
	first.style.display = "none";
	second.style.display = "block";
	third.style.display = "none";
	fourth.style.display = "none";
	
	$('#service').attr('disabled',true);
	$('#schedule').attr('disabled',false);
	$('#details').attr('disabled',true);
	$('#payment').attr('disabled',true);
	
	det.style.color = "#646464";
	det.style.backgroundColor = "#f3f3f3";

	serv.style.color = "#646464";
	serv.style.backgroundColor = "#f3f3f3";

	sche.style.color = "#fff";
	sche.style.backgroundColor = "#1d7a8c";

}

function thirdtab() {

	var x = document.forms["secondform"]["TomorrowDate"].value;
	if (x == "" || x == null) {
		$('#datemodal').modal("show");
		return false;
	}

	first.style.display = "none";
	second.style.display = "none";
	third.style.display = "block";
	fourth.style.display = "none";
	
	$('#service').attr('disabled',true);
	$('#schedule').attr('disabled',true);
	$('#details').attr('disabled',false);
	$('#payment').attr('disabled',true);

	det.style.color = "#fff";
	det.style.backgroundColor = "#1d7a8c";

	sche.style.color = "#646464";
	sche.style.backgroundColor = "#f3f3f3";
	
	pay.style.color = "#646464";
	pay.style.backgroundColor = "#f3f3f3";

	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: "/Helperland-Tatvasoft/readaddress/",
		success: function(response) {
			console.log("SUCCESS: ", response);

			var result = "<thead><tr><th></th><th></th><th></th></tr></thead>"
			result += "<tbody>";
			$.each(response, function(k, v) {
				result += "<tr>";
				result += "<td>";
				result += '<div class="form-check" id="radioid"><input class="form-check-input position-static addressradio" type="radio" name="addressradio" id="addressradio" value=' + v.addressId + ' aria-label="..."></div>';
				result += "</td>";
				result += "<td>";
				result += "</td>";
				result += "<td>";
				result += '<div class="row"><span><strong>Address:  </strong>' + v.addressLine1 + ', ' + v.addressLine2 + '</span> <span><strong>Phone number:  </strong>' + v.mobile + '</span></div>';
				result += "</td>";
				result += "</tr>";
			});
			result += "</tbody>";
			$("#showadd").html(result);
		},
		error: function(e) {
			console.log("ERROR: ", e);
		},
		done: function(e) {
			console.log("DONE");
		}
	});

}


$(document).ready(function() {
	var dtToday = new Date();

	var month = dtToday.getMonth() + 1;
	var day = dtToday.getDate() + 1;
	var year = dtToday.getFullYear();
	if (month < 10)
		month = '0' + month.toString();
	if (day < 10)
		day = '0' + day.toString();

	var maxDate = year + '-' + month + '-' + day;
	$('#tomorrowdate').attr('min', maxDate);
});


$("#thirdcontinue").click(function() {
	console.log($('#addressradio:checked').val());
	console.log($('#tomorrowdate').val());
	console.log($('#starttime').val());
	console.log($('#petsathome').is(':checked'));
});


function fourthtab() {

	first.style.display = "none";
	second.style.display = "none";
	third.style.display = "none";
	fourth.style.display = "block";
	
	$('#service').attr('disabled',true);
	$('#schedule').attr('disabled',true);
	$('#details').attr('disabled',true);
	$('#payment').attr('disabled',false);

	pay.style.color = "#fff";
	pay.style.backgroundColor = "#1d7a8c";

	det.style.color = "#646464";
	det.style.backgroundColor = "#f3f3f3";


}

function firstvalid() {
	var x = document.forms["firstform"]["PostalCode"].value;
	if (x == "" || x == null) {
		$('#firstdiv').html("Please enter postal code!");
		return false;
	}
}


// -------------------------------------------------

jQuery(document).ready(function($) {
	$("#firstform").submit(function(event) {
		event.preventDefault();
		searchpincode();
	});
});
function searchpincode() {
	var search = {}
	search["pincode"] = $("#pincode").val();
	
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/Helperland-Tatvasoft/bookpincode",
		data: $("#pincode").val(),
		success: function(data) {
			console.log("SUCCESS: ", data);
			if (data == "true") {
				$('#firstdiv').html("");
				secondtab();
			}
			else {
				$('#firstdiv').html("We do not provide service in this pincode yet.");
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


/*addresssss*/

jQuery(document).ready(function($) {
	$("#addAddressForm").submit(function(event) {
		event.preventDefault();
		addAddress();
	});
});
function addAddress() {
	var search = {}
	search["addline1"] = $("#addline1").val();

	$.ajax({
		type: "GET",
		url: "/Helperland-Tatvasoft/addAddress/" + $("#addline1").val() + "," + $("#addline2").val() + "," + $("#addpostalcode").val() + "," + $("#addcity").val() + "," + $("#addmobile").val(),
		success: function(data) {
			console.log("SUCCESS: ", data);
			thirdtab();
		},
		error: function(e) {
			console.log("ERROR: ", e);
		},
		done: function(e) {
			console.log("DONE");
		}
	});
}

/*Add address validation mobile*/

$(document).ready(function() {
	$("#addmobile").on('keyup', function() {
		var mob = $("#addmobile").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobiledivnewadd').html("Invalid mobile number.").css("color", "red");
		}
		else {
			$('#Mobiledivnewadd').html("");
		}
	});
});

$("#addAddressForm").submit(function(event) {
	var phoneno = /^\d{10}$/;
	var mobile = document.forms["addAddressForm"]["Mobile"].value;
	if (!phoneno.test(mobile)) {
		return false;
	}
	else {
		return true;
	}
});


/*Disable back button*/

$(document).ready(function() {
	window.history.pushState(null, "", window.location.href);
	window.onpopstate = function() {
		window.history.pushState(null, "", window.location.href);
	};
});