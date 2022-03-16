topbtnn = document.getElementById("topbtn");
window.onscroll = function() { scrollFunction() };
function scrollFunction() {
	if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
		topbtnn.style.display = "block";
	}
	else {
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
$(document).ready(function() {
	$("#ConfirmPassword").on('keyup', function() {
		var password = $("#Password").val();
		var confirmPassword = $("#ConfirmPassword").val();
		if (password != confirmPassword)
			$("#CheckPasswordMatch").html("Password does not match !").css("color", "red");
		else
			$("#CheckPasswordMatch").html("Password match !").css("color", "green");
	});
});

$(document).ready(function() {
	$("#ConfirmPassword1").on('keyup', function() {
		var password1 = $("#Password1").val();
		var confirmPassword1 = $("#ConfirmPassword1").val();
		if (password1 != confirmPassword1)
			$("#CheckPasswordMatch1").html("Password does not match !").css("color", "red");
		else
			$("#CheckPasswordMatch1").html("Password match !").css("color", "green");
	});
});

/* Validation msg for Password */

$(document).ready(function() {
	$("#Password").on('keyup', function() {
		var password = $("#Password").val();
		var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
		if (!regularExpression.test(password)) {
			$('#Passworddiv').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.<br><hr>").css("color", "red");
		}
		else {
			$('#Passworddiv').html("Password strength : Good<br><hr>").css("color", "green");
		}
	});
});

$(document).ready(function() {
	$("#Password1").on('keyup', function() {
		var password = $("#Password1").val();
		var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
		if (!regularExpression.test(password)) {
			$('#Passworddiv1').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.<br><hr>").css("color", "red");
		}
		else {
			$('#Passworddiv1').html("Password strength : Good<br><hr>").css("color", "green");
		}
	});
});

/* Validation msg for Mobile */

$(document).ready(function() {
	$("#Mobile").on('keyup', function() {
		var mob = $("#Mobile").val();
		var phoneno = /^\d{10}$/;
		if (!phoneno.test(mob)) {
			$('#Mobilediv').html("Invalid mobile number.<br><hr>").css("color", "red");
		}
		else {
			$('#Mobilediv').html("");
		}
	});
});

$(document).ready(function() {
	$("#Mobile1").on('keyup', function() {
		var mob = $("#Mobile1").val();
		var phoneno = /^\d{10}$/;
		if (mob.match(phoneno)) {
			$('#Mobilediv1').html("Invalid mobile number.<br><hr>").css("color", "red");
		}
		else {
			$('#Mobilediv1').html("");
		}
	});
});


/* Form Validations */

$("#registerform").submit(function(event) {
	var password = document.forms["registerform"]["Password"].value;
	var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
	if (!regularExpression.test(password)) {
		return false;
	}
	else {
		return true;
	}

	var phoneno = /^\d{10}$/;
	var mobile = document.forms["registerform"]["Mobile"].value;
	if (mobile.match(phoneno)) {
		return true;
	}
	else {
		return false;
	}
});


$("#registerform").submit(function(event) {
	var password = document.forms["registerform"]["Password1"].value;
	var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
	if (!regularExpression.test(password)) {
		return false;
	}
	else {
		return true;
	}

	var phoneno = /^\d{10}$/;
	var mobile = document.forms["registerform"]["Mobile"].value;
	if (mobile.match(phoneno)) {
		return true;
	}
	else {
		return false;
	}
});