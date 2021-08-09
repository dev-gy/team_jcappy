<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<script>
// 결제금액 출력 : 결제금액 = (각 상품 수량 * 각 상품 가격)을 더한 값 - 쿠폰
function priceForCalc() {
	var totalPrice = 0;
	var couponPrice = $('.couponPrice').val();
	for(var i = 0; i < $('.priceForCalc').length; i++) {
		totalPrice += Number($('.priceForCalc').eq(i).val());
	}
	return totalPrice - couponPrice;
}

// radio버튼 주소값 변경
function checkAddr() {
	$('.adds').each(function(i, v) {
		if ($('.adds').eq(i).prop('checked')) {
//				console.log($('.adds').eq(i).val());
			if ($('.adds').eq(i).val() == '1') {
				$('#oname').val('${vo.oname}').attr('readonly', 'readonly');
				$('#ophone').val('${vo.ophone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${vo.ozipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${vo.oaddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${vo.oaddrde}').attr('readonly', 'readonly');
			} else if ($('.adds').eq(i).val() == '2') {
				$('#oname').val('${members.mname}').attr('readonly', 'readonly');
				$('#ophone').val('${members.mphone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${members.mzipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${members.maddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${members.maddrde}').attr('readonly', 'readonly');
			} else if ($('.adds').eq(i).val() == '3') {
				$('#oname').val('${preDelivery.oname}').attr('readonly', 'readonly');
				$('#ophone').val('${preDelivery.ophone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${preDelivery.ozipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${preDelivery.oaddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${preDelivery.oaddrde}').attr('readonly', 'readonly');
			} else if ($('.adds').eq(i).val() == '4') {
				$('#oname').val('').removeAttr('readonly');
				$('#ophone').val('').removeAttr('readonly');
				$('#ozipcode').val('').attr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('').attr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('').removeAttr('readonly');
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

$(function() {
	
	$('.totalPrice').text(priceForCalc().toLocaleString('ko-KR') + '원');
	checkAddr();
	clickAddr();
	
	$('.add_product').click(function() {
		var html = '';
		
		html += '<tr class="product_row">';
		html += '<td class="first"></td>';
		html += '<td class="title"</td>';
		html += '<td></td>';
		html += '<td><input type="text" name="product_count" size="5" numberOnly></td>';
		html += '<td></td>';
		html += '<td><span><a class="btns delete"><strong>삭제</strong></a></span></td>';
		html += '</tr>';
		
		$('.admin_order_add_product table tbody .for_area').before(html);
		
		$('.delete').click(function() {
			$(this).closest('.product_row').remove();
		});
	});
});

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
														<input type="text" id="aid" name="aid" class="w80"/>
														<span><a class="btns" href="#" onClick="check_create_id_button($('#aid'), '<%=request.getContextPath()%>/admin/auth/isDuplicateId');"><strong>검색</strong></a></span>
													</td>
												</tr>
											</tbody>
										</table>
										<table class="admin_order_add_table2">
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="memail">주문자이메일</label></th>
													<td colspan="10"><input type="text" id="memail" name="memail" class="w100" value="${members.memail }" readonly /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mname">주문자이름</label></th>
													<td colspan="10"><input type="text" id="mname" name="mname" class="w100" value="${members.mname }" readonly /></td>
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
														<label><input type="radio" class="adds" name="adds" value="1" />&nbsp;기본</label>&nbsp;
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
													<td colspan="10"><input type="text" id="orequest" name="orequest" class="w100" value="${vo.orequest}" /></td>
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
														<input type="text" name="couponPrice" class="couponPrice" value="${coupon.cprice}" readonly>	
													</td>
													<td></td>
												</tr>
												<tr>
													<td class="first" colspan="4">결제금액</td>
													<td class="totalPrice"></td>
													<td></td>
												</tr>
											</tbody>
										</table>
										</div>
									<div class="btn">
										<div class="btnLeft">
											<a class="btns" href="#" onClick="location.href='list?reqPage=${param.reqPage}';"><strong>목록</strong></a>
										</div>
										<div class="btnRight">
											<a class="btns" onclick="request_cancel();"><strong>등록</strong></a>
										</div>
									</div>
									<!--//btn-->
								</div>
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
</body>
</html>