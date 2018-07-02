// This is a manifest file that'll be compiled into application.js, which will include all the
// files listed below.
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
//= require turbolinks

//= require jquery
//= require jquery3
//= require jquery_ujs
//= require bootstrap-sprockets

//= require jquery-fileupload

//= require_tree .

//= require Chart.bundle
//= require chartkick

function toggle_like(obj) {
    like_objects = obj.parentNode.childNodes
    focus = Array();
    like_objects.forEach(function (like_obj){ 
        if (like_obj.nodeType == 1){
            like_obj.childNodes.forEach(function (badge){
                if (badge.nodeType == 1){
                    focus.push([like_obj.getAttribute('name'), badge]);
                }
            });
        }
    });
    focus.forEach(function(badge) {
        if (badge[0] == "like"){
            if (badge[1].className == "badge"){
                badge[1].className = "badge badge-liked";
            }else{
                badge[1].className = "badge";    
            }
        }else{
            if (badge[1].className == "badge"){
                badge[1].className = "badge badge-disliked";
            }else{
                badge[1].className = "badge";      
            }
        }
    });
}