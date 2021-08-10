<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
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
			} else if ($('.adds').eq(i).val() == '2') {
				$('#oname').val('${preDelivery.oname}').attr('readonly', 'readonly');
				$('#ophone').val('${preDelivery.ophone}').attr('readonly', 'readonly');
				$('#ozipcode').val('${preDelivery.ozipcode}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddr').val('${preDelivery.oaddr}').removeAttr('onclick', "daumPostcode($('#ozipcode'), $('#oaddr'), $('#oaddrde'));");
				$('#oaddrde').val('${preDelivery.oaddrde}').attr('readonly', 'readonly');
			} else if ($('.adds').eq(i).val() == '3') {
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

$(function(){
	checkAddr();
	clickAddr();
});
</script>
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
			<td colspan="10"><input type="text" id="orequest" name="orequest" class="w100" value="${vo.orequest}" /></td>
		</tr>
	</tbody>
</table>