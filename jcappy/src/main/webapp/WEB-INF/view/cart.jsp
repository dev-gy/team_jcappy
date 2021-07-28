<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<script>
$(function() {
	// count 값이 바뀌면 발생하는 이벤트
	$(".count").on("change", function() {
		// cart 테이블의 최상위 아이템요소
		var elParent = $(this).closest(".cart_item");
		// 호출자 요소
		var elThis = $(this);
		$.ajax({
			url: "/jcappy/cart/countupdate",
			type: "POST",
			data: $(this).closest("form").serialize(),	// form의 input요소의 값을 모두 보냄 (sno, pno, pprice, scount)
			dataType: "json",	// json 타입으로 값을 받아옴
			success: function(res) {
				// 갯수가 성공적으로 갱신되었을 경우
				if (res != "") {
					// 데이터와 ui의 값이 일치하지 않을경우를 위해 데이터값으로 ui를 재갱신
					// 현재 count input에 값 갱신 및 포커싱 끊기
					elThis.val(res.scount).blur();
					// 합가격 갱신 및 금액단위 표시
					elParent.find(".total_price").text((Number(res.pprice) * res.scount).toLocaleString("ko-KR")+"원");
				}
			},
			error: function(res) {
				console.log(res);
			}
		});
	});
	
	// 빼기버튼 클릭시 값이 1 초과일 경우 값-1 및 값변동 트리거 실행
	$(".minus_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");
		var elCount = elParent.find(".count");
		var count = Number(elCount.val());
		var price = Number(elParent.find("[name=pprice]").val());	// hidden으로 넣어둔 가격객체를 찾아 값 저장
		if (count > 1) {
			count -= 1;
			elCount.val(count).trigger("change");
		}
	});
	
	// 빼기버튼 클릭시 값+1 및 값변동 트리거 실행
	$(".plus_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");
		var elCount = elParent.find(".count");
		var count = Number(elCount.val());
		var price = Number(elParent.find("[name=pprice]").val());	// hidden으로 넣어둔 가격객체를 찾아 값 저장
		count += 1;
		elCount.val(count).trigger("change");
	});
	
	$(".delete_btn").on("click", function() {
		var elParent = $(this).closest(".cart_item");
		$.ajax({
			url: "/jcappy/cart/delete",
			type:"POST",
			data: {
				sno: elParent.find("[name=sno]").val(),
			},
			success: function(res) {
				if (res > 0) {
					location.reload();
				}
			},
			error: function(res) {
				console.log("error: cart.jsp");
			}
		});
		
	})
});
</script>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div class="cart_content">
				<div class="title">
					<h1 class="cstyle_h1">장바구니</h1>
				</div>
				<table class="cstyle_table">
	                <colgroup>
	                	<col width="100px">
	                	<col>
	                	<col width="100px">
	                	<col width="100px">
	                	<col width="140px">
	                	<col width="100px">
	                	<col width="100px">
	                </colgroup> 
	                <thead>
	                    <tr>
	                        <th>전체선택</th>
	                        <th>상품명</th> 
	                        <th>판매가</th>
	                        <th>배송비</th>
	                        <th>수량</th>
	                        <th>주문금액</th>
	                        <th>주문관리</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="vo" items="${list }">                		
		                    <tr class="cart_item">
		                        <td><input type="checkbox"></td>
		                        <td>${vo.pname }</td>
		                        <td class="price"><fmt:formatNumber value="${vo.pprice }" />원</td>
		                        <td>무료</td>
		                        <td>
		                        <div class="input_div">
		                        	<form class="num_frm" onsubmit="return false;">
			                            <input class="minus_btn num_btn cstyle_btn" type="button" value="-">
			                            <input class="count" type="text" name="scount" value="${vo.scount }">
			                            <input class="plus_btn num_btn cstyle_btn" type="button" value="+">
			                            <input type="hidden" name="sno" value="${vo.sno }">
			                            <input type="hidden" name="pno" value="${vo.pno }">
			                            <input type="hidden" name="pprice" value="${vo.pprice }">
		                        	</form>
		                        </div>
		                        </td>
		                        <td class="total_price"><fmt:formatNumber value="${vo.pprice * vo.scount }" />원</td>
		                        <td><div class="input_div">
		                            <input class="delete_btn cstyle_btn" type="button" value="삭제">
		                        </div></td>
		                    </tr>
	                	</c:forEach>
	                    <tr>
	                    	<td colspan="7">
	                    		<div class="result_price_info">스토어 주문합계 = {합계금액}</div>
	                    	</td>
	                    </tr>
	                </tbody>
	            </table>
				<div class="bottom_section">
		            <div class="p1">
		                <p>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</p>
		                <p>JCAPPY는 기본적으로 전 상품 무료 배송입니다.</p>
		                <p>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</p>
		                <p>2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</p>
		                <p>장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</p>
		                <p> 결제 시 각종 할인 적용이 달라질 수 있습니다.</p>
		                <p>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</p>
		            </div>
		            <div class="p2">
		                <input class="continue_btn cstyle_btn" id="b1" type="button" value="계속 쇼핑하기">
		                <input class="buy_btn cstyle_btn" id="b2" type="button" onclick="location.href='payment.html';" value="주문하기">
		            </div>
	            </div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>