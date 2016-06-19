// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````                                                                                                                                                                                                                                                                                                                  compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .

$(document).ready(function(){
    $('[data-toggle="popover"]').popover(
        {
        html : true, 
        content: function() {
          return $('[data-toggle="popover"]').html();
        },
        title: function() {
          return $('[data-toggle="popover"]').html();
        }
    }); 
    $('.table-data').DataTable();
    $(".manage-students").click(function(){
      $(".manage-tabs").hide();
      $(".manage-students-panel").fadeIn(500);
    });
    $(".manage-courses").click(function(){
      $(".manage-tabs").hide();
      $(".manage-courses-panel").fadeIn(500);
    });
    $(".manage-teachers").click(function(){
      $(".manage-tabs").hide();
      $(".manage-teachers-panel").fadeIn(500);
    });
    $("#role_select").change(function(){
      $(".role-form").hide()
      $("."+$(this).val()+"-form").fadeIn(500);
    });
    
    
  
    $('.spinner-btn').click(function() {
      var $t = $(this);
      var $tc = $(".text-val",this)
        $t.toggleClass('active');
        $tc.html("Appling...")
        $.ajax({
            url: "/students/add_course",
            data: { course_id: $t.attr("course_id"), student_id: $t.attr("student_id") }
          })
        .done(function( msg ) {
          $t.removeClass('active');
          $t.removeClass("btn btn-default");
          $tc.html("Applied")
        });
       
    });
    
    
});
