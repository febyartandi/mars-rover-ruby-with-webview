$(function(){

  $('#add_more_move').click(function(e){
    e.preventDefault();
    $('#rover_move').children().first().clone().appendTo('#rover_move');
  });
  
  $('#go_submit').click(function(e){
    not_valid = false;
    $("input").each(function(){
      if(this.value == ""){
        not_valid = true;
      } 
    });
    if(not_valid){
      e.preventDefault();
      alert("Please fill all fields");
    }
  });
})
