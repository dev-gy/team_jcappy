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
			<div class="complete_content">
				<div class="pay">결제완료</div><br>
	        	<p>신용카드로 결제가 완료되었습니다!</p><br>
	        	<div class="cbb">
	            	<input id="cb1" type="button" onclick="location.href='/jcappy/mypage/order/index.do'" value="주문내역">
	            	<input id="cb2" type="button" onclick="location.href='/jcappy/index.do'" value="닫기">
				</div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>