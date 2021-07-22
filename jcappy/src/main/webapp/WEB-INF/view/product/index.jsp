<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<div class="menu_content">
				<div class="itemList_thema" onclick="location.href='';"
					style="background-image: url('/jcappy/img/냉장고 대표.jpg');">
					<a href="">냉장고</a>
				</div>
				<div class="cate_menu">
					<div class="cstyle_btn">일반형</div>
					<div class="cstyle_btn">양문형</div>
					<div class="cstyle_btn">업소형</div>
				</div>
			</div>
			<div class="search_content">
				<p class="itemList_count">냉장고 32(총 개수)</p>
				<div class="itemList_search">
					<select name="orderby">
						<option value="popular" selected>인기순</option>
						<option value="2">가격 높은순</option>
						<option value="3">가격 낮은순</option>
					</select>
					<input type="text" placeholder="검색어를 입력해주세요.">
					<button class="cstyle_btn" >검색</button>
				</div>
			</div>
			<div class="product_content">
				<div class="flex">
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지1.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지2.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지3.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지1.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지2.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지3.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지1.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지2.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지3.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지1.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지2.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지3.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지1.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지2.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
					<div class="item">
						<a href="">
							<img src="/jcappy/img/상품 이미지3.jpg">
							<span>삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</span>
							<span>100,000,000,000원</span>
						</a>
					</div>
				</div>
			</div>
			<div class="itemList_pageing">
				페이징 처리<br> 12345
			</div>
		</div>

	<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>