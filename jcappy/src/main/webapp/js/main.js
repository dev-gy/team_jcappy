/*======================================
smarteditor 공통
========================================*/
function setEditor(holder) {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: holder,
		sSkinURI: "/jcappy/smarteditor/SmartEditor2Skin.html",
		htParams: {
			bUseToolbar: true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer: false,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger: false,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload: function() {
				//alert("아싸!");   
			}
		}, //boolean
		fOnAppLoad: function() {
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	return oEditors;
}

/*======================================
daumpost 공통
========================================*/
function daumPostcode(elZipcode, elAddr1, elAddr2) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
                addr += extraAddr;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            elZipcode[0].value = data.zonecode;
            elAddr1[0].value = addr;
            // 커서를 상세주소 필드로 이동한다.
            elAddr2[0].focus();
        }
    }).open();
}

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