function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
$(document).ready(function () {
    $('#exampledash').DataTable({
        "dom": '<"top">rt<"bottom"lip><"clear">',responsive:true,"aaSorting": [],
        columnDefs: [{
            orderable: false,
            targets: 4
        }]
    });
});