/*
* perform an Upclick by making an asynchronous call to the upclick server
*/
function doUpclick() {
    $.post("click")
        .done(function(response){
            $('#span-total-clicks').text(response.total_clicks);
            $('#span-user-clicks').text(response.user_clicks);
            
            console.log(response);
        })
        .fail(function(response){
           alert("Oh dear, something seems to have gone wrong with the game servers. We sincerely apologize. Please come back later and hopefully everything will be working.")
           console.error(response.responseText); 
        });
}

/*
* prepare document
*/
$('document').ready(function(){
    $('#btn-upclick').on('click', doUpclick);
});