// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_raty.js
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle
//= require jquery.uploadThumbs.js
//= require_tree .

//topに遷移
$(function() {

  $('#top-back').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });

});

//画像のプレビュー表示
$(function() {
    $('form input:file').uploadThumbs({
        position : 0,
        imgbreak : true
    });
});