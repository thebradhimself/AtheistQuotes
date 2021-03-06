// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= datatables.min 
//= require_tree .

$(document).ready(function(){
  $("#quotes-table").DataTable({
    "bSort": false,
    "pageLength": 25
  });

  $(".favorite-quote").click(function(){
    that = this
    if($(that).data('user') == false){
      alert('Login/Signup to favorite!')
      return;
    }
    $.ajax({
      url: '/favoriting',
      method: 'GET',
      dataType: 'JSON',
      data: {id: $(that).data('id')},
      success: function(data){
        if(data.checked)
          $(that).removeClass('fa-heart-o').addClass('fa-heart')
        else
          $(that).removeClass('fa-heart').addClass('fa-heart-o')
      }
    });
  });

  $('#signupModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  });
  
  $('#forgotPasswordModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  });
});
