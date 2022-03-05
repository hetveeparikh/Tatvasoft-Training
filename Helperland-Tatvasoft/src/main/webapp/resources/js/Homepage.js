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

let t1ine = gsap.timeline({
	scrollTrigger: {
		trigger: '.arrowline',
		start: "center bottom"
	}
});
t1ine.from(".al1", { y: 100, opacity: 0, duration: 0.3 })
t1ine.from(".a1", { y: 100, opacity: 0, duration: 0.1 })
t1ine.from(".al2", { y: 100, opacity: 0, duration: 0.3 })
t1ine.from(".a2", { y: 100, opacity: 0, duration: 0.1 })
t1ine.from(".al3", { y: 100, opacity: 0, duration: 0.3 })
t1ine.from(".a3", { y: 100, opacity: 0, duration: 0.1 })
t1ine.from(".al4", { y: 100, opacity: 0, duration: 0.3 })

let t1cust = gsap.timeline({
	scrollTrigger: {
		trigger: '#customers',
	}
});
t1cust.from(".box", { y: 150, opacity: 0, duration: 3 })

const cy = gsap.timeline({ scrollTrigger: '.cyrow' }, { defaults: { duration: 5, ease: "elastic.out(1,0.1)" } });
cy.fromTo('.cy1', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 });
cy.fromTo('.cy2', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 }, '<');
cy.fromTo('.cy3', { y: 100, duration: 5, opacity: 0 }, { y: 0, opacity: 1 }, '<');

const g36 = gsap.timeline({ scrollTrigger: '.grp36' }, { defaults: { duration: 2, ease: "elastic.out(1,0.1)" } });
g36.fromTo('.grp36', { scale: 0, rotation: '-45deg', y: 300 }, { scale: 1, rotation: '0deg', y: 0 });

const wdktl = gsap.timeline({ scrollTrigger: '.wdkrow' }, { defaults: { duration: 2 } });
wdktl.fromTo('.wdkpara', { x: 500, opacity: 0, duration: 4 }, { x: 0, opacity: 1 });

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

