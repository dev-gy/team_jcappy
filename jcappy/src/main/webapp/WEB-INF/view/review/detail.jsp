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

			<div class="review_detail_wrap">
		        <div class="review_detail_title"><h1 class="cstyle_h1">Review</h1></div>
		        <div class="review_detail_id">회원아이디</div>
		        <div class="review_detail_day">작성일(2021-7-1)</div>
		        <div class="review_detail_product">
		            <div class="review_detail_product_img"><a href=""><img src="/jcappy/img/w1.jpg"></a></div>
		            <a href=""><span class="review_detail_product_name">상품명</span></a>
		            <div class="review_detail_star"><img src="/jcappy/img/star1.png"></div>
		        </div>
		        <div class="review_detail_content">
		            <div class="review_detail_img">
		                <img src="/jcappy/img/r1.jpg">
		                <img src="/jcappy/img/r2.jpg">
		            </div>
		            <div class="review_detail_review_content">상품 잘 받았습니다. 배송도 빨라서 좋았어요</div>
		            
		        </div>
		        <div class="review_detail_list_button">
		            <input type="button" value="목록" id="review_detail_list_btn"> 
		        </div>
		    </div>
		       
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>