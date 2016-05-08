/*
* perform an Upclick by making an asynchronous call to the upclick server
*/
function doUpclick() {
    $.post("click")
        .done(function(response){
            $('#span-total-clicks').text(response.total_clicks);
            $('#span-user-clicks').text(response.user_clicks);
        });
}

/*
* prepare document
*/
$('document').ready(function(){
    $('#btn-upclick').on('click', doUpclick);
});