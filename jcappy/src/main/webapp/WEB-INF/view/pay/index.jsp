<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
	$(function(){
		// 배송지 버튼 클릭시
	     $(".addr_type").on("click", function() {
	    	 var val = $(this).val();
				if (val == 1) {	// 기본배송지일 경우 readonly 추가 및 배송지 정보 회원정보 값으로 초기화, 클릭이벤트 제거
					$(".addr_info_area").find("input").attr("readonly", "readonly");
					
					$(".mname").val("${mVo.mname}");
					$(".phone").val("${mVo.mphone}");
					$(".zipcode").val("${mVo.mzipcode}");
					$(".addr").val("${mVo.maddr}");
					$(".addrde").val("${mVo.maddrde}");
					
					$(".addr_info_area").find("a").off("click");
				} else if (val == 2) {	// 최근배송지일 경우 readonly 추가 및 배송지 최근주문정보 값으로 초기화, 클릭이벤트 제거
					$(this).find("input").attr("readonly", "readonly");
					
					$(".mname").val("${mVo.mname}");
					$(".phone").val("${mVo.mphone}");
					$(".zipcode").val("${oVo.ozipcode}");
					$(".addr").val("${oVo.oaddr}");
					$(".addrde").val("${oVo.oaddrde}");
					
					$(".addr_info_area").find("a").off("click");
				} else if (val == 3) {	// 직접입력일 경우 readonly 제거 및 입력값 초기화, 주소 클릭이벤트에 주소Api오픈 함수 추가
					$(".addr_info_area").find("input").removeAttr("readonly").val("");
				
					$(".addr_info_area").find("a").on("click", function() {
				    	 daumPostcode($(".zipcode"), $(".addr"), $(".addrde"));
					});
				}
	     });
		
		$("#agree_check").on("click", function() {
			if ($(this).prop("checked")) {
		    	$("#pay_btn").removeAttr("disabled");			
			} else {
				$("#pay_btn").attr("disabled", "disabled");
			}
		});
		  
		// 우측 결제 정보 상품가격 값 초기화
		var totalAllPrice = 0;
		$.each($(".total_price"), function() {
			totalAllPrice += Number($(this).val());
		});
		$(".total_all_price").val(totalAllPrice);
	    $(".total_all_price_txt").text(totalAllPrice.toLocaleString("ko-KR")+"원");
	   
		// 우측 결제 정보 배송비 값 초기화
		var deliveryPrice = 0;
		$.each($(".delivery_price"), function() {
			deliveryPrice += Number($(this).val());
		});
		$(".delivery_all_price_txt").val(deliveryPrice);
		$(".delivery_all_price_txt").text(deliveryPrice.toLocaleString("ko-KR")+"원");
		
		// 우측 결제 정보 최종결제금액 값 초기화
		var resultPrice = totalAllPrice + deliveryPrice;
		$(".result_price").val(resultPrice);
		$(".result_price_txt").text(resultPrice.toLocaleString("ko-KR")+"원");
	});
	
	
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	  IMP.init("imp81733705"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	
	function requestPay() {
		  // 주문상품들 이름 합치기
		  var name = "";
		  $each($(".pname"), function() {
			name += ($(this).val() + " ");
		})
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : name,
			amount : 64900,
			buyer_email : "${mVo.memail }",
			buyer_name : "${mVo.mname }",
			buyer_tel : "${mVo.mphone }",
			buyer_addr : "${mVo.maddr }"+"${mVo.addrde }",
			buyer_postcode : "${mVo.mzipcode }"
		}, function(rsp) { // callback
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청
				jQuery.ajax({
					url : "jcappy/pay/complete", // 가맹점 서버
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : {
						imp_uid : rsp.imp_uid,
						merchant_uid : rsp.merchant_uid
					}
				}).done(function(data) {
					// 가맹점 서버 결제 API 성공시 로직
					alert("결제에 성공하였습니다.");
				})
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});
	}
</script>
    <style>
    .pay_content { overflow: hidden; padding-bottom: 50px; }
    .pay_content > .title { margin: 50px; }
    .pay_content > .left { width: 800px; float: left; box-sizing: border-box; }
    .pay_content > .right { width: 400px; float: right; box-sizing: border-box; padding-left: 40px; }
    .pay_content .sub_title_area { height: 40px; line-height: 40px; margin-top: 40px; margin-bottom: 20px; }
    .pay_content > .left .order_item > td > .prev_img { width: 70px; height: 70px; background-size: 70px 70px; background-repeat: no-repeat; display: inline-block; margin: -20px 10px; }
    .pay_content > .left > .addr_info > .sub_title_area > .sub_title { float: left; }
    .pay_content > .left > .addr_info .addr_select_area { text-align: left; }
    .pay_content > .left > .addr_info .addr_select_area > label { margin-right: 20px; cursor: pointer; }
    .pay_content > .left > .addr_info .addr_info_area { text-align: left; line-height: 3; }
    .pay_content > .left > .addr_info .addr_info_area .mname { width: 150px; }
    .pay_content > .left > .addr_info .addr_info_area .phone { width: 150px; }
    .pay_content > .left > .addr_info .addr_info_area .zipcode { width: 80px; }
    .pay_content > .left > .addr_info .addr_info_area .addr { width: 400px; }
    .pay_content > .left > .addr_info .addr_info_area .addrde { width: 300px; }
    .pay_content > .right > .price_info table tr > td:nth-child(1) { text-align: left; line-height: 2; }
    .pay_content > .right > .price_info table tr > td:nth-child(2) { text-align: right; line-height: 2; }
    .pay_content > .right > .pay_type #pay_frm .check_type_area > label { margin-right: 20px; }
    .pay_content > .right > .pay_type #pay_frm #pay_btn { width: 120px; margin-top: 20px; }
    </style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">

			<div class="pay_content">
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
			        			<c:forEach var="item" items="${list }" varStatus="index">
				        			<tr class="order_item">
				        				<td class="cstyle_text_align_left">
				        					<div class="prev_img" style="background-image: url('${item.img}');"></div>
				        					<a class="pname_txt" href="/jcappy/product/detail/${item.pno }">${item.name}</a>
			        					</td>
				        				<td>${item.count}</td>
				        				<td class="cstyle_text_align_right">
				        					<fmt:formatNumber value="${item.total_price}"/>원
				        					<input class="delivery_price" type="hidden" value="${item.pdelprice }">
				        					<input class="pname" type="hidden" value="${item.name}">
				        					<input class="total_price" type="hidden" value="${item.total_price }">
				        				</td>
				        			</tr>
			        			</c:forEach>
			        		</tbody>
			        	</table>
		        	</div>
			        <div class="addr_info">
			        	<div class="sub_title_area">
				            <h2 class="sub_title">배송 정보</h2>
			        	</div>
			        	<table class="cstyle_table">
			        		<thead>
			        			<tr>
			        				<td class="addr_select_area">
			        					<label><input class="addr_type" type="radio" name="addr_type" value="1" checked> 기본배송지</label>
			        					<c:if test=" ${!empty oVo }">
			        						<label><input class="addr_type" type="radio" name="addr_type" value="2" disabled> 최근배송지</label>
		        						</c:if>
			        					<label><input class="addr_type" type="radio" name="addr_type" value="3"> 직접입력</label>
			        				</td>
		        				</tr>
	        				</thead>
	        				<tbody>
	        					<tr>
	        						<td class="addr_info_area">
	       								<input class="mname" type="text" value="${mVo.mname }" placeholder="수령인" readonly>
	       								<input class="phone" type="text" value="${mVo.mphone }" placeholder="연락처" readonly>
	       								<div>
	        								<a href="#;">
		        								<input class="zipcode" type="text" value="${mVo.mzipcode }" placeholder="우편번호" readonly><br>
		        								<input class="addr" type="text" value="${mVo.maddr }" placeholder="주소" readonly><br>
		        								<input class="addrde" type="text" value="${mVo.maddrde }" placeholder="상세주소" readonly>
											</a>
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
			            			</td>
			            			<td>
			            				<p class="total_all_price_txt">-9999999원</p>
			            				<p class="delivery_all_price_txt">0원</p>
			            			</td>
			            		</tr>
			            		<tr>
				            		<td>
						                최종 결제 금액
					                </td>
					                <td> 
					                	<p class="result_price_txt">-999999999원</p>
						            
						                <input type="hidden" class="total_all_price">
						                <input type="hidden" class="delivery_all_price">
						                <input type="hidden" class="result_price">
				            		</td>
			            		</tr>
			            	</tbody>
			            </table>
		            </div>
		            <div class="pay_type"><br>
		              	<div class="sub_title_area">
		                    <h2 class="sub_title">결제 방법</h2>
	                    </div>
		                <form id="pay_frm">
		                    <table class="cstyle_table">
			                    <tbody>
					            	<tr>
					            		<td class="check_type_area">
				                            <label><input type=radio name="type" checked>신용카드</label>
				                            <label><input type=radio name="type">계좌이체</label>
					            		</td>
				            		</tr>
				            		<tr>
					            		<td>
				                            <p><label><input id="agree_check" type="checkbox"> 구매조건 확인 및 결제 진행에 동의</label></p>
				                            <input id="pay_btn" class="cstyle_btn" type="submit" value="결제하기" disabled>
					            		</td>
				            		</tr>
			            		</tbody>
		                    </table>
	                    </form> 				            		
	                </div>
	            </div>
	        </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>