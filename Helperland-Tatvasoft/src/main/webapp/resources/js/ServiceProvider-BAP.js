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

