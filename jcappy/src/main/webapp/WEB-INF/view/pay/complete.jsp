<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>

<style>
.pay {margin: 150px; font-weight: bold; font-size: 32px; text-align: center;}
p {font-size: 16px; text-align: center; height: 100px;}
#cb1 {width: 75px; height: 25px; background-color: gold;}
#cb2 {width: 50px; height: 25px; background-color: gray;}
.cbb {padding-bottom: 100px}
</style>

</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">

			<div class="pay">결제완료</div><br>
        	<p>신용카드로 결제가 완료되었습니다!</p><br>
        	<div class="cbb">
            	<input id="cb1" type="button" onclick="location.href='/jcappy/mypage/order/index.do'" value="주문내역">
            	<input id="cb2" type="button" onclick="location.href='/jcappy/index.do'" value="닫기">
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>