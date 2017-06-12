// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require chosen-jquery
//= require scaffold
//= require bootstrap-datepicker

//= require chartkick

//Toggle a div
// $(function() {
//   $('a#show_details').click(function(event){
//     event.preventDefault();
//     $('div#whatever').toggle();
//   });
// });




//Toggle details and hide the others
$(document).on('turbolinks:load', function() {
    $(".edit_family").on('click', function () {
        var $details = $(this).next(".edit_f");
        $details.toggle(); //toggle the current one
        $(".edit_f").not($details).slideUp(); //hide the others
    });
});


//Toggle details and hide the others
$(document).on('turbolinks:load', function() {
    $(".edit_dep").on('click', function () {
        var $details = $(this).next(".edit_d");
        $details.toggle(); //toggle the current one
        $(".edit_d").not($details).slideUp(); //hide the others
    });
});

// //datepicker
// $(document).on('turbolinks:load', function(){
//     $('.datepicker').datepicker();
//   });



//Flip
$( document ).on('turbolinks:load', function() {
$('.flip').click(function(){
    $(this).find('.card').addClass('flipped').mouseleave(function(){
        $(this).removeClass('flipped');
    });
    return true;
});
})


//Department Flip
$( document ).on('turbolinks:load', function() {
$('.flip_dep').click(function(){
    $(this).find('.card').addClass('flipped').mouseleave(function(){
        $(this).removeClass('flipped');
    });
    return true;
});
})

// NAVIGATION POPOUT
function openNav() {
    document.getElementById("mySidenav").style.width = "200px";
    document.getElementById("content-container").style.marginLeft = "265px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("content-container").style.marginLeft = "0";
}

// //overlay
// /* Set the width of the side navigation to 250px */
// function openNav() {
//     document.getElementById("mySidenav").style.width = "250px";
// }
//
// /* Set the width of the side navigation to 0 */
// function closeNav() {
//     document.getElementById("mySidenav").style.width = "0";
// }
