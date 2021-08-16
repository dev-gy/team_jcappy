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

function onlyNumber(el) {
    el.value = el.value.replace(/[^0-9]/g, '');
}

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function phoneNumber(el) {
	onlyNumber(el);
	
	var num = el.value;
	if (num.length < 9) {
		num.substring(0, 9);
	} else if (num.length > 11) {
		num.substring(0, 11);
	}
	el.value = num;
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
mypage/review/write
========================================*/
$(function() {
	$(".rstar_area").on("click", function() {
		$("#rstar").val($(this).index()+1);
		$(".review_score").text($("#rstar").val());
		$(".review_score").generateStars();
	});
});

/*======================================
cart
========================================*/
$(function() {
	// 진입시 장바구니에 상품이 없으면 모두체크박스 체크해제
	if ($(".cart_item").length == 0) {
		$(".checkbox_all").prop("checked", false);
	}
	
	// 체크박스 체크/해제 되면 최종금액 갱신 및 모두체크박스 갱신
	$(".checkbox").on("click", function() {
		updateResultPrice();
		
		// 현재 체크박스값과 모든 체크박스 값이 같지 않을경우 모두체크박스 체크해제
		var isAll = true;
		var isAll = $(this).prop("checked");
		var items = $(".checkbox");
		for (var i = 0; i < items.length; i++) {
			if ($(items[i]).prop("checked") != isAll) {
				isAll = false;
				break;
			}
		}
		// 모든 체크박스 값이 같다면 모두체크박스 체크
		$(".checkbox_all").prop("checked", isAll);
	});
	
	// 체크여부에 따른 합산금액 갱신 및 금액단위 표시
	$(".total_price").on("change", function() {
		$(this).closest(".cart_item").find(".total_price_txt").text(Number($(this).val()).toLocaleString("ko-KR")+"원");
		
		updateResultPrice();
	});
	
	// 최종금액 갱신 함수
	// 체크박스 체크된 목록의 합산금액을 모두 더해 갱신 및 금액단위 표시
	var updateResultPrice = function() {
		var res = 0;
		$.each($(".cart_item"), function(index, item) {
			if ($(item).find(".checkbox").prop("checked")) {
				res += (Number($(item).find(".total_price").val()));
			}
		});
		$(".result_price_txt").text(res.toLocaleString("ko-KR")+"원");
	}
	// 페이지 진입시 최종금액 갱신 (합산금액 코드보다 위로 올리면 순서때문에 갱신안됨..)
	updateResultPrice();
	
	// 모두체크 박스
	// 모두체크박스 체크/해제시 상태가 다른 모든 체크박스 클릭이벤트 발생시켜 동일하게 변경 (클릭이벤트를 발생시켜야 최종금액이 갱신된다)
	$(".checkbox_all").on("click", function() {
		var elThis = $(".checkbox_all");
		$(".checkbox").prop("checked", $(".checkbox_all").prop("checked"));
		
		updateResultPrice();
	});
	
	// 수량 변동 이벤트
	// count 값이 바뀌면 발생하는 이벤트
	$(".count").on("change", function() {
		// cart 테이블의 최상위 아이템요소
		var elParent = $(this).closest(".cart_item");
		// 호출자 요소
		var elThis = $(this);
		$.ajax({
			url: "/jcappy/cart/countupdate",
			type: "POST",
			data: {
				sno: elParent.find(".sno").val(),   
				scount: elParent.find(".count").val(),
				pno: elParent.find(".pno").val(),
				pprice: elParent.find(".price").val(),
			},
			dataType: "json",	// json 타입으로 값을 받아옴
			success: function(res) {
				// 갯수가 성공적으로 갱신되었을 경우
				if (res != "") {
					// 데이터와 ui의 값이 일치하지 않을경우를 위해 데이터값으로 ui를 재갱신
					// 현재 count input에 값 갱신 및 포커싱 끊기
					elThis.val(res.scount).blur();
					// 합산가격 갱신 및 금액단위 표시
					elParent.find(".total_price").val(res.total_price).trigger("change");
				}
			},
			error: function(res) {
				console.log("error: num change");
			}
		});
	});
	
	// 빼기버튼
	// 빼기버튼 클릭시 값이 1 초과일 경우 값-1 및 값변동 트리거 실행
	$(".minus_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");	// 현재 아이템의 최상위요소
		var elCount = elParent.find(".count");		// 현재 아이템의 수량입력요소
		var count = Number(elCount.val());				// 현재 수량
		var price = Number(elParent.find(".price").val());	// 현재 상품 가격
		if (count > 1) {
			count -= 1;
			elCount.val(count).trigger("change");
		}
	});
	
	// 더하기버튼
	// 더하기버튼 클릭시 값+1 및 값변동 트리거 실행
	$(".plus_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");	// 현재 아이템의 최상위요소
		var elCount = elParent.find(".count");		// 현재 아이템의 수량입력요소
		var count = Number(elCount.val());				// 현재 수량
		var price = Number(elParent.find(".price").val());	// 현재 상품 가격
		count += 1;
		elCount.val(count).trigger("change");
	});
	
	// 삭제버튼
	// 삭제버튼 클릭 시 sno의 값을 전달해 db에서 삭제 후 새로고침
	$(".delete_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");
		$.ajax({
			url: "/jcappy/cart/delete",
			type:"POST",
			data: {
				sno: elParent.find(".sno").val(),
			},
			success: function(res) {
				if (res > 0) {
					location.reload();	// 삭제 성공 시 페이지 새로고침
				}
			},
			error: function(res) {
				console.log("error: cart.jsp");
			}
		});
	})
});

// 서브밋
// 결제페이지로 서브밋 하기 전 체크해제한 상품의 정보는 disable을 추가해 파라미터값으로 넘어오지 않도록 한다
var cartSubmit = function() {
	// 각 목록 중 현재 자신이 체크 해제되어있다면 전송 대상 값에 disable 추가 후 서브밋   
	var buyCount = 0;
	$.each($(".cart_item"), function(index, item) {
		if (!$(item).find(".checkbox").prop("checked")) {
			$(item).find(".pno, .sno, .count, .name, .img, .total_price").attr("disabled", "disabled");
		} else {
			buyCount += 1;
		}
	});
	if (buyCount == 0) {
		alert("구매 대상이 선택되지 않았습니다.");
		return false;
	}
	
	$("#cart_frm").submit();
}

