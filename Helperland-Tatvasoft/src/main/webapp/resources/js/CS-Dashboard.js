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
