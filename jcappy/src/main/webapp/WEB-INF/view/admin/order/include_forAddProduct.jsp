<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {
	$('.add_product').click(function() {
		var html = '';
		
		html += '<tr class="product_row">';
		html += '<td class="first"></td>';
		html += '<td class="title"</td>';
		html += '<td></td>';
		html += '<td><input type="number" name="product_count" min="1" max="99" style="width: 50px;"></td>';
		html += '<td></td>';
		html += '<td><span><a class="btns delete"><strong>삭제</strong></a></span></td>';
		html += '</tr>';
		
		$('.admin_order_add_product table tbody .for_area').before(html);
		
		$('.delete').click(function() {
			$(this).closest('.product_row').remove();
		});
	});
});

//결제금액 출력 : 결제금액 = (각 상품 수량 * 각 상품 가격)을 더한 값 - 쿠폰
function priceForCalc() {
	var totalPrice = 0;
	var couponPrice = $('.couponPrice').val();
	for(var i = 0; i < $('.priceForCalc').length; i++) {
		totalPrice += Number($('.priceForCalc').eq(i).val());
	}
	return totalPrice - couponPrice;
}

$(function() {
	$('.totalPrice').text(priceForCalc().toLocaleString('ko-KR') + '원');
});

</script>
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
			<a class="btns" href="#" onClick="location.href='list';"><strong>목록</strong></a>
		</div>
		<div class="btnRight">
			<a class="btns" onclick="request_cancel();"><strong>등록</strong></a>
		</div>
	</div>
	<!--//btn-->
</div>