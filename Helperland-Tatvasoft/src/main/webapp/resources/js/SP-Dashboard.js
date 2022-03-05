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
	$("#dashboard").DataTable({
		dom: '<"top">rt<"bottom"lip><"clear">',
		responsive: true,
		aaSorting: [],
		columnDefs: [
			{
				orderable: false,
				targets: 4,
			},
		],
	});
});

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