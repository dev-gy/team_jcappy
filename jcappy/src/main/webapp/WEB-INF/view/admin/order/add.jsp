<%@page import="jcappy.members.MembersVo"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<script>
$(function (){
	// ===== 쿠폰 =====		
	$("#coupon_dialog").dialog({
		width: 600,	// 가로 300px
		modal: true,	// 모달(뒷페이지 클릭방지) 활성화 true
		autoOpen: false,	// 페이지 로드시 자동 활성화 false
		resizable: false,		// 사이즈 조절 false
		buttons: {			// 계속 쇼핑, 장바구니 이동 버튼 생성 및 함수 구현
			"취소": function() {
				$(this).dialog("close");	// 현재 다이얼로그 닫기
			}
		},
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();	// 다이얼로그의 타이틀바를 클래스로 찾아서 제거 (타이틀바 사용안할 것)
	
	// 스크롤시 다이얼로드 중앙 고정되도록 다이얼로그 옵션의 포지션 센터 위치 재등록
	$(window).scroll(function() {
		$("#coupon_dialog").dialog("option", "position", { my: "center", at: "center", of: window });
	});
	
	// 쿠폰버튼 클릭시 쿠폰목록 다이얼로그 열기
	$(document).on("click", "input[name=couponPrice]", function(){
		$("#coupon_dialog").dialog("open");
	});

	$(document).on("click", ".use_coupon_btn", function(){
		var couponPrice = Number($(this).closest(".coupon_item").find(".cprice").val());	// 쿠폰 할인가격
		var resultPrice = Number($("#result_price").val());	// 최종 결제 금액
		var newResultPrice = Number("${totalAllPrice}") + Number("${deliveryAllPrice}") - couponPrice;			// 새로 갱신된 최종 결제 금액
		
		// 쿠폰 할인 금액 갱신
		$(".coupon_price").val(couponPrice);
		$(".coupon_price_txt").text(couponPrice != 0 ? Number(-couponPrice).toLocaleString("ko-KR")+"원" : "0원");
		
		// 최종 결제 금액 갱신
		$("#result_price").val(newResultPrice);
		$(".result_price_txt").text(newResultPrice.toLocaleString("ko-KR")+"원");
		
		// 적용한 쿠폰 번호 저장
		$("#coupon_no").val($(this).closest(".coupon_item").find(".cno").val());
		
		$("#coupon_dialog").dialog("close");
	})
});

function find_members() {
	
	if($('#find_members').val().trim() == '') {
		alert('회원의 이메일을 입력해주세요.');		
		return;
	} else {
		$.ajax({
			url:'<%=request.getContextPath()%>/admin/order/find_members',
			method: 'POST',
			data: {
				memail: $('#find_members').val(),
			},
			success: function(res) {
				if (res.trim() == 'true') {
					getForAdd();
					getForAddProduct();				
				} else {
					alert('존재하지 않는 회원입니다.');
					return;
				}
			},
		});
	}
}


// 빈칸확인
function empty_check(){
	if ($('#oname').val().trim() == '' ||
			$('#ophone').val().trim() == '' ||
			$('#ozipcode').val().trim() == '' ||
			$('#oaddr').val().trim() == '' ||
			$('#oaddrde').val().trim() == '') {
		alert('배송지정보에 빈값이 존재합니다.')
		return false;
	}
	return true;
}


// 수정 버튼
function admin_order_update() {
	if (empty_check()) {
		
		if (!/^[0-9]{9,11}$/.test($('#ophone').val())) {
			alert('숫자 9~11자리로만 입력해주세요.');
			$('#ophone').focus();
			return false;
		}
		
		if (confirm('수정하시겠습니까?')) {
			$.ajax({
				url: '/jcappy/admin/order/admin_order_update',
				method: 'POST',
				data: $('#frm').serialize(),
				success: function(res) {
					if (res.trim() == 'true') {
						alert('주문정보가 수정되었습니다.');
						location.href="/jcappy/admin/order/list";
					} else {
						alert('오류발생, 주문정보 수정에 실패하였습니다.');
						location.reload();
					}
				},
			});
		}
	}
}

function getForAdd() {
	$.ajax({
		url: "<%=request.getContextPath()%>/admin/order/include_forAdd",
		data: {
		},
		success: function(res) {
			$('#include_forAdd_Area').html(res);	
		}
	});
}

function getForAddProduct() {
	$.ajax({
		url: "<%=request.getContextPath()%>/admin/order/include_forAddProduct",
		data: {
		},
		success: function(res) {
			$('#include_forAddProduct_Area').html(res);	
		}
	});
}
</script>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>주문관리 - [등록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="admin_order_add">
							<form method="post" name="frm" id="frm" action="">
								<input type="hidden" name="mno" value="${vo.mno }">
								<div id="bbs" class="admin_order_add_info">
									<div id="bread">
										<table class="admin_order_add_table1">
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="aid">회원 이메일 검색</label></th>
													<td colspan="10" class="class_for_padding">
														<input type="text" id="find_members" name="find_members" class="w80"/>
														<span><a class="btns" href="#" onClick="find_members();"><strong>검색</strong></a></span>
													</td>
												</tr>
											</tbody>
										</table>
										<div id="include_forAdd_Area"></div>
									</div>
									<!-- //bread -->
								</div>
								<div id="include_forAddProduct_Area"></div>
							</form>
						</div>
						<!-- //bbs -->
						<!-- 내용 : e -->
					</div>
					<!--//con -->
				</div>
				<!--//content -->
			</div>
			<!--//container -->
			<!-- E N D :: containerArea-->
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->
<div id="coupon_dialog">
	<table class="cstyle_table">
		<colgroup>
			<col>
			<col width="200px">
			<col width="80px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">쿠폰이름</th>
				<th class="cstyle_text_align_right" scope="col">할인가격</th>
			</tr>
		</thead>
		<tbody>
			<tr class="coupon_item">
				<td class="cstyle_text_align_right">
					<p>쿠폰 선택 안함</p>
				</td>
				<td>
					<input class="cprice" type="hidden" value="0">
				</td>
				<td class="cstyle_text_align_right">
					<button class="use_coupon_btn cstyle_btn">선택</button>
				</td>
			</tr>
			<c:forEach var="item" items="${cList }" varStatus="index">
				<tr class="coupon_item">
					<td class="cstyle_text_align_right">
						<p class="cname_txt">${item.cname }</p>
						<input class="cname" type="hidden" value="${item.cname }">
					</td>
					<td class="cstyle_text_align_right">
						<fmt:formatNumber value="${item.cprice }"/>원
						<input class="cprice" type="hidden" value="${item.cprice }">
					</td>
					<td class="cstyle_text_align_right">
						<button class="use_coupon_btn cstyle_btn">선택</button>
						<input class="cno" type="text" hidden=""value="${item.cno }">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>