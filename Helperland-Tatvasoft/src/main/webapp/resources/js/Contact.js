topbtnn = document.getElementById("topbtn");
window.onscroll = function () { scrollFunction() };
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

$(document).ready(function () {
   $("#ConfirmPassword").on('keyup', function(){
    var password = $("#Password").val();
    var confirmPassword = $("#ConfirmPassword").val();
    if (password != confirmPassword)
        $("#CheckPasswordMatch").html("Password does not match !").css("color","red");
    else
        $("#CheckPasswordMatch").html("Password match !").css("color","green");
   });
});

$(document).ready(function () {
   $("#ConfirmPassword1").on('keyup', function(){
    var password1 = $("#Password1").val();
    var confirmPassword1 = $("#ConfirmPassword1").val();
    if (password1 != confirmPassword1)
        $("#CheckPasswordMatch1").html("Password does not match !").css("color","red");
    else
        $("#CheckPasswordMatch1").html("Password match !").css("color","green");
   });
});

function contactvalid() {
	var a = document.forms["contactform"]["FName"].value;
	var b = document.forms["contactform"]["LName"].value;
	var c = document.forms["contactform"]["PhoneNumber"].value;
	var d = document.forms["contactform"]["Email"].value;
	var e = document.forms["contactform"]["Subject"].value;
	var f = document.forms["contactform"]["Message"].value;
	if (a == "" || a == null || b == "" || b == null || c == "" || c == null || d == "" || d == null || e == "" || e == null || f == "" || f == null ) {
		alert("Please enter all details!");
		return false;
	}
	else{
		alert("Your response has been submitted!");
		return true;
	}
}