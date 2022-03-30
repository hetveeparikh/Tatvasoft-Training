function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}
function logout() {
	alert("You are successfully logged out!");
}

function clicksp(evt, tabName) {
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

/*Mobile validation*/

$(document).ready(function() {
	$("#detailsMobile").on('keyup', function() {
		var mob = $("#detailsMobile").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobilespdetailsdiv').html("Invalid mobile number.").css("color", "red");
		}
		else {
			$('#Mobilespdetailsdiv').html("");
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

/*Disable back button*/

$(document).ready(function() {
	window.history.pushState(null, "", window.location.href);
	window.onpopstate = function() {
		window.history.pushState(null, "", window.location.href);
	};
});