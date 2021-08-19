<%@page import="jcappy.members.MembersVo"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<style>
.productListTable > thead > tr > th {padding-top: 0 !important; padding-bottom: 0 !important;}
.productListTable > tbody > tr > td {padding-top: 0 !important; padding-bottom: 0 !important;}
.sbtn {background: url( "<%=request.getContextPath()%>/img/admin/btn_search.gif" ) no-repeat; cursor: pointer;}
</style>
<script>
$(function(){

	$('#totalPrice_text').text(priceForCalc().toLocaleString('ko-KR') + '원');
	$("#couponPrice_text").val($("#couponPrice").val() != 0 ? Number(-$("#couponPrice").val()).toLocaleString("ko-KR")+"원" : "0원");

	checkAddr();
	clickAddr();
	
	getProductList();
	
// ===== 상품 =====	
	$("#product_dialog").dialog({
		width: 1000,	
		modal: true,	// 모달(뒷페이지 클릭방지) 활성화 true
		autoOpen: false,	// 페이지 로드시 자동 활성화 false
		resizable: false,		// 사이즈 조절 false
		buttons: {
			"취소": function() {
				$(this).dialog("close");	// 현재 다이얼로그 닫기
			}
		},
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();	// 다이얼로그의 타이틀바를 클래스로 찾아서 제거 (타이틀바 사용안할 것)

	// 스크롤시 다이얼로드 중앙 고정되도록 다이얼로그 옵션의 포지션 센터 위치 재등록
	$(window).scroll(function() {
		$("#product_dialog").dialog("option", "position", { my: "center", at: "center", of: window });
	});
	
	// 다이얼로그 열기
	$(document).on("click", ".btns.add_product", function(){
		$("#product_dialog").dialog("open");
	});	
		
	// 상품목록에서 상품 선택
	$(document).on("click", ".selectProduct", function(){
		// 선택한 상품명
		var product_pname = $(this).closest(".product_item").find(".product_name").text();
		// 선택한 상품번호
		var product_pno = $(this).closest(".product_item").find(".product_pno").text();
		// 선택한 상품 재고
		var product_pcount = $(this).closest(".product_item").find(".product_pcount").text();
		// 선택한 상품가격
		var product_pprice = $(this).closest(".product_item").find(".product_pprice").val();
		// 선택한 상품가격 포맷
		var product_pprice_text = Number(product_pprice).toLocaleString("ko-KR")+"원";

		// 품절상품 선택 불가
		if (product_pcount <= 0) {
			alert('선택하신 상품은 품절입니다.');
			return false;
		}		
		
		if (!check_product_name(product_pname)) {
			alert('이미 추가하신 상품입니다.');
			return false;
		}
		
		var html = '';
		html += '<tr class="product_list">';
		html += '<td class="first pNum"></td>';
		html += '<td class="title pname">' + product_pname + '</td>'; // 상품명
		html += '<td class="pprice_text">' + product_pprice_text + '</td>'; // 상품가격 출력
		html += '<td><input type="number" name="pcount" class="pcount" min="1" max="' + product_pcount + '" value="1" style="width: 50px;" onchange="setCountForPrice();"></td>'; // 상품수량
		html += '<td class="totalCountPrice">' + product_pprice_text +'</td>'; // 합계
		html += '<td>';
		html += '<span><a class="btns delete">';
		html += '<strong>삭제</strong>';
		html += '<input type="hidden" name="pno" class="pno" value="' + product_pno + '">';
		html += '<input type="hidden" name="pname" value="' + product_pname + '">';
		html += '<input type="hidden" name="pprice" class="pprice" value="' + product_pprice + '">';
		html += '<input type="hidden" name="priceForCalc" class="priceForCalc" value="' + product_pprice + '">';
		html += '<input type="hidden" name="maxCount" class="maxCount" value="' + product_pcount + '">';
		html += '</a></span></td>';
		html += '</tr>';
		
		// 행 추가
		$('.admin_order_add_product table tbody .for_area').before(html);
		pNumCalc();
		
		// 행 삭제
		$('.delete').click(function() {
			$(this).closest('.product_list').remove();
			pNumCalc();
			
			if (priceForCalc() < Number($("#couponPrice").val())*2) {
				$("#couponPrice").val(0);
				$("#couponPrice_text").val("0원");
				$("#cno").val(0);
			}
			setTotalPrice();
		});
		
		setTotalPrice();
		
		// 다이얼로그 닫기
		$("#product_dialog").dialog("close");
	});
		
	
// ===== 쿠폰 =====		
	$("#coupon_dialog").dialog({
		width: 600,
		modal: true,	// 모달(뒷페이지 클릭방지) 활성화 true
		autoOpen: false,	// 페이지 로드시 자동 활성화 false
		resizable: false,		// 사이즈 조절 false
		buttons: {			
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
	$(document).on("click", "input[name=couponPrice_text]", function(){
		$("#coupon_dialog").dialog("open");
	});

	$(document).on("click", ".use_coupon_btn", function(){
		// 쿠폰 할인 금액 갱신
		var couponPrice = Number($(this).closest(".coupon_item").find(".cprice").val()); // 쿠폰 할인가격
		var totalPrice = Number($("#totalPrice").val());

		if (couponPrice * 2 <= totalPrice) {
			$("#couponPrice").val(couponPrice);
			$("#couponPrice_text").val($("#couponPrice").val() != 0 ? Number(-couponPrice).toLocaleString("ko-KR")+"원" : "0원");
			
			// 최종 결제 금액 갱신
			$("#totalPrice").val(priceForCalc());
			$("#totalPrice_text").text(priceForCalc().toLocaleString("ko-KR")+"원");
			
			// 적용한 쿠폰 번호 저장
			$("#cno").val($(this).closest(".coupon_item").find(".cno").val());
		
			$("#coupon_dialog").dialog("close");
		} else {
			alert('결제금액이 쿠폰의 할인금액의 2배이상 이어야 합니다.');
		}
	})
});

// 이미 추가한 상품인지 체크
function check_product_name(pname) {
	var check = true;
	for(var i = 0; i < $('.product_list').length; i++) {
		var check_pname = $('.pname').eq(i).text();
		if (pname == check_pname) {
			check = false;
			break;
		}
	}
	return check;
}


// 상품 수량변경시, 가격 반영
function setCountForPrice() {
	for(var i = 0; i < $('.product_list').length; i++) {
		var price = $('.pprice').eq(i).val();
		var count = $('.pcount').eq(i).val();

		if (Number(count) > Number($('.maxCount').eq(i).val())) {
			count = $('.maxCount').eq(i).val();
		}
		
		var result = price * count;
		var result_text = Number(result).toLocaleString("ko-KR")+"원"
		$('.priceForCalc').eq(i).val(result);
		$('.totalCountPrice').eq(i).text(result_text);
		setTotalPrice();
	}
}

// 상품 추가시, 상품 번호
function pNumCalc() {
	for(var i = 0; i < $('.pNum').length; i++) {
		$('.pNum').eq(i).text(i + 1);
	}
}

// 상품목록출력, 검색, 페이징, 정렬
function getProductList(reqPage, orderby, direct, stype, tval, cval, sval) {
	$.ajax({
		url: "<%=request.getContextPath()%>/admin/order/productList",
		data: {
			reqPage: reqPage,
			orderby: orderby,
			direct: direct,
			stype: stype,
			tval: tval,
			cval: cval,
			sval: sval
		},
		success: function(res) {
			$('#product_dialog').html(res);	
		}
	});
}

//radio버튼 주소값 변경
function checkAddr() {
	$('.adds').each(function(i, v) {
		if ($('.adds').eq(i).prop('checked')) {
			if ($('.adds').eq(i).val() == '1') {
				$('#oname').val('${find_members.mname}').attr('readonly', 'readonly');
				$('#ophone').val('${find_members.mphone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${find_members.mzipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${find_members.maddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${find_members.maddrde}').attr('readonly', 'readonly');
				$('#orequest').val('');
			} else if ($('.adds').eq(i).val() == '2') {
				$('#oname').val('${preDelivery.oname}').attr('readonly', 'readonly');
				$('#ophone').val('${preDelivery.ophone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${preDelivery.ozipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${preDelivery.oaddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${preDelivery.oaddrde}').attr('readonly', 'readonly');
				$('#orequest').val('${preDelivery.orequest}');
			} else if ($('.adds').eq(i).val() == '3') {
				$('#oname').val('').removeAttr('readonly');
				$('#ophone').val('').removeAttr('readonly');
				$('#ozipcode').val('').attr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('').attr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('').removeAttr('readonly');
				$('#orequest').val('');
			} 
		}
	});
}

// radio버튼 클릭이벤트
function clickAddr() {
	$('.adds').on('click', function() {
		checkAddr();
	})
}

// 주문추가할 회원 검색
function find_members() {
	
	if($('#find_members').val().trim() == '') {
		alert('회원의 이메일을 입력해주세요.');		
		return false;
	} else {
		$('#frm').submit();
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

// 결제금액 계산 : 결제금액 = (각 상품 수량 * 각 상품 가격)을 더한 값 - 쿠폰
function priceForCalc() {
	var totalPrice = 0;
	var couponPrice = $('#couponPrice').val();
	for(var i = 0; i < $('.priceForCalc').length; i++) {
		totalPrice += Number($('.priceForCalc').eq(i).val());
	}
	return totalPrice - couponPrice;
}

// 결제금액 출력, 값 저장
function setTotalPrice() {
	$('#totalPrice').val(priceForCalc());
	$('#totalPrice_text').text(priceForCalc().toLocaleString('ko-KR') + '원');
}

function addOrderByAdmin() {
	if (empty_check()) {
		
		if (!/^[0-9]{9,11}$/.test($('#ophone').val())) {
			alert('숫자 9~11자리로만 입력해주세요.');
			$('#ophone').focus();
			return false;
		}
		
		if ($('.product_list').length == 0) {
			alert('선택한 상품이 없습니다');
			return false;
		}
		
		if (confirm('등록하시겠습니까?')) {
			$.ajax({
				url: '/jcappy/admin/order/admin_order_add',
				method: 'POST',
				data: $('#frm2').serialize(),
				success: function(res) {
					if (res.trim() == 'true') {
						alert('주문이 등록되었습니다.');
						location.href="/jcappy/admin/order/list";
					} else {
						alert('오류발생, 주문등록에 실패하였습니다.');
						location.reload();
					}
				},
			});
		}
	}
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
							<form method="post" name="frm" id="frm" action="find_members">
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
														<input type="text" id="find_members" name="memail" value="${find_members.memail }" class="w80"/>
														<span><a class="btns" href="#" onClick="find_members();"><strong>검색</strong></a></span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</form>
							<c:if test="${!empty find_members }">
								<form method="post" name="frm2" id="frm2" action="">
									<input type="hidden" name="mno" value="${find_members.mno }">
									<div id="bbs" class="admin_order_add_info">
										<div id="bread">
											<table class="admin_order_add_table2">
												<colgroup>
													<col width="30%" />
													<col width="*" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label for="memail">주문자이메일</label></th>
														<td colspan="10"><input type="text" id="memail" name="memail" class="w100" value="${find_members.memail }" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="mname">주문자이름</label></th>
														<td colspan="10"><input type="text" id="mname" name="mname" class="w100" value="${find_members.mname }" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="opay">결제정보</label></th>
														<td colspan="10"><input type="text" id="opay" name="opay" class="w100" value="계좌이체" readonly /></td>
													</tr>
												</tbody>
											</table>
											<table class="admin_order_add_table3">
												<colgroup>
													<col width="30%" />
													<col width="*" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label for="ono">배송지정보</label></th>
														<td colspan="10">
															<label><input type="radio" class="adds" name="adds" value="1" checked="checked" />&nbsp;기본</label>&nbsp;
															<c:if test="${!empty preDelivery.oname }">
																<label><input type="radio" class="adds" name="adds" value="2" />&nbsp;배송</label>&nbsp;
															</c:if>
															<label><input type="radio" class="adds" name="adds" value="3" />&nbsp;직접</label>
														</td>
													</tr>
													<tr>
														<th scope="row"><label for="oname">수령인</label></th>
														<td colspan="10"><input type="text" id="oname" name="oname" class="w100" value="" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="ophone">연락처</label></th>
														<td colspan="10"><input type="text" id="ophone" name="ophone" class="w100" value="" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="ozipcode">우편번호</label></th>
														<td colspan="10"><input type="text" id="ozipcode" name="ozipcode" class="w100" value="" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="oaddr">주소</label></th>
														<td colspan="10"><input type="text" id="oaddr" name="oaddr" class="w100" value="" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="oaddrde">상세주소</label></th>
														<td colspan="10"><input type="text" id="oaddrde" name="oaddrde" class="w100" value="" readonly /></td>
													</tr>
													<tr>
														<th scope="row"><label for="orequest">배송메시지</label></th>
														<td colspan="10"><input type="text" id="orequest" name="orequest" class="w100" value="" /></td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- //bread -->
									</div>
									<div id="bbs" class="admin_order_add_product">
										<div id="blist">
											<div class="btn">
													<div class="btnRight">
														<a class="btns add_product" href="#"><strong>추가</strong></a>
													</div>
											</div>
											<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문상품목록">
												<colgroup>
													<col class="w7" />
													<col width="*" />
													<col class="w20" />
													<col class="w7" />
													<col class="w20" />
													<col class="w7" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="first"><strong>주문상품</strong></th>
														<th scope="col">상품명</th>
														<th scope="col">상품금액</th>
														<th scope="col">상품수량</th>
														<th scope="col">합계</th>
														<th scope="col" class="last"></th>
													</tr>
												</thead>
												<tbody>
													<tr class="for_area">
														<td class="first" colspan="4">할인금액</td>
														<td class="coupon class_for_padding">
															<input type="text" name="couponPrice_text" id="couponPrice_text" value="" readonly>	
															<input type="hidden" name="couponPrice" id="couponPrice" value="0">
															<input type="hidden" name="cno" id="cno" value="0">
														</td>
														<td></td>
													</tr>
													<tr>
														<td class="first" colspan="4">결제금액</td>
														<td id="totalPrice_text">
														</td>
														<td></td>
													</tr>
												</tbody>
											</table>
											<input type="hidden" name="totalPrice" id="totalPrice" value="0">
										</div>
										<div class="btn">
											<div class="btnLeft">
												<a class="btns" href="#" onClick="location.href='list';"><strong>목록</strong></a>
											</div>
											<div class="btnRight">
												<a class="btns" onclick="addOrderByAdmin();"><strong>등록</strong></a>
											</div>
										</div>
										<!--//btn-->
									</div>
								</form>
							</c:if>
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
<div id="product_dialog"></div>
<div id="coupon_dialog">
	<div id="bbs" style="width:550px;">
		<div id="blist" style="width:550px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문상품목록">
				<colgroup>
					<col width="*"/>
					<col class="w20"/>
					<col class="w8"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">쿠폰이름</th>
						<th scope="col">할인가격</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr class="coupon_item">
						<td class="first">
							<p>쿠폰 선택 안함</p>
						</td>
						<td>
							<input class="cprice" type="hidden" value="0">
						</td>
						<td>
							<button class="use_coupon_btn">선택</button>
						</td>
					</tr>
					<c:forEach var="c" items="${find_coupon }" varStatus="index">
						<tr class="coupon_item">
							<td class="first">
								<p class="cname_txt">${c.cname }</p>
								<input class="cname" type="hidden" value="${c.cname }">
							</td>
							<td>
								<fmt:formatNumber value="${c.cprice }"/>원
								<input class="cprice" type="hidden" value="${c.cprice }">
							</td>
							<td>
								<button class="use_coupon_btn">선택</button>
								<input class="cno" type="text" hidden=""value="${c.cno }">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>