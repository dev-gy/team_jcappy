/*======================================
utility
========================================*/
function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
  results = regex.exec(location.search);
  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/*======================================
top
========================================*/
$(function () {
    $(".depth1 > li").mouseover(function () {
        $(this).find('.depth2').stop().slideDown(300);
    }).mouseleave(function () {
        $(this).find('.depth2').stop().slideUp(300);
    });

    $(".depth2 > li").mouseover(function() {
        $(this).css("background-color", "#dddddd").css("color", "black");
    }).mouseleave(function () {
        $(this).css("background-color", "white").css("color", "#575757");
    });
});

/*======================================
policy/servicepolicy
========================================*/
$(function() {
	var param = location.href.split("/");
	param = param[param.length -1];
	if (param == "policy") {
		$(".policy_tab_btn").addClass("tab_on");
	    $(".service_area").hide();
	    $(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
	    });
	} else if (param == "service") {
	 	$(".service_tab_btn").addClass("tab_on");
	    $(".policy_area").hide();		
	    $(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
	    });
	}
   
	$(".service_tab_btn").on("click", function() {
		location.href="/jcappy/policy/servicepolicy/service";
	});
    $(".policy_tab_btn").on("click", function() {
       	location.href="/jcappy/policy/servicepolicy/policy";
	});
});

/*======================================
policy/terms
========================================*/
$(function(){
    $('#checkAll').click(function(){
        if($('#checkAll').prop('checked')){
            $('#termsOfService').prop('checked', true);
            $('#privacyPolicy').prop('checked', true);
            $('#continue').attr('disabled', false); 
        } else{
            $('#termsOfService').prop('checked', false);
            $('#privacyPolicy').prop('checked', false);
            $('#continue').attr('disabled', true);
        }
    })
    $('#termsOfService').click(function(){
        if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
            $('#checkAll').prop('checked', true);
            $('#continue').attr('disabled', false);
        }else {
            $('#checkAll').prop('checked', false);
            $('#continue').attr('disabled', true);
        }
    })
    $('#privacyPolicy').click(function(){
        if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
            $('#checkAll').prop('checked', true);
            $('#continue').attr('disabled', false);
        }else {
            $('#checkAll').prop('checked', false);
            $('#continue').attr('disabled', true); 
        }
    })

});