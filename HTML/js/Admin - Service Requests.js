$(document).ready(function () {
    $('#example').DataTable({
        "dom": '<"top">rt<"bottom"lip><"clear">', responsive: true, "aaSorting": [],
        columnDefs: [{
            orderable: false,
            targets: 4
        }]
    });
});