<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<script>
function priceForCalc() {
	var totalPrice = 0;
	var couponPrice = $('.couponPrice').val();
// 	console.log(couponPrice);
	for(var i = 0; i < $('.priceForCalc').length; i++) {
// 		console.log($('.priceForCalc').eq(i).val());
		totalPrice += Number($('.priceForCalc').eq(i).val());
	}
// 		console.log(totalPrice - couponPrice);
	return totalPrice - couponPrice;
}

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

function clickAddr() {
	$('.adds').on('click', function() {
		checkAddr();
	})
}

$(function() {
	$('.totalPrice').text(priceForCalc().toLocaleString('ko-KR') + '원');
	checkAddr();
	clickAddr();
});
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
						<h2>주문관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="admin_order_detail">
							<form method="post" name="frm" id="frm" action="">
								<input type="hidden" name="mno" value="${vo.mno }">
								<div id="bbs" class="admin_order_detail_info">
									<div id="bread">
										<table>
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="ono">주문번호</label></th>
													<td colspan="10"><input type="text" id="ono" name="ono" class="w100" value="${vo.ono}" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mname">주문자이름</label></th>
													<td colspan="10"><input type="text" id="mname" name="mname" class="w100" value="${members.mname }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="memail">주문자이메일</label></th>
													<td colspan="10"><input type="text" id="memail" name="memail" class="w100" value="${members.memail }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="odate">주문일</label></th>
													<td colspan="10"><input type="text" id="odate" name="odate" class="w100" value="<fmt:formatDate value="${vo.odate }" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="o_state">주문상태</label></th>
													<td colspan="10"><input type="text" id="o_state" name="o_state" class="w100" value="${vo.o_state }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="o_del">배송상태</label></th>
													<td colspan="10"><input type="text" id="o_del" name="o_del" class="w100" value="${vo.o_del }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="opay">결제정보</label></th>
													<td colspan="10"><input type="text" id="opay" name="opay" class="w100" value="${vo.opay }" disabled /></td>
												</tr>
											</tbody>
										</table>
										<table>
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="ono">배송지정보</label></th>
													<td colspan="10">
														<label><input type="radio" class="adds" name="adds" value="1" checked="checked"/>&nbsp;현재</label>&nbsp;
														<c:if test="${empty vo.o_del || vo.o_del == '상품준비중' }">
															<label><input type="radio" class="adds" name="adds" value="2" />&nbsp;기본</label>&nbsp;
															<c:if test="${!empty preDelivery.oname }">
																<label><input type="radio" class="adds" name="adds" value="3" />&nbsp;배송</label>&nbsp;
															</c:if>
															<label><input type="radio" class="adds" name="adds" value="4" />&nbsp;직접</label>
														</c:if>
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
								<div id="bbs" class="admin_order_detail_product">
									<div id="blist">
										<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문상품목록">
											<colgroup>
												<col class="w7" />
												<col width="*" />
												<col class="w20" />
												<col class="w7" />
												<col class="w20" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="first"><strong>주문상품</strong></th>
													<th scope="col">상품명</th>
													<th scope="col">상품금액</th>
													<th scope="col">상품수량</th>
													<th scope="col" class="last">합계</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${pList }" varStatus="status">
													<tr>
														<td class="first">${status.index + 1}</td>
														<td class="title">${p.ol_pname }</td>
														<td><fmt:formatNumber value="${p.ol_price }" pattern="#,###,###원"/></td>
														<td>${p.ol_count }</td>
														<td>
															<fmt:formatNumber value="${p.ol_price * p.ol_count }" pattern="#,###,###원"/>
															<input type="hidden" name="priceForCalc" class="priceForCalc" value="${p.ol_price * p.ol_count }">
														</td>
													</tr>
												</c:forEach>
													<tr>
														<td class="first" colspan="4">할인금액</td>
														<td class="coupon">
															<fmt:formatNumber value="${coupon.cprice }" pattern="-#,###,###원"/>
															<input type="hidden" name="couponPrice" class="couponPrice" value="${coupon.cprice}">	
														</td>
													</tr>
													<tr>
														<td class="first" colspan="4">결제금액</td>
														<td class="totalPrice"></td>
													</tr>
											</tbody>
										</table>
										</div>
										<c:if test="${!empty vo.oc_reason }">
											<div id="bread">
												<table>
													<colgroup>
														<col width="30%" />
														<col width="*" />
													</colgroup>
													<tbody>
														<tr>
															<th scope="row"><label for="oc_reason">취소 / 반품 사유</label></th>
															<td colspan="10" >${vo.oc_reason }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:if>
									<div class="btn">
										<div class="btnLeft">
											<a class="btns" href="#" onClick="location.href='list?reqPage=${param.reqPage}';"><strong>목록</strong></a>
											<c:if test="${(empty vo.o_del || vo.o_del == '상품준비중') && vo.oc_cancel == 0 }">
												<a class="btns" onclick="updateMembers();"><strong>수정</strong></a>
											</c:if>
											<a class="btns" href="#" onClick="history.back();"><strong>입금확인</strong></a>
											<a class="btns" onclick="updateMembers();"><strong>배송처리</strong></a>
										</div>
										<div class="btnRight">
											<c:if test="${vo.oc_cancel == 0 }">
												<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품</strong></a>
											</c:if>
											<c:if test="${vo.oc_cancel == 1 && (vo.o_state == '취소요청' || vo.o_state == '반품요청')}">
												<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품 승인</strong></a>
												<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품 거부</strong></a>
											</c:if>
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