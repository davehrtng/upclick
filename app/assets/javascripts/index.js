/*
* perform an Upclick by making an asynchronous call to the upclick server
*/
function doUpclick() {
    $.post("click")
        .done(function(response){
            $('#span-total-clicks').text(response.total_clicks);
            $('#span-user-clicks').text(response.user_clicks);
            if(response.new_level) {
                var levelUpDiv = $('#div-level-up');
            	levelUpDiv.empty();
                levelUpDiv.append("<h3><img src=" + response.new_level.image_path + " width='auto' height='75em' />" + response.new_level.message +  "</h3><br />");
                levelUpDiv.fadeOut(10000);
            }
        })
        .fail(function(response){
           alert("Oh dear, something seems to have gone wrong with the game servers. We sincerely apologize. Please come back later and hopefully everything will be working.");
           console.error(response.responseText); 
        });
}

/*
* prepare document
*/
$('document').ready(function(){
    $('#btn-upclick').on('click', doUpclick);
});