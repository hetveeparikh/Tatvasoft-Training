function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}

function logout() {
	alert("You are successfully logged out!");
}

function clickcust(evt, tabName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();

$(function() {
	$('#defaultOpen').addClass('active');
});


function clickSettings(evt, settingtab) {
	var i, tabcontent1, tablinks1;
	tabcontent1 = document.getElementsByClassName("tabcontent1");
	for (i = 0; i < tabcontent1.length; i++) {
		tabcontent1[i].style.display = "none";
	}
	tablinks1 = document.getElementsByClassName("tablinks1");
	for (i = 0; i < tablinks1.length; i++) {
		tablinks1[i].className = tablinks1[i].className.replace(" active1", "");
	}
	document.getElementById(settingtab).style.display = "block";
	evt.currentTarget.className += " active1";
}
document.getElementById("defaultOpen1").click();

$(function() {
	$('#defaultOpen1').addClass('active1');
});


/* Settings Details */

jQuery(document).ready(function($) {
	$("#addDetailsForm").submit(function(event) {
		event.preventDefault();
		updateDetails();
	});
});
function updateDetails() {
	$.ajax({
		type: "GET",
		url: "/Helperland-Tatvasoft/updateCustomerDetails/" + $("#detailsFirstname").val() + "," + $("#detailsLastname").val() + "," + $("#detailsEmail").val() + "," + $("#detailsMobile").val()
			+ "," + $("#detailsBdate").val() + "," + $("#detailsBMonth").val() + "," + $("#detailsBYear").val() + "," + $("#detailsLanguage").val(),
		success: function(data) {
			console.log("SUCCESS: ", data);
			$("#bannername").html($("#detailsFirstname").val());
			alert("Details updated successfully!");
		},
		error: function(e) {
			console.log("ERROR: ", e);
		},
		done: function(e) {
			console.log("DONE");
		}
	});
}


/* Settings Password */

jQuery(document).ready(function($) {
	$("#passwordform").submit(function(event) {
		event.preventDefault();
		updatePassword();
	});
});
function updatePassword() {
	$.ajax({
		type: "GET",
		url: "/Helperland-Tatvasoft/updateCustomerPassword/" + $("#settingsoldpassword").val() + "," + $("#settingsnewpassword").val(),
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

/*Password Validation*/

$(document).ready(function() {
	$("#settingsnewpassword").on('keyup', function() {
		var password = $("#settingsnewpassword").val();
		var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
		if (!regularExpression.test(password)) {
			$('#Passwordspdetailsdiv').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.").css("color", "red");
		}
		else {
			$('#Passwordspdetailsdiv').html("Password strength : Good").css("color", "green");
		}
	});
});

$("#passwordform").submit(function(event) {
	var password = document.forms["passwordform"]["password"].value;
	var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
	if (!regularExpression.test(password)) {
		return false;
	}
	else {
		return true;
	}
});

/*Details validation mobile*/

$(document).ready(function() {
	$("#detailsMobile").on('keyup', function() {
		var mob = $("#detailsMobile").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobiledivdetails').html("Invalid mobile number.").css("color", "red");
		}
		else {
			$('#Mobiledivdetails').html("");
		}
	});
});

$("#addDetailsForm").submit(function(event) {
	var phoneno = /^\d{10}$/;
	var mobile = document.forms["addDetailsForm"]["Mobile"].value;
	if (!phoneno.test(mobile)) {
		return false;
	}
	else {
		return true;
	}
});


/*Edit address validation mobile*/

$(document).ready(function() {
	$("#addmobile").on('keyup', function() {
		var mob = $("#addmobile").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobilediveditadd').html("Invalid mobile number.").css("color", "red");
		}
		else {
			$('#Mobilediveditadd').html("");
		}
	});
});

$("#editAddressSettingsForm").submit(function(event) {
	var phoneno = /^\d{10}$/;
	var mobile = document.forms["editAddressSettingsForm"]["Mobile"].value;
	if (!phoneno.test(mobile)) {
		return false;
	}
	else {
		return true;
	}
});

/*Add address validation mobile*/

$(document).ready(function() {
	$("#addmobilee").on('keyup', function() {
		var mob = $("#addmobilee").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobiledivnewadd').html("Invalid mobile number.").css("color", "red");
		}
		else {
			$('#Mobiledivnewadd').html("");
		}
	});
});

$("#addAddressSettingsForm").submit(function(event) {
	var phoneno = /^\d{10}$/;
	var mobile = document.forms["addAddressSettingsForm"]["Mobile"].value;
	if (!phoneno.test(mobile)) {
		return false;
	}
	else {
		return true;
	}
});

