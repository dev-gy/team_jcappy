<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
	$(function() {
		// 상품 이미지 보기 기능
		$(".item_major_img").css({ "background-image": decodeURI($(".item_minor_img").eq(0).css("background-image")) });
		$(".item_minor_img").on("click", function() {
			$(".item_major_img").css({ "background-image": decodeURI($(this).css("background-image")) });
			console.log(decodeURI($(".item_major_img").css("background-image")));
		});
		
		// 상품 갯수 - + 버튼 기능
		$(".minus_btn").on("click", function() {
			var num = $(".count").val();
			if (num > 1) {
				$(".count").val(Number(num) - 1);			
			}
		});
		$(".plus_btn").on("click", function() {
			var num = $(".count").val();
			if (/*남은 수량 갯수보다 작으면..*/true) {
				$(".count").val(Number(num) + 1);			
			}
		});
		
		// 제품상세, 리뷰 탭 기능
		$(".detail_tab_btn").addClass("tab_on");
		$(".review_area").hide();		
		$(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
		});
		
		$(".detail_tab_btn").on("click", function() {
			$(".review_area").hide();
			$(".detail_area").show();
		});
		$(".review_tab_btn").on("click", function() {
			$(".detail_area").hide();
			$(".review_area").show();
		});
	});
	
	
</script>
<style>
.product_detail_content { margin: 30px 0px;  box-sizing: border-box; border-collapse: collapse; }
.product_detail_content > table > tbody > tr td { border: 1px solid black; box-sizing: border-box; border-collapse: collapse; } 
.product_detail_content > table > tbody> button { width: 100%; height: 40px; display: table-cell; }
.item_img_area { width: 50%; height: 650px; padding: 20px; box-sizing: border-box; overflow: hidden; }
.item_img_area > .item_major_img { width: 500px; height: 500px; display: inline-block; background-size: cover; }
.item_img_area > .item_img_list { width: 100%; height: auto; display: flex; overflow: hidden; justify-content: center; }
.item_img_area > .item_img_list > .item_minor_img { width: 100px; height: 100px; margin: 20px 10px 0px 10px; background-size: cover; }
.item_info_area { width: 50%; height: 650px; text-align: left; vertical-align: top; padding: 20px; }
.item_info_area > .top { margin-bottom: 30px; }
.item_info_area > .top > .item_info_price {padding-top: 30px; }
.item_info_area > .middle { margin-bottom: 30px; }
.item_info_area > .middle > hr { margin: 30px 0px; }
.item_info_area > .bottom { line-height: 60px; }
.item_info_area > .bottom > .item_count_area { width: auto; height: auto; display: table; box-sizing: border-box; border-collapse: collapse; }
.item_info_area > .bottom > .item_count_area > * { display: table-cell; margin: 0px; padding: 0px; box-sizing: border-box; }
.item_info_area > .bottom > .item_count_area > .minus_btn { width: 24px; height: 32px; font-size: 20px; line-height: 30px; text-align: center; }
.item_info_area > .bottom > .item_count_area > .count { width: 80px; height: 32px; border: none; text-align: right; padding: 4px 10px; }
.item_info_area > .bottom > .item_count_area > .plus_btn { width: 24px; height: 32px; font-size: 20px; line-height: 30px; text-align: center; }
.item_info_area > .bottom > .total_price_area { display: flex; justify-content: space-between; }
.item_info_area > .bottom > .btn_area { display: flex; justify-content: center; }
.item_info_area > .bottom > .btn_area > button { width: 200px; height: 40px; margin: 30px 10px; }
.product_detail_content > table > tbody > tr > .cstyle_tab { width: 100px; height: 40px; }
.review_area { text-align: left; }
.review_area > ul > li { width:100%; padding: 20px; border-bottom: 1px solid #a7a7a7; display: table; }
.review_area > ul > li > .review_info { width: 200px; display: table-cell; padding: 20px 0px; }
.review_area > ul > li > .review_content { width:auto;  display: table-cell; padding:20px 40px 20px 20px; cursor: pointer; }
.review_area > ul > li > .review_content > .review_context { padding: 10px 0px; overflow: hidden; text-overflow: ellipsis; }
.review_area > ul > li > .review_content > .review_img { width: 70px; height: 70px; margin-right: 10px; background-size: cover; display: inline-block; }
.review_area > ul > li > .review_btn { width: 200px; height: 25px; margin: 40px; }

input[type="number"]:focus { outline:none; }
input[type="number"] { -webkit-appearance: none; -moz-appearance: none; appearance: none; }
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; margin: 0; padding: 0; }
</style>
</head>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<div class="product_detail_content">
				<table>
					<tbody>
						<tr>
							<td class="item_img_area"><!-- style="background-image: url('/jcappy/img/상세 이미지1.jpg');" -->
								<span class="item_major_img cstyle_border_gray" ></span>
								<span class="item_img_list">
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img1" style="background-image: url('/jcappy/img/상세 이미지1.jpg');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img2" style="background-image: url('/jcappy/img/상세 이미지2.jpg');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img3" style="background-image: url('/jcappy/img/상세 이미지3.jpg');"></span>
								</span>
							</td>
							<td class="item_info_area">
								<div class="top">
									<h1 class="item_name">삼성전자 RF85A9103AP 비스포크 냉장고 875L 21년 신모델 AC21585500</h1>
									<h2 class="item_info_price">100,000,000원</h2>
								</div>
								<div class="middle">
									<hr>
									<p class="delivery_type">배송 방법 - 택배</p>
									<p class="delivery_price">배송비 무료</p>
									<hr>
								</div>
								<div class="bottom">
									<p>수량 선택</p>
										<span class="item_count_area cstyle_border_black">
										 	<a class="minus_btn cstyle_btn" >-</a>
											<input class="count" type="number" value="1">
											<a class="plus_btn cstyle_btn" >+</a>
										</span>
									<div class="total_price_area">
										<h2>총 상품 금액</h2>
										<h2 class="total_price">100,000,000원</h2>
									</div>
									<div class="btn_area">
										<button class="add_cart_btn cstyle_btn" onclick="location.href='{계속쇼핑?장바구니이동? 선택지 띄우기.. }'">장바구니</button>
										<button class="buy_btn cstyle_btn" onclick="location.href='/jcappy/pay?{상품번호}'">주문하기</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="detail_tab_btn cstyle_tab">제품 상세</td>
							<td class="review_tab_btn cstyle_tab">리뷰</td>
						</tr>
						<tr>
							<td class="detail_area tab_item" colspan="2">
								
								<img class="itemInfo_info_img" src="/jcappy/img/상세 설명 이미지1.jpg">
							</td>
							<td class="review_area tab_item" colspan="2">
								<ul>
									<li>
										<button class="review_btn cstyle_btn" onclick="location.href='/jcappy/review/write?{상품번호}'">리뷰 작성</button>
									</li>
									<li>
										<div class="review_content">
											<div class="review_score">별점 *****</div>
											<div class="review_context">
												빠른 배송과 포장 과정 영상 링크에 만족했습니다.정품 이라는것이 큰 장점인거 같아요.선물용으로 좋습니다.
											</div>
											<div class="review_img" style="background-image: url('/jcappy/img/리뷰 이미지.jpg');"></div>
											<div class="review_img" style="background-image: url('/jcappy/img/리뷰 이미지.jpg');"></div>
										</div>
										<div class="review_info">
											<div>작성자 {아이디 }</div>
											<div>작성일 2013-04-25 13:07:32</div>
										</div>
									</li>
									<li>
										<div class="review_content">
											<div class="review_score">별점 *****</div>
											<div class="review_context">
												첨엔 꽂을 때 잘 안들어가고 귀가 너무 아팠는데 약간 꺾어서 넣어주니까 잘 들어가더라구요.
												쓰다보면 터득하는 노하우랄까.. 가끔씩 끊기는데 (어쩔땐 너무하다 싶을 때도 있고. 이동중 아닐 땐 안끊겨요)
											</div>
											<div class="review_img" style="background-image: url('/jcappy/img/리뷰 이미지.jpg');"></div>
										</div>
										<div class="review_info">
											<div>작성자 {아이디 }</div>
											<div>작성일 2013-04-25 13:07:32</div>
										</div>
									</li>
									<li>
										<div class="review_content">
											<div class="review_score">별점 *****</div>
											<div class="review_context">
												모양도 이쁘고 사용도 편합니다
											</div>
										</div>
										<div class="review_info">
											<div>작성자 {아이디 }</div>
											<div>작성일 2013-04-25 13:07:32</div>
										</div>
									</li>
									<li>
										<div class="review_content">
											<div class="review_score">별점 *****</div>
											<div class="review_context">
												음질 좋습니다~~~
											</div>
											<div class="review_img" style="background-image: url('/jcappy/img/리뷰 이미지.jpg');"></div>
											<div class="review_img" style="background-image: url('/jcappy/img/리뷰 이미지.jpg');"></div>
										</div>
										<div class="review_info">
											<div>작성자 {아이디 }</div>
											<div>작성일 2013-04-25 13:07:32</div>
										</div>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>