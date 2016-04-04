var init_friend_lookup;

init_friend_lookup = function(){
  $('#friends-lookup-form').on('ajax:before',function(event,data,status){
    show_spinner();
  });
  $('#friends-lookup-form').on('ajax:after',function(event,data,status){
    hide_spinner();
  });

  $('#friends-lookup-form').on('ajax:success', function(event,data,status){
    $('#friends-lookup').replaceWith(data);
    init_friend_lookup();
  });

  $('#friends-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#friends-lookup-results').replaceWith(' ');
    $('#friends-lookup-errors').replaceWith('Person was not found');
   });
}


$(document).ready(function(){
  init_friend_lookup();
})

