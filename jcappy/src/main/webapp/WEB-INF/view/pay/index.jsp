<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
$(function(){
	// ===== 배송지 버튼 클릭 =====
	// 배송지 버튼 클릭시
     $(".addr_type").on("click", function() {
    	 var val = $(this).val();
			if (val == 1) {	// 기본배송지일 경우 readonly 추가 및 배송지 정보 회원정보 값으로 초기화, 클릭이벤트 제거
				$(".addr_info_area").find("input").attr("readonly", "readonly");	// 배송관련 입력란을 읽기전용으로 변경 
				
				$("#oname").val("${mVo.mname}");	// 수령인 이름을 회원 이름으로 초기화
				$("#ophone").val("${mVo.mphone}");	// 수령인 연락처를 회원 연락처로 초기화
				$("#zipcode").val("${mVo.mzipcode}");	// 회원의 주소번호로 초기화
				$("#addr").val("${mVo.maddr}");		// 회원의 주소로 초기화
				$("#addrde").val("${mVo.maddrde}");	// 회원의 상세주소로 초기화
				
				$(".addr_info_area").find("a").off("click");	// 주소찾기 이벤트영역 클릭이벤트 제거
			} else if (val == 2) {	// 최근배송지일 경우 readonly 추가 및 배송지 최근주문정보 값으로 초기화, 클릭이벤트 제거
				$(".addr_info_area").find("input").attr("readonly", "readonly");	// 배송관련 입력란을 읽기전용으로 변경 
				
				$("#oname").val("${oVo.oname}");	// 수령인 이름을 최근배송지의 수령인 이름으로 초기화
				$("#ophone").val("${oVo.ophone}");	// 수령인 연락처를 최근배송지의 수령인 연락처로 초기화
				$("#zipcode").val("${oVo.ozipcode}");	// 최근배송지의 수령인 주소번호로 초기화
				$("#addr").val("${oVo.oaddr}");		// 최근배송지의 수령인 주소로 초기화
				$("#addrde").val("${oVo.oaddrde}");	// 최근배송지의 수령인 상세주소로 초기화
				
				$(".addr_info_area").find("a").off("click");	// 주소찾기 이벤트영역 클릭이벤트 제거
			} else if (val == 3) {	// 직접입력일 경우 readonly 제거 및 입력값 초기화, 주소 클릭이벤트에 주소Api오픈 함수 추가
				$(".addr_info_area").find("input").removeAttr("readonly").val("");	// 배송관련 입력란의 읽기전용 해제 및 값을 빈값으로 초기화
				
				$(".addr_info_area").find("a").on("click", function() {		// 주소찾기 이벤트영역 클릭이벤트 주소찾기 이벤트 추가
			    	 daumPostcode($("#zipcode"), $("#addr"), $("#addrde"));
				});
			}
     });
	
	// ===== 요청사항 =====
	// 요청사항 선택, 직접입력 선택시 input 활성화, 비선택시 비활성화
	$(".request_select").on("change", function() {
		
		if ($(this).val() != 5) {	// 직접입력이 아닐경우
			$("#request").hide();	// 요청사항 입력란 숨김
			$("#request").val($(this).find("option:selected").text());	// 요청사항 값을 선택한 요청사항의 내용으로 변경
		} else {					// 직접입력일 경우
			$("#request").show();	// 요청사항 입력란 나타내기
			$("#request").val("");	// 요청사항 값을 빈값으로 초기화
		}
		
	})
	
	// ===== 구매조건 동의 =====
	// 구매조건 동의 체크시에만 버튼 활성화
	$("#agree_check").on("click", function() {
		if ($(this).prop("checked")) {	// 동의 체크박스가 체크일경우
	    	$("#pay_btn").prop("disabled", false);	// 결제버튼 활성화
		} else {						// 동의 체크박스가 체크가 아닐경우
			$("#pay_btn").prop("disabled", true);	// 결제버튼 비활성화
		}
	});
	
	
	// ===== 쿠폰 =====		
	$("#coupon_dialog").dialog({
		width: 600,	// 가로 300px
		modal: true,	// 모달(뒷페이지 클릭방지) 활성화 true
		autoOpen: false,	// 페이지 로드시 자동 활성화 false
		resizable: false,		// 사이즈 조절 false
		buttons: {			// 계속 쇼핑, 장바구니 이동 버튼 생성 및 함수 구현
			"취소": function() {
				$(this).dialog("close");	// 현재 다이얼로그 닫기
			}
		},
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();	// 다이얼로그의 타이틀바를 클래스로 찾아서 제거 (타이틀바 사용안할 것)
	
	// 스크롤시 다이얼로드 중앙 고정되도록 다이얼로그 옵션의 포지션 센터 위치 재등록
	$(window).scroll(function() {
		$("#coupon_dialog").dialog("option", "position", { my: "center", at: "center", of: window });
	});
	
	// 쿠폰버튼 클릭시 쿠폰목록 다이얼로그 열기
	$("#coupon_btn").on("click", function() {
		$("#coupon_dialog").dialog("open");
	});
	
	
	// ===== 쿠폰 사용 버튼 클릭 이벤트 =====
	$(".use_coupon_btn").on("click", function() {
		var couponPrice = Number($(this).closest(".coupon_item").find(".cprice").val());	// 쿠폰 할인가격
		var resultPrice = Number($("#result_price").val());	// 최종 결제 금액
		var newResultPrice = Number("${totalAllPrice}") + Number("${deliveryAllPrice}") - couponPrice;			// 새로 갱신된 최종 결제 금액
		
		// 쿠폰 할인 금액 갱신
		$(".coupon_price").val(couponPrice);
		$(".coupon_price_txt").text(couponPrice != 0 ? Number(-couponPrice).toLocaleString("ko-KR")+"원" : "0원");
		
		// 최종 결제 금액 갱신
		$("#result_price").val(newResultPrice);
		$(".result_price_txt").text(newResultPrice.toLocaleString("ko-KR")+"원");
		
		// 적용한 쿠폰 번호 저장
		$("#coupon_no").val($(this).closest(".coupon_item").find(".cno").val());
		
		$("#coupon_dialog").dialog("close");
	})
	
	//===== 페이지 값 초기화 ======
	// 우측 결제 정보 상품가격 값 초기화
	$("#total_all_price").val("${totalAllPrice}");
	$(".total_all_price_txt").text(Number("${totalAllPrice}").toLocaleString("ko-KR")+"원");
	
	// 우측 결제 정보 배송비 값 초기화
	$("#delivery_all_price").val("${deliveryAllPrice}");
	$(".delivery_all_price_txt").text(Number("${deliveryAllPrice}").toLocaleString("ko-KR")+"원");
	
	// 우측 결제 정보 최종결제금액 값 초기화
	var resultPrice = Number("${totalAllPrice}") + Number("${deliveryAllPrice}");
	$("#result_price").val(resultPrice);
	$(".result_price_txt").text(resultPrice.toLocaleString("ko-KR")+"원");
	
	// 동의여부 기준으로 결제버튼 상태 초기화
	if ($("#agree_check").prop("checked")) {
		$("#pay_btn").removeAttr("disabled");			
	} else {
		$("#pay_btn").attr("disabled", "disabled");
	}
});

// ===== 결제 API =====
var IMP = window.IMP; // 생략해도 괜찮습니다.
  IMP.init("imp81733705"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.


function requestPay() {
	// 배송정보란에 입력 안한 항목이 있을경우 안내 띄우고 끝내기
	if ($("#mname").val() == "" ||
	$("#phone").val() == "" ||
	$("#zipcode").val() == "" ||
	$("#addr").val() == "" ||
	$("#addrde").val() == "") {
		alert("배송 정보를 모두 입력해주세요.");
		return;
	}
	
	// 주문상품 sno, pno, pcount들 전송을 위해 배열로 담기
	var snoList = [];
	$.each($(".sno"), function(i, v) {
		var val = $(v).val();
		if (val != "") {
			snoList[i] = val;  				
		}
	});
	console.log(snoList);
	
	var pnoList = [];
	$.each($(".pno"), function(i, v) {
		pnoList[i] = $(v).val();
	});
	var pcountList = [];
	$.each($(".pcount"), function(i, v) {
		pcountList[i] = $(v).val();
	});
	
	// 주문상품들 이름 합치기
	var pname = "";
	$.each($(".pname"), function() {
		pname += ($(this).val() + " ");
	})
  	
  	if ($(".pay_type:checked").val() == 1) {	// 카드결제로 체크했을시
  		requestCardPay();
  	} else if ($(".pay_type:checked").val() == 2) {	// 가상계좌로 체크했을시
  		requestVbankPay();
  	}
  	
  	// -- 카드 결제함수 --
  	function requestCardPay() {
	// IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : "merchant_" + new Date().getTime(),
			name : pname,
			amount : $("#result_price").val(),
			buyer_email : "${mVo.memail}",
			buyer_name : $("#oname").val(),
			buyer_tel : $("#ophone").val(),
			buyer_addr : $("#addr").val() + " " + $("#addrde").val(),
			buyer_postcode : $("#zipcode").val(),
		}, function(rsp) { // callback
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청
				$.ajax({
					url : "/jcappy/pay/check", // 가맹점 서버
					type : "POST",
					dataType : "json",
					data : {
						imp_uid : rsp.imp_uid,
					},
					success : function(data) {
						// 가맹점 서버 결제 API 성공시 로직
						// 결제 금액과 검증 금액이 일치여부 확인 일치할경우 결제완료 서버 처리
						if (rsp.paid_amount == data.response.amount) {
							orderinfoSave(rsp.imp_uid);
						} else {
							paymentFail(rsp.imp_uid);	// 데이터 변조 감지로 인한 결제실패
						}
					},
					error : function(res) {
						paymentFail(rsp.imp_uid);	// 데이터 변조여부 확인 실패로 인한 결제실패
					}
				});
			} else {
				paymentFail(rsp.imp_uid);	// 결제 처리 실패로인한 결제실패
			}
		});
	}
  	
	// -- 계좌이체(가정) 결제시 --
	function requestVbankPay() {
		console.log($("#coupon_no").val());
		$.ajax({
			url : "/jcappy/pay/complete",
			type : "POST",
			data : {
				orequest : $("#request").val(),	// 요청사항값
				opay : "vbank",	// 결제방식 계좌이체
				o_state : "결제대기",	// 결제상태 결제대기
				o_del : "상품준비중",	// 배송상태 상품준비중
				mno : "${mVo.mno}",	// 로그인 회원번호
				oname : $("#oname").val(),		// 수령인 이름
				ophone : $("#ophone").val(),	// 수령인 연락처
				ozipcode : $("#zipcode").val(),	// 우편번호
				oaddr : $("#addr").val(),	// 주소
				oaddrde : $("#addrde").val(),	// 상세주소
				cno : $("#coupon_no").val(),	// 사용 쿠폰번호
				imp_uid : "",	// 결제 고유번호
				snoList: snoList,	// 결제한 각 상품 장바구니 번호 리스트 
				pnoList: pnoList,	// 결제한 각 상품 번호 리스트
				pcountList: pcountList,	// 결제한 각 상품 갯수 리스트
			},
			success : function(res) {
				alert("결제신청이 완료되었습니다.");
	        	location.href="/jcappy/mypage/order";
			},
			error : function(res) {
				alert("결제에 실패하였습니다.");
			}
		});
	}
		
	// -- 주문처리 실패시 결제취소 처리 --
	function paymentFail(imp_uid) {
		$.ajax({
			url : "/jcappy/pay/cancel",
			type : "POST",
			data : {
				imp_uid : imp_uid, // 주문번호
			},
			dataType : "json",
			success : function(res) {
			}
		});

		alert("결제에 실패하였습니다.");
	}

	// -- 주문내역 서버에 저장 --
	function orderinfoSave(imp_uid, mno) {
		$.ajax({
			url : "/jcappy/pay/complete",
			type : "POST",
			data : {
				orequest : $("#request").val(),	// 요청사항값
				opay : "card",	// 결제방식 카드
				o_state : "결제완료",	// 결제상태 결제완료
				o_del : "상품준비중",	// 배송상태 상품준비중
				mno : "${mVo.mno}",	// 로그인 회원번호
				oname : $("#oname").val(),		// 수령인 이름
				ophone : $("#ophone").val(),	// 수령인 연락처
				ozipcode : $("#zipcode").val(),	// 우편번호
				oaddr : $("#addr").val(),	// 주소
				oaddrde : $("#addrde").val(),	// 상세주소
				cno : $("#coupon_no").val(),	// 사용 쿠폰번호
				imp_uid : imp_uid,	// 결제 고유번호
				snoList: snoList,	// 결제한 각 상품 장바구니 번호 리스트
				pnoList: pnoList,	// 결제한 각 상품 번호 리스트
				pcountList: pcountList,	// 결제한 각 상품 갯수 리스트
			},
			success : function(res) {
				alert("결제가 완료되었습니다.");
	        	location.href="/jcappy/mypage/order";
			},
			error : function(res) {
				paymentFail(imp_uid);	// 결제데이터 저장 실패
			}
		});
	}
}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div class="pay_content">
            	<form id="pay_frm">
			        <div class="title">
			        	<h1 class="cstyle_h1">결제하기</h1>
		        	</div>
		        	<div class="left">
		        		<div class="pay_list_info">
		        			<div class="sub_title_area">
					        	<h2 class="sub_title">주문 상품 정보</h2>
		        			</div>
				        	<table class="pay_list cstyle_table">
				        		<thead>
				        		<tr>
				        			<th>상품명</th>
				        			<th>수량</th>
				        			<th class="">가격</th>
				        		</tr>
				        		</thead>
				        		<tbody>
				        			<c:forEach var="item" items="${pList }" varStatus="index">
					        			<tr class="order_item">
					        				<td class="cstyle_text_align_left">
					        					<div class="prev_img" style="background-image: url('${item.img}');"></div>
					        					<a class="pname_txt" href="/jcappy/product/detail/${item.pno }">${item.name}</a>
				        					</td>
					        				<td>${item.count}</td>
					        				<td class="cstyle_text_align_right">
					        					<fmt:formatNumber value="${item.total_price}"/>원
					        					<input class="sno" type="hidden" value="${item.sno }">
					        					<input class="pno" type="hidden" value="${item.pno }">
					        					<input class="pcount" type="hidden" value="${item.count}">
					        					<input class="delivery_price" type="hidden" value="${item.delivery_price }">
					        					<input class="pname" type="hidden" value="${item.name}">
					        					<input class="total_price" type="hidden" value="${item.total_price }">
					        				</td>
					        			</tr>
				        			</c:forEach>
				        		</tbody>
				        	</table>
				        	<div class="cstyle_text_align_right">
				        		<input class="cstyle_btn" id="coupon_btn" type="button" value="쿠폰">
				        	</div>
			        	</div>
				        <div class="addr_info">
				        	<div class="sub_title_area">
					            <h2 class="sub_title">배송 정보</h2>
				        	</div>
				        	<table class="cstyle_table">
				        		<thead>
				        			<tr>
				        				<td class="addr_select_area">
				        					<input class="addr_type" id="addr_type1" type="radio" name="addr_type" value="1" checked>
				        					<label for="addr_type1"> 기본배송지</label>
				        					
				        					<c:if test="${!empty oVo }">
				        					<input class="addr_type" id="addr_type2" type="radio" name="addr_type" value="2">
			        						<label for="addr_type2"> 최근배송지</label>
				        					</c:if>
			        						
			        						<input class="addr_type" id="addr_type3" type="radio" name="addr_type" value="3">
				        					<label for="addr_type3"> 직접입력</label>
				        				</td>
			        				</tr>
		        				</thead>
		        				<tbody>
		        					<tr>
		        						<td class="addr_info_area">
		       								<input id="oname" type="text" value="${mVo.mname }" placeholder="수령인" readonly>
		       								<input id="ophone" type="text" value="${mVo.mphone }" placeholder="연락처" oninput="phoneNumber(this)" readonly>
		       								<div>
		        								<a href="javascript:;">
			        								<input id="zipcode" type="text" value="${mVo.mzipcode }" placeholder="우편번호" readonly><br>
			        								<input id="addr" type="text" value="${mVo.maddr }" placeholder="주소" readonly><br>
												</a>
		        								<input id="addrde" type="text" value="${mVo.maddrde }" placeholder="상세주소" readonly>
		       								</div>
		        						</td>
		        					</tr>
		        					<tr>
		        						<td class="cstyle_text_align_left">
		        							<div>
			        							<select class="request_select">
			        								<option value="1" hidden="">요청사항을 선택해 주세요.
			        								<option value="2">배송 전에 미리 연락 바랍니다.
			        								<option value="3">부재시 경비실에 맡겨주세요.
			        								<option value="4">부재시 전화나 문자를 남겨주세요.
			        								<option value="5">직접입력
			        							</select>
		        							</div>
		        							<div>
		        								<input id="request" type="text" placeholder="요청사항을 입력해 주세요" hidden="">
		        							</div>
		        						</td>
		        					</tr>
		        				</tbody>
				        	</table>
				        </div>
			        </div>
			        <div class="right">
			            <div class="price_info">
				            <div class="sub_title_area">
				            	<h2 class="sub_title">최종 결제금액</h2>
				            </div>
				            <table class="cstyle_table">
				            	<tbody>
					            	<tr>
					            		<td>
							                <p>상품금액</p>
							                <p>배송비</p>
							                <p>쿠폰할인</p>
				            			</td>
				            			<td>
				            				<p class="total_all_price_txt">-9999999원</p>
				            				<p class="delivery_all_price_txt">-999999원</p>
				            				<p class="coupon_price_txt">0원</p>
				            			</td>
				            		</tr>
				            		<tr>
					            		<td>
							                최종 결제 금액
						                </td>
						                <td> 
						                	<p class="result_price_txt">-999999999원</p>
							            
							                <input type="hidden" id="coupon_price">
							                <input type="hidden" id="coupon_no" value="0">
							                <input type="hidden" id="result_price">
					            		</td>
				            		</tr>
				            	</tbody>
				            </table>
			            </div>
			            <div class="pay_type"><br>
			              	<div class="sub_title_area">
			                    <h2 class="sub_title">결제 방법</h2>
		                    </div>
		                    <table class="cstyle_table">
			                    <tbody>
					            	<tr>
					            		<td class="check_type_area">
				                            <input class="pay_type" id="pay_type1" type=radio name="type" value="1" checked>
				                            <label for="pay_type1"> 신용카드</label>
				                            
				                            <input class="pay_type" id="pay_type2" type=radio name="type" value="2">
				                            <label for="pay_type2"> 계좌이체</label>
					            		</td>
				            		</tr>
				            		<tr>
					            		<td>
				                            <p><label><input id="agree_check" type="checkbox"> 구매조건 확인 및 결제 진행에 동의</label></p>
				                            <input id="pay_btn" class="cstyle_btn" type="button" value="결제하기" onclick="requestPay('${mVo.mno}', '${mVo.memail}');" disabled>
					            		</td>
				            		</tr>
			            		</tbody>
		                    </table>
		                </div>
		            </div>
	         	</form>
	        </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
    <div id="coupon_dialog">
	         		<table class="cstyle_table">
	         			<colgroup>
	         				<col>
	         				<col width="200px">
	         				<col width="80px">
	         			</colgroup>
		         		<thead>
		         			<tr>
		         				<th scope="col">쿠폰이름</th>
		         				<th class="cstyle_text_align_right" scope="col">할인가격</th>
		         			</tr>
		         		</thead>
	         				<tbody>
	         					<tr class="coupon_item">
			        				<td class="cstyle_text_align_right">
			        					<p>쿠폰 선택 안함</p>
		        					</td>
		        					<td>
		        						<input class="cprice" type="hidden" value="0">
		        					</td>
			        				<td class="cstyle_text_align_right">
			        					<button class="use_coupon_btn cstyle_btn">선택</button>
			        				</td>
			        			</tr>
	         				<c:forEach var="item" items="${cList }" varStatus="index">
			        			<tr class="coupon_item">
			        				<td class="cstyle_text_align_right">
			        					<p class="cname_txt">${item.cname }</p>
			        					<input class="cname" type="hidden" value="${item.cname }">
		        					</td>
			        				<td class="cstyle_text_align_right">
			        					<fmt:formatNumber value="${item.cprice }"/>원
			        					<input class="cprice" type="hidden" value="${item.cprice }">
			        				</td>
			        				<td class="cstyle_text_align_right">
			        					<button class="use_coupon_btn cstyle_btn">선택</button>
			        					<input class="cno" type="hidden" value="${item.cno }">
			        				</td>
			        			</tr>
		        			</c:forEach>
	         			</tbody>
	         		</table>
	         	</div>
</body>
</html>