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
	// 상품가격 및 총합가격 초기화.
	$("#price").text(Number(${vo.pprice }).toLocaleString("ko-KR")+"원");
	$("#total_price").text(Number(${vo.pprice } * $("#count").val()).toLocaleString("ko-KR")+"원");
	
	// 스크롤시 다이얼로드 중앙 고정되도록 다이얼로그 옵션의 포지션 센터 위치 재등록
	$(window).scroll(function() {
		$("#cart_btn_dialog").dialog("option", "position", { my: "center", at: "center", of: window });
	});
	
	// 다이얼로그 초기화
	$("#cart_btn_dialog").dialog({
		width: 350,	// 가로 300px
		modal: true,	// 모달(뒷페이지 클릭방지) 활성화 true
		autoOpen: false,	// 페이지 로드시 자동 활성화 false
		resizable: false,		// 사이즈 조절 false
		buttons: {			// 계속 쇼핑, 장바구니 이동 버튼 생성 및 함수 구현
			"계속쇼핑": function() {
				$(this).dialog("close");	// 현재 다이얼로그 닫기
			},
			"장바구니": function() {
				location.href="/jcappy/cart.do";
			}
		},
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();	// 다이얼로그의 타이틀바를 클래스로 찾아서 제거 (타이틀바 사용안할 것)
	
});
function cartpoupOpen() {
	$("#cart_btn_dialog").dialog("open");	// 다이얼로그 열기
}

function infoUpdate() {
	// 새로고침 방지를 위해 ajax로 상품 가격, 총합가격 데이터 갱신 및 업데이트
	$.ajax({
		url: "/jcappy/product/detail/calcPrice",
		data: {	
			price: ${vo.pprice },	
			totalPrice: ${vo.pprice } * $("#count").val(),
		},
		type: "GET",
		success: function(res) {
			var data = JSON.parse(res);	// 하나 이상의 데이터이기 때문에 json형식으로 받아와 파싱 후 사용
			$("#price").text(Number(data.price).toLocaleString("ko-KR")+"원");
			$("#total_price").text(Number(data.totalPrice).toLocaleString("ko-KR")+"원");
		},
		error: function(res) {
			console.log("error: " + res);
		},
	});
}



</script>
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
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img1" style="background-image: url('${vo.pimg1_org }');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img2" style="background-image: url('${vo.pimg2_org }');"></span>
									<span class="item_minor_img cstyle_btn cstyle_border_gray" id="minor_img3" style="background-image: url('${vo.pimg3_org }');"></span>
								</span>
							</td>
							<td class="item_info_area">
								<div class="top">
									<h1 class="item_name">${vo.pname }</h1>
									<h2 class="item_info_price" id="price">${vo.pprice }원</h2>
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
										 	<a class="minus_btn cstyle_btn" href="javascript:infoUpdate();">-</a>
											<input class="count" id="count" type="text" value="1" oninput="onlyNumber(this);" />
											<a class="plus_btn cstyle_btn" href="javascript:infoUpdate();">+</a>
										</span>
									<div class="total_price_area">
										<h2>총 상품 금액</h2>
										<h2 class="total_price" id="total_price">${vo.pprice }원</h2>
										<input type="hidden" >
									</div>
									<div class="btn_area">
										<button class="add_cart_btn cstyle_btn" onclick="cartpoupOpen();">장바구니</button>
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
	</div>
	<%@ include file="/WEB-INF/view/include/bottom.jsp"%>		
	<!--  카트 다이얼로그  -->
	<div id="cart_btn_dialog">
		<p class="dialog_context">선택하신 상품을 장바구니에 담았습니다.</p>
	</div>
</body>
</html>