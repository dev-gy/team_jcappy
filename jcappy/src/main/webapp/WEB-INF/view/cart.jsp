<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<script>

	$(function() {
		// 체크박스 체크/해제 되면 최종금액 갱신 및 모두체크박스 갱신
		$(".checkbox").on("click", function() {
			updateResultPrice();
			
			// 현재 체크박스값과 모든 체크박스 값이 같지 않을경우 모두체크박스 체크해제
			var isAll = true;
			var b = $(this).prop("checked");
			var items = $(".checkbox");
			for (var i = 0; i < items.length; i++) {
				if ($(items[i]).prop("checked") != b) {
					isAll = false;
					break;
				}
			}
			// 모든 체크박스 값이 같다면 모두체크박스 체크
			$(".checkbox_all").prop("checked", isAll);
		});
		
		// 체크여부에 따른 합산금액 갱신 및 금액단위 표시
		$(".total_price").on("change", function() {
			$(this).closest(".cart_item").find(".total_price_txt").text(Number($(this).val()).toLocaleString("ko-KR")+"원");
			
			updateResultPrice();
		});
		
		// 최종금액 갱신 함수
		// 체크박스 체크된 목록의 합산금액을 모두 더해 갱신 및 금액단위 표시
		var updateResultPrice = function() {
			var res = 0;
			$.each($(".cart_item"), function(index, item) {
				if ($(item).find(".checkbox").prop("checked")) {
					res += (Number($(item).find(".total_price").val()));
				}
			});
			$(".result_price_txt").text(res.toLocaleString("ko-KR")+"원");
		}
		// 페이지 진입시 최종금액 갱신 (합산금액 코드보다 위로 올리면 순서때문에 갱신안됨..)
		updateResultPrice();
		
		// 모두체크 박스
		// 모두체크박스 체크/해제시 상태가 다른 모든 체크박스 클릭이벤트 발생시켜 동일하게 변경 (클릭이벤트를 발생시켜야 최종금액이 갱신된다)
		$(".checkbox_all").on("click", function() {
			var elThis = $(".checkbox_all");
			$(".checkbox").prop("checked", $(".checkbox_all").prop("checked"));
			
			updateResultPrice();
		});
		
		// 수량 변동 이벤트
		// count 값이 바뀌면 발생하는 이벤트
		$(".count").on("change", function() {
			// cart 테이블의 최상위 아이템요소
			var elParent = $(this).closest(".cart_item");
			// 호출자 요소
			var elThis = $(this);
			$.ajax({
				url: "/jcappy/cart/countupdate",
				type: "POST",
				data: {
					sno: elParent.find(".sno").val(),   
					scount: elParent.find(".count").val(),
					pno: elParent.find(".pno").val(),
					pprice: elParent.find(".price").val(),
				},
				dataType: "json",	// json 타입으로 값을 받아옴
				success: function(res) {
					// 갯수가 성공적으로 갱신되었을 경우
					if (res != "") {
						// 데이터와 ui의 값이 일치하지 않을경우를 위해 데이터값으로 ui를 재갱신
						// 현재 count input에 값 갱신 및 포커싱 끊기
						elThis.val(res.scount).blur();
						// 합산가격 갱신 및 금액단위 표시
						elParent.find(".total_price").val(res.total_price).trigger("change");
					}
				},
				error: function(res) {
					console.log("error: num change");
				}
			});
		});
		
		// 빼기버튼
		// 빼기버튼 클릭시 값이 1 초과일 경우 값-1 및 값변동 트리거 실행
		$(".minus_btn").on("click", function() {
			var elParent = $(this).closest(".cart_item");	// 현재 아이템의 최상위요소
			var elCount = elParent.find(".count");		// 현재 아이템의 수량입력요소
			var count = Number(elCount.val());				// 현재 수량
			var price = Number(elParent.find(".price").val());	// 현재 상품 가격
			if (count > 1) {
				count -= 1;
				elCount.val(count).trigger("change");
			}
		});
		
		// 더하기버튼
		// 더하기버튼 클릭시 값+1 및 값변동 트리거 실행
		$(".plus_btn").on("click", function() {
			var elParent = $(this).closest(".cart_item");	// 현재 아이템의 최상위요소
			var elCount = elParent.find(".count");		// 현재 아이템의 수량입력요소
			var count = Number(elCount.val());				// 현재 수량
			var price = Number(elParent.find(".price").val());	// 현재 상품 가격
			count += 1;
			elCount.val(count).trigger("change");
		});
		
		// 삭제버튼
		// 삭제버튼 클릭 시 sno의 값을 전달해 db에서 삭제 후 새로고침
		$(".delete_btn").on("click", function() {
			var elParent = $(this).closest(".cart_item");
			$.ajax({
				url: "/jcappy/cart/delete",
				type:"POST",
				data: {
					sno: elParent.find(".sno").val(),
				},
				success: function(res) {
					if (res > 0) {
						location.reload();	// 삭제 성공 시 페이지 새로고침
					}
				},
				error: function(res) {
					console.log("error: cart.jsp");
				}
			});
		})
	});
	
	// 서브밋
	// 결제페이지로 서브밋 하기 전 체크해제한 상품의 정보는 disable을 추가해 파라미터값으로 넘어오지 않도록 한다
	var cartSubmit = function() {
		// 각 목록 중 현재 자신이 체크 해제되어있다면 전송 대상 값에 disable 추가 후 서브밋   
		$.each($(".cart_item"), function(index, item) {
			if (!$(item).find(".checkbox").prop("checked")) {
				$(item).find(".pno, .sno, .count, .name, .img, .total_price").attr("disabled", "disabled");
			}
		});
		$("#cart_frm").submit();
	}
</script>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div class="cart_content">
				<div class="title">
					<h1 class="cstyle_h1">장바구니</h1>
				</div>
				<form id="cart_frm" action="/jcappy/pay" method="post">
					<table class="cstyle_table">
		                <colgroup>
		                	<col width="120px">
		                	<col>
		                	<col width="100px">
		                	<col width="100px">
		                	<col width="140px">
		                	<col width="100px">
		                	<col width="100px">
		                </colgroup> 
		                <thead>
		                    <tr>
		                        <th><input class="checkbox_all" type="checkbox" checked> 전체선택</th>
		                        <th>상품명</th> 
		                        <th>판매가</th>
		                        <th>배송비</th>
		                        <th>수량</th>
		                        <th>주문금액</th>
		                        <th>주문관리</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="vo" items="${list }" varStatus="index">
			                    <tr class="cart_item">
			                        <td><input class="checkbox" type="checkbox" name="checkbox" checked></td>
			                        <td class="name_area"><span class="pimg" style="background-image: url('${vo.pimg1_org }')"></span><span>${vo.pname }</span></td>
			                        <td class="price_area"><span class="price_txt"><fmt:formatNumber value="${vo.pprice }" />원</span></td>
			                        <td>무료</td>
			                        <td>
			                        <div class="input_div">
			                            <input class="minus_btn num_btn cstyle_btn" type="button" value="-">
			                            <input class="count" type="text" name="count" value="${vo.scount }" value="1" oninput="onlyNumber(this);" >
			                            <input class="plus_btn num_btn cstyle_btn" type="button" value="+">
			                        </div>
			                        </td>
			                        <td class="total_price_txt"><fmt:formatNumber value="${vo.total_price }" />원</td>
			                        <td>
				                        <div class="input_div">
				                            <input class="delete_btn cstyle_btn" type="button" value="삭제">
				                        </div>
			                            <input class="sno" type="hidden" name="sno" value="${vo.sno }">
			                            <input class="pno" type="hidden" name="pno" value="${vo.pno }">
			                            <input class="name" type="hidden" name="name" value="${vo.pname }">
										<input class="img" type="hidden" name="img" value="${vo.pimg1_org }">
										<input class="delivery_price" type="hidden" name="delivery_price" value="${vo.pdelprice }">
			                            <input class="total_price" type="hidden" name="total_price" value="${vo.total_price }">
			                        </td>
			                    </tr>
		                	</c:forEach>
		                    <tr>
		                    	<td colspan="7">
		                    		<div class="result_price_info">주문합계 = <span class="result_price_txt">{합계금액}</span></div>
		                    	</td>
		                    </tr>
		                </tbody>
		            </table>
					<div class="bottom_section">
			            <div class="p1">
			                <p>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</p>
			                <p>JCAPPY는 기본적으로 전 상품 무료 배송입니다.</p>
			                <p>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</p>
			                <p>2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</p>
			                <p>장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</p>
			                <p> 결제 시 각종 할인 적용이 달라질 수 있습니다.</p>
			                <p>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</p>
			            </div>
			            <div class="p2">
			                <input class="continue_btn cstyle_btn" id="b1" type="button" value="계속 쇼핑하기" onclick="location.href='/jcappy/';">
			                <input class="buy_btn cstyle_btn" id="b2" type="button" onclick="cartSubmit();" value="주문하기">
			            </div>
		            </div>
	            </form>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>