function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}
$(document).ready(function () {
    $('#example').DataTable({
        "dom": '<"top">rt<"bottom"lip><"clear">'
    });
});