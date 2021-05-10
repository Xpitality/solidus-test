Spree.onRegSubmit = function(e){
    e.preventDefault()
    var emailField = $("#spree_user_email").val();
    var passField = $("#spree_user_password").val();
    var confPassField = $("#spree_user_password_confirmation").val();
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if(!regex.test(emailField)) {
        $("#spree_user_email").addClass("required");
    }else{
        $("#spree_user_email").removeClass("required");
    }

    if (!passField || !confPassField){
        $("#spree_user_password").addClass("required")
        $("#spree_user_password_confirmation").addClass("required")
    }else if (passField<6){
        $("#spree_user_password").addClass("required")
    }else if(passField!=confPassField){
        $("#spree_user_password").removeClass("required")
        $("#spree_user_password_confirmation").removeClass("required")
    }
    $("#new_spree_user").submit()
}

Spree.ready(function($) {
    $("#reg_submit").click(function(e) {
       Spree.onRegSubmit(e)
    });
  });