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
	$(".price_txt").text(Number("${vo.pprice }").toLocaleString("ko-KR")+"원");
	$(".total_price_txt").text(Number("${vo.pprice }" * $(".count").val()).toLocaleString("ko-KR")+"원");
	
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
				location.href="/jcappy/cart";
			}
		},
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();	// 다이얼로그의 타이틀바를 클래스로 찾아서 제거 (타이틀바 사용안할 것)
	
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
		
		// 리뷰탭을 클릭 시 리뷰 해당 상품의 리뷰 데이터를 불러와 리뷰페이지를 리뷰영역에 출력
		$.ajax({
			url: "/jcappy/product/detail/review",
			data: {
				pno: "${vo.pno }",
			},
			type: "GET",
			success: function(res) {
				$("#review_area").html(res);
			},
			error: function(res) {
				console.log("error: "+res);
			}
		});
	});
});

// 장바구니에 상품등록
function addCart() {
	if ("${sessionScope.membersInfo.mno }" == "") {
		location.href="/jcappy/login";
	} else {
		$.ajax({
			url: "/jcappy/product/detail/addcart",
			data: {	
				mno: "${sessionScope.membersInfo.mno }",
				pno: "${vo.pno }",
				scount: $("#count").val(),
			},
			type: "POST",
			success: function(res) {
				// 추가완료가 1건 이상일 경우 삼풍등록완료 장바구니 다이얼로그 띄우기
				if (res > 0) {
					$("#cart_btn_dialog").dialog("open");	// 다이얼로그 열기				
				}
			},
			error: function(res) {
				console.log("error: " + res);
			},
		});
	}
	
}

function infoUpdate() {
	// 새로고침 방지를 위해 ajax로 상품 가격, 총합가격 데이터 갱신 및 업데이트
	$.ajax({
		url: "/jcappy/product/detail/calcprice",
		type: "GET",
		data: {	
			price: "${vo.pprice }",
			totalPrice: "${vo.pprice }" * $("#count").val(),
		},
		dataType: "json",
		success: function(res) {
			$(".total_price").val(res.totalPrice);
			$(".price_txt").text(Number(res.price).toLocaleString("ko-KR")+"원");
			$(".total_price_txt").text(Number(res.totalPrice).toLocaleString("ko-KR")+"원");
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
									<h1 class="name_txt">${vo.pname }</h1>
									<h2 class="price_txt" id="price_txt">${vo.pprice }원</h2>
								</div>
								<div class="middle">
									<hr>
										<p class="delivery_type">배송 방법 - 택배</p>
										<p class="delivery_price">배송비 무료</p>
									<hr>
								</div>
								<div class="bottom">
								<form action="/jcappy/pay" method="POST">
									<p>수량 선택</p>
										<span class="item_count_area cstyle_border_black">
										 	<a class="minus_btn cstyle_btn" href="javascript:infoUpdate();">-</a>
											<input class="count" id="count" type="text" name="count" value="1" oninput="onlyNumber(this);" />
											<a class="plus_btn cstyle_btn" href="javascript:infoUpdate();">+</a>
										</span>
									<div class="total_price_area">
										<h2>총 상품 금액</h2>
										<h2 class="total_price_txt" id="total_price_txt">${vo.pprice }원</h2>
									</div>
									<div class="btn_area">
										<button class="add_cart_btn cstyle_btn" type="button" onclick="addCart();">장바구니</button>
										<button class="buy_btn cstyle_btn" type="submit">주문하기</button>
									</div>
									<input class="pno" type="hidden" name="pno" value="${vo.pno }">
									<input class="name" type="hidden" name="name" value="${vo.pname }">
									<input class="img" type="hidden" name="img" value="${vo.pimg1_org }">
									<input class="total_price" type="hidden" name="total_price" value="${vo.pprice }">
									
									
								</form>
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
							<td class="review_area tab_item" id="review_area" colspan="2">
								
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