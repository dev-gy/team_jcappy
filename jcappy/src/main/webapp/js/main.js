/*======================================
utility
========================================*/
function checkEmail(str)
{                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}         

function onlyNumber(obj) {
    obj.value = obj.value.replace(/[^0-9]/g, '');
}

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

/*======================================
index
========================================*/
$(function () {
    var swiper = new Swiper(".banner .swiper", {
        centeredSlides: true,
        loop: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: true,
        },
        pagination: {
            el: ".banner .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".banner .swiper-button-next",
            prevEl: ".banner .swiper-button-prev",
        },
    });
});

/*======================================
top
========================================*/
$(function () {
	// 서비스 메뉴에 마우스 이동 시 메뉴 내용 나타남
	// 서비스 메뉴밖으로 마우스 이동 시 메뉴 내용 숨김
    $(".depth1 > li").mouseover(function () {
        $(this).find('.depth2').stop().slideDown(300);
    }).mouseleave(function () {
        $(this).find('.depth2').stop().slideUp(300);
    });

	// 해당 메뉴 내용에 마우스 이동시 회색 배경 및 글씨 색 변경
	// 해당 메뉴 내용 밖으로 마우스 이동시 이전 배경 및 글씨 색으로 복구 
    $(".depth2 > li").mouseover(function() {
        $(this).css("background-color", "#dddddd").css("color", "black");
    }).mouseleave(function () {
        $(this).css("background-color", "white").css("color", "#575757");
    });
});

/*======================================
join
========================================*/
$(function(){ 
	// 가입버튼 비활성화 및 툴팁 창 숨김
	$(".join_content #submit").attr("disabled", "disabled"); 
    $(".join_content #alert-success").hide(); 
    $(".join_content #alert-danger").hide(); 
    
    $("input").keyup(function(){
	    // 키 입력시 비밀번호 일치여부 확인 및 결과툴팁 띄우기
	    // 일치할 시 버튼 활성화, 일치하지 않을 시 버튼 비활성화
        var pwd1=$(".join_content #mpwd").val(); 
        var pwd2=$(".join_content #mpwd_check").val(); 
	    if(pwd1 != "" || pwd2 != ""){ 
	        if(pwd1 == pwd2){ 
	            $(".join_content #alert-success").show(); 
	            $(".join_content #alert-danger").hide(); 
	            $(".join_content #submit").removeAttr("disabled"); 
	        } else{ $(".join_content #alert-success").hide(); 
                $(".join_content #alert-danger").show(); 
                $(".join_content #submit").attr("disabled", "disabled"); 
            } 
        }    
    });
});

/*======================================
policy/servicepolicy
========================================*/
$(function() {
	// 하나의 파라미터만 받기 때문에 url을 / 를 기준으로 나눈 문자열 중 마지막 값이 파라미터
	var param = location.href.split("/");
	param = param[param.length -1];
	// 파라미터값이 policy일 경우 내용 및 service 메뉴 비활성화 후 policy 메뉴 및 내용 활성화 
	if (param == "policy") {
		$(".policy_tab_btn").addClass("tab_on");
	    $(".service_area").hide();
	    $(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
	    });
    // 파라미터값이 policy일 경우 내용 및 policy 메뉴 비활성화 후 service 메뉴 및 내용 활성화
	} else if (param == "service") {
	 	$(".service_tab_btn").addClass("tab_on");
	    $(".policy_area").hide();		
	    $(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
	    });
	}
   
   // service메뉴 클릭시 service파라미터값을 지닌 주소 호출
	$(".service_tab_btn").on("click", function() {
		location.href="/jcappy/policy/servicepolicy/service";
	});
	// policy메뉴 클릭시 policy파라미터값을 지닌 주소 호출
    $(".policy_tab_btn").on("click", function() {
       	location.href="/jcappy/policy/servicepolicy/policy";
	});
});

/*======================================
policy/agreement
========================================*/
$(function(){
	// 모두 동의 체크박스 체크 시 모든 체크박스 체크 및 확인 버튼 활성화
    $('#checkAll').click(function(){
        if($('#checkAll').prop('checked')){
            $('#termsOfService').prop('checked', true);
            $('#privacyPolicy').prop('checked', true);
            $('#continue').attr('disabled', false);
    // 모두 동의 체크박스 체크해제 시 모든 체크박스 체크해제 및 확인 버튼 비활성화
        } else{
            $('#termsOfService').prop('checked', false);
            $('#privacyPolicy').prop('checked', false);
            $('#continue').attr('disabled', true);
        }
    })
    // 이용약관 동의 체크박스 클릭시 약관동의 및 정책 체크박스 체크여부 확인 후 둘 다 체크 되어있을 경우 모두동의 체크박스 체크
    $('#termsOfService').click(function(){
        if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
            $('#checkAll').prop('checked', true);
            $('#continue').attr('disabled', false);
    // 그렇지 않을경우 모두동의 체크박스 체크 해제
        }else {
            $('#checkAll').prop('checked', false);
            $('#continue').attr('disabled', true);
        }
    })
    // 정책 동의 체크박스 클릭시 약관동의 및 정책 체크박스 체크여부 확인 후 둘 다 체크 되어있을 경우 모두동의 체크박스 체크
    $('#privacyPolicy').click(function(){
        if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
            $('#checkAll').prop('checked', true);
            $('#continue').attr('disabled', false);
    // 그렇지 않을경우 모두동의 체크박스 체크 해제
        }else {
            $('#checkAll').prop('checked', false);
            $('#continue').attr('disabled', true); 
        }
    })

});

/*======================================
product/detail
========================================*/
$(function() {
	// 상품 이미지 보기 기능
	$(".item_major_img").css({ "background-image": decodeURI($(".item_minor_img").eq(0).css("background-image")) });
	$(".item_minor_img").on("click", function() {
		$(".item_major_img").css({ "background-image": decodeURI($(this).css("background-image")) });
		console.log(decodeURI($(".item_major_img").css("background-image")));
	});
	
	// 상품 갯수 - + 버튼 기능
	$(".minus_btn").on("click", function() {
		var num = $(".count").val();
		if (num > 1) {
			$(".count").val(Number(num) - 1);			
		}
	});
	$(".plus_btn").on("click", function() {
		var num = $(".count").val();
		if (/*남은 수량 갯수보다 작으면..*/true) {
			$(".count").val(Number(num) + 1);			
		}
	});
	
	// 제품상세, 리뷰 탭 기능
	$(".detail_tab_btn").addClass("tab_on");
	$(".review_area").hide();		
	$(".cstyle_tab").on("click", function() {
		$(".cstyle_tab").removeClass("tab_on");
		$(this).addClass("tab_on");
	});
	
	$(".detail_tab_btn").on("click", function() {
		$(".review_area").hide();
		$(".detail_area").show();
	});
	$(".review_tab_btn").on("click", function() {
		$(".detail_area").hide();
		$(".review_area").show();
	});
});