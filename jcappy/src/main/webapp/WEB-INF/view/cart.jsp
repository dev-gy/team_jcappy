<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div class="cart_content">
				<div class="title">
					<h1 class="cstyle_h1">장바구니</h1>
				</div>
				<form id="cart_frm" action="/jcappy/pay" method="post">
					<table class="cstyle_table">
		                <colgroup>
		                	<col width="120px">
		                	<col>
		                	<col width="100px">
		                	<col width="100px">
		                	<col width="140px">
		                	<col width="100px">
		                	<col width="100px">
		                </colgroup> 
		                <thead>
		                    <tr>
		                        <th><input class="checkbox_all" type="checkbox" checked> 전체선택</th>
		                        <th>상품명</th> 
		                        <th>판매가</th>
		                        <th>배송비</th>
		                        <th>수량</th>
		                        <th>주문금액</th>
		                        <th>주문관리</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="vo" items="${list }" varStatus="index">
			                    <tr class="cart_item">
			                        <td><input class="checkbox" type="checkbox" name="checkbox" checked></td>
			                        <td class="name_area"><span class="pimg" style="background-image: url('${vo.pimg1_org }')"></span><span>${vo.pname }</span></td>
			                        <td class="price_area"><span class="price_txt"><fmt:formatNumber value="${vo.pprice }" />원</span></td>
			                        <td>무료</td>
			                        <td>
			                        <div class="input_div">
			                            <input class="minus_btn num_btn cstyle_btn" type="button" value="-">
			                            <input class="count" type="text" name="count" value="${vo.scount }" value="1" oninput="onlyNumber(this);" >
			                            <input class="plus_btn num_btn cstyle_btn" type="button" value="+">
			                        </div>
			                        </td>
			                        <td class="total_price_txt"><fmt:formatNumber value="${vo.total_price }" />원</td>
			                        <td>
				                        <div class="input_div">
				                            <input class="delete_btn cstyle_btn" type="button" value="삭제">
				                        </div>
			                            <input class="sno" type="hidden" name="sno" value="${vo.sno }">
			                            <input class="pno" type="hidden" name="pno" value="${vo.pno }">
			                            <input class="name" type="hidden" name="name" value="${vo.pname }">
										<input class="img" type="hidden" name="img" value="${vo.pimg1_org }">
										<input class="delivery_price" type="hidden" name="delivery_price" value="${vo.pdelprice }">
			                            <input class="total_price" type="hidden" name="total_price" value="${vo.total_price }">
			                        </td>
			                    </tr>
		                	</c:forEach>
		                    <tr>
		                    	<td colspan="7">
		                    		<div class="result_price_info">주문합계 = <span class="result_price_txt">{합계금액}</span></div>
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
			                <input class="continue_btn cstyle_btn" id="b1" type="button" value="계속 쇼핑하기" onclick="location.href='/jcappy/';">
			                <input class="buy_btn cstyle_btn" id="b2" type="button" onclick="cartSubmit();" value="주문하기">
			            </div>
		            </div>
	            </form>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>