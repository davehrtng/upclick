/*
* perform an Upclick by making an asynchronous call to the upclick server
*/
function doUpclick() {
    $.post("click")
        .done(function(response){
            $('#span-total-clicks').text(response.total_clicks);
            $('#span-user-clicks').text(response.user_clicks);
            $('#div-level-up').empty();
            if(response.new_level) {
                var levelUpDiv = $('#div-level-up');
                levelUpDiv.append("<h3>" + response.new_level.message +  "</h3><br />");
                levelUpDiv.append('<img src=' + response.new_level.image_path + '/>');
                console.log(response);
            }
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