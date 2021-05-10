//= require jquery.payment
//= require_self

Spree.onRegSubmit = function(e){
    e.preventDefault()
    var emailField = $("#spree_user_email");
    var passField = $("#spree_user_password");
    var confPassField = $("#spree_user_password_confirmation");
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if(!regex.test(emailField.val())) {
        emailField.addClass("required");
    }else{
        emailField.removeClass("required");
    }

    if (!passField.val() || !confPassField.val()){
        passField.addClass("required")
        confPassField.addClass("required")
    }else if (passField.val()<6){
        passField.addClass("required")
    }else if(passField.val()!==confPassField.val()){
        passField.removeClass("required")
        confPassField.removeClass("required")
    }
    $("#new_spree_user").submit()
}

Spree.ready(function($) {
    $("#reg_submit").click(function(e) {
       Spree.onRegSubmit(e)
    });
  });