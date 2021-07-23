<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
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
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img1" style="background-image: url('${productVo.pimg1_org }');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img2" style="background-image: url('${productVo.pimg2_org }');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img3" style="background-image: url('${productVo.pimg3_org }');"></span>
								</span>
							</td>
							<td class="item_info_area">
								<div class="top">
									<h1 class="item_name">삼성전자 RF85A9103AP 비스포크 냉장고 875L 21년 신모델 AC21585500</h1>
									<h2 class="item_info_price">${productVo.pprice } 원</h2>
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
											<input class="count" type="text" value="1" oninput="onlyNumber(this);" />
											<a class="plus_btn cstyle_btn" >+</a>
										</span>
									<div class="total_price_area">
										<h2>총 상품 금액</h2>
										<h2 class="total_price">100,000,000원</h2>
									</div>
									<div class="btn_area">
										<button class="add_cart_btn cstyle_btn" onclick="location.href='{계속쇼핑?장바구니이동? 선택지 띄우기.. }'">장바구니</button>
										<button class="buy_btn cstyle_btn" onclick="location.href='/jcappy/pay/index.do'">주문하기</button>
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