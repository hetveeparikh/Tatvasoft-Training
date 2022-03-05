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
const spbap = gsap.timeline({
    scrollTrigger: {
        trigger: '.spreg',
        start: "center bottom"
    }
}, { defaults: { duration: 5, ease: "elastic.out(1,0.1)" } });
spbap.fromTo('.spreg', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 });

const spbap1 = gsap.timeline({
    scrollTrigger: {
        trigger: '.spreg1',
        start: "center bottom"
    }
}, { defaults: { duration: 5, ease: "elastic.out(1,0.1)" } });
spbap.fromTo('.spreg1', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 });

const spbap2 = gsap.timeline({
    scrollTrigger: {
        trigger: '.spreg2',
        start: "center bottom"
    }
}, { defaults: { duration: 5, ease: "elastic.out(1,0.1)" } });
spbap.fromTo('.spreg2', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 });


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

$(document).ready(function () {
   $("#cpass").on('keyup', function(){
    var pass = $("#pass").val();
    var cpass = $("#cpass").val();
    if (pass != cpass)
        $("#check").html("Password does not match !").css("color","red");
    else
        $("#check").html("Password match !").css("color","green");
   });
});