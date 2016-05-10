/* globals $ */
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
//= require turbolinks
//= require materialize-sprockets
//= require react
//= require react_ujs
//= require components
//= require_tree .

var ready;
ready = function() {
    $(".clicky-button").on("click", function () {
        $(this).parent().find(".expand-me").toggleClass("hide-on-small-only");
    }),
    $(".click-me").on("click", function () {
        $(".hidden-form").toggleClass("hide");
    }),
    $("#flash").on("click", function () {
        $(this).addClass("hide");
    });

    $(".character_sheet").on("click",function(){

    $(".character_sheet_modal").openModal();
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
