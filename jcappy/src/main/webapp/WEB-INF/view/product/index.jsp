<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
$(function () {
    $(document).ready(function () {
        $(".header").load("/jcappy/include/header.html");
        $(".footer").load("/jcappy/include/footer.html");
    });

});
</script>

<style>
/*==========================
main
==========================*/
#container { width: 1200px; height: 100%; margin: 0px auto; text-align: center; }


/*==========================
common
==========================*/
.cstyle_btn { width: 80px; height: 40px; background-color: white; border: 1px solid #221f1f; cursor: pointer; }
.cstyle_btn:hover {color: black; border-color: black; }

.itemList_thema { width: 100%; height: 200px; line-height: 200px; font-size: 50px; }
.itemList_thema > a { display: block; }
.cate_menu { width: 100%; height: 40px; display: table; box-sizing: border-box; border-collapse: collapse; cursor: pointer; }
.cate_menu > div { width: 33.3333%; height: 40px; display: table-cell; vertical-align: middle; }
.search_content { width: 100%; height: 40px; margin-top: 30px; overflow: hidden; padding: 0px 20px; box-sizing: border-box; }
.itemList_count { width:auto; height:100%; left: 0px; display: inline-block; float: left; }
.itemList_search { width:auto; height:100%; right: 0px; display: inline-block; float: right; }
.item_content { width: 100%; height: 100%; overflow: hidden; display: flex; justify-content: space-around; }
.item { width: 300px; height: 450px; position: relative; }
.item > a { display: block; }
.item > a > img { width: 300px; height: 300px; border: 1px solid #a7a7a7; box-sizing: border-box; }
</style>
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
					<input type="text" placeholder="검색어를 입력해주세요.">
					<button>검색</button>
					<select>
						<option value="1" selected>인기순</option>
						<option value="2">가격 높은순</option>
						<option value="3">가격 낮은순</option>
					</select>
				</div>
			</div>
			<div class="item_content">
				<div class="item">
					<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>
				<div class="itemList_size">
					<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
						height="300"><br>
						<P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
						<br>
					<br> 100,000,000,000원</a>
				</div>

			</div>
			<div class="itemList_pageing">
				페이징 처리<br> 12345
			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>