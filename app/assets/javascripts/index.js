/*
* perform an Upclick by making an asynchronous call to the upclick server
*/
function doUpclick() {
    $.post("click");
}

/*
* prepare document
*/
$('document').ready(function(){
    $('#btn-upclick').on('click', doUpclick);
});