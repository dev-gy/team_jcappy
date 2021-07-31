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
					
					$(".name").val("${mVo.mname}");
					$(".phone").val("${mVo.mphone}");
					$(".zipcode").val("${mVo.mzipcode}");
					$(".addr").val("${mVo.maddr}");
					$(".addrde").val("${mVo.maddrde}");
					
					$(".addr_info_area").find("a").off("click");
				} else if (val == 2) {	// 최근배송지일 경우 readonly 추가 및 배송지 최근주문정보 값으로 초기화, 클릭이벤트 제거
					$(this).find("input").attr("readonly", "readonly");
					
					$(".name").val("${mVo.mname}");
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
	     
	     
	});
</script>
    <style>
    .pay_content > .title { margin: 50px; }
    .pay_content > .left { width: 800px; float: left; box-sizing: border-box; }
    .pay_content > .right { width: 400px; float: right; box-sizing: border-box; padding-left: 40px; }
    .pay_content > .left > .pay_list td:nth-child(1) { width: 50px; }
    .pay_content > .left > .pay_list tr td { text-align: right; padding: 0px 10px; }
    .pay_content > .left > .pay_list > tbody > tr > td > .prev_img { width: 50px; height: 50px; background-size: 50px; display: block; }
       
    .pay_content .order_item > td > .prev_img { width: 70px; height: 70px; background-size: 70px 70px; background-repeat: no-repeat; display: inline-block; margin: -20px 10px; }
    .pay_content .order_item > .price_txt { text-align: right; }
    .pay_content .addr_info > .title_area { height: 40px; line-height: 40px; margin: 20px 0px;}
    .pay_content .addr_info > .title_area > .title { float: left; }
    .pay_content .addr_info .addr_select_area { text-align: left; }
    .pay_content .addr_info .addr_select_area > label { margin-right: 20px; cursor: pointer; }
    .pay_content .addr_info .addr_info_area { text-align: left; line-height: 3; }
    .pay_content .addr_info .addr_info_area .name { width: 150px; }
    .pay_content .addr_info .addr_info_area .phone { width: 150px; }
    .pay_content .addr_info .addr_info_area .zipcode { width: 80px; }
    .pay_content .addr_info .addr_info_area .addr { width: 400px; }
    .pay_content .addr_info .addr_info_area .addrde { width: 300px; }
    
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
	        		<div>
			        	<h2>주문상품 정보</h2>
			        	<table class="pay_list cstyle_table">
			        		<thead>
			        		<tr>
			        			<th colspan="2">상품명</th>
			        			<th>수량</th>
			        			<th class="">가격</th>
			        		</tr>
			        		</thead>
			        		<tbody>
			        			<c:forEach var="item" items="${list }" varStatus="index">
				        			<tr class="order_item">
				        				<td><div class="prev_img" style="background-image: url('${item.img}');"></div></td>
				        				<td class="cstyle_text_align_left"><a href="/jcappy/product/detail/${item.pno }" class="name">${item.name}</a></td>
				        				<td>${item.count}</td>
				        				<td class="cstyle_text_align_right"><fmt:formatNumber value="${item.total_price}"/>원</td>
				        			</tr>
			        			</c:forEach>
			        		</tbody>
			        	</table>
		        	</div>
			        <div class="addr_info">
			        	<div class="title_area">
				            <h2 class="title">배송 정보</h2>
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
	       								<input class="name" type="text" value="${mVo.mname }" placeholder="수령인" readonly>
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
			            
			            <div class="couname">쿠폰</div><br>
			            <div class="coupon">
			                <table>
			                    <thead>
			                    </thead>
			                    <tbody>
			                        <tr>
			                        <th>상품 할인</th>
			                        <td>0원</td>
			                        </tr>
			                        <tr>
			                        <th>회원 할인</th>
			                        <td>18000원</td>
			                        </tr>
			                        <tr>
			                        <th>쿠폰 할인</th>
			                        <td><input type="button" value="쿠폰적용" onClick="location.href='/jcappy/pay/coupon.do'"></td>
			                        </tr>
			                        <tr>
			                            <th>할인 합계</th>
			                            <td>18000원</td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
			        </div>
		        </div>
		        <div class="right">
		            <div class="size">
		                <div class="shop2">최종 결제금액</div><br>
		                <span id="cash">상품 가격</span> <span id="cash1">2,600,000원</span><br><br>
		                <span id="cash">배송비</span> <span id="cash1">0원</span><br><br><hr><br>
		                <span id="cash">최종 결제 금액</span> <span id="cash1">2,600,000원</span><br>
		            </div>
		            <div class="size1"><br>
		                <form name="form">
		                    <div class="shop2">결제 방법</div><br><br>
		                        <div class="payment">
		                            <input type=radio name="money" checked>신용카드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                            <input type=radio name="money">계좌이체<br><br><br>
		                            <input type="checkbox" name="agree" onClick="agreeCheck(this.form)"> 구매조건 확인 및 결제 진행에 동의<br><br><br>
		                            <input type="button" name="checkButton" value="결제하기" onClick="location.href='/jcappy/pay/complete.do'" disabled>
		                        </div>
		                    </form> 
		                </div>
		            </div>
		        </div>

        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>