<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<%@ include file="/WEB-INF/view/include/mypage/sidebar.jsp"%>
			<%@ include file="/WEB-INF/view/include/mypage/userinfo.jsp"%>
			<!-- 마이페이지 공통 컨텐츠 -->
			<div class="mypage_content">
				<!-- 마이페이지 공통 서브타이틀 -->
				<div class="mypage_subtitle">
					<h2>주문상세정보</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<!-- 주문상세정보 -->
					<div class="order_detail_content">
						<!-- 주문번호, 주문날짜, 배송상태 -->
						<div>
							<table class="cstyle_table">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<tr>
									<th>주문번호</th>
									<td class="cstyle_text_align_left">${oiVo.ono }</td>
									<th>주문날짜</th>
									<td class="cstyle_text_align_left"><fmt:formatDate value="${oiVo.odate }" pattern="yyyy-MM-dd"/></td>
									<th>배송상태</th>
									<td class="cstyle_text_align_left"><div>${oiVo.o_del }</div></td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 주문상품 -->
						<div>
							<table class="cstyle_table ordertable_button order_list_table">
								<colgroup>
									<col width="350px">
									<col width="100px">
									<col width="130px">
									<col width="130px">
									<col width="100px">
								</colgroup>
								<tr>
									<th>상품</th>
									<th>수량</th>
									<th>상품금액</th>
									<th>합계</th>
									<th></th>
								</tr>
								<c:forEach var="olVo" items="${olList }">
									<tr>
										<td class="cstyle_text_align_left">
											<a href="/jcappy/product/detail/${olVo.pno }">
											<span class="item_image" style="background-image: url('${olVo.pimg1_real }');"></span>
											<span class="item_name">${olVo.ol_pname }</span>
											</a>
										</td>
										<td>
											${olVo.ol_count }
										</td>
										<td class="cstyle_text_align_right">
											<fmt:formatNumber maxFractionDigits="3" type="number" value="${olVo.ol_price }"/>원
										</td>
										<td class="cstyle_text_align_right">
											<fmt:formatNumber maxFractionDigits="3" type="number" value="${olVo.total_price }"/>원
										</td>
										<td>
											<c:if test="${olVo.rno == '' and oiVo.o_del == '배송완료'}">
												<button class="cstyle_btn" onclick="location.href='/jcappy/mypage/review/write/${olVo.ono }/${olVo.pno }'">리뷰작성</button>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 배송지 정보 -->
						<div>
							<div class="mypage_for_subtitle">배송지정보</div>
							<table class="cstyle_table cstyle_text_align_left">
								<colgroup>
									<col width="200px">
									<col width="*">
								</colgroup>
								<tr>
									<td>받는사람</td>
									<td>${oiVo.oname }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${oiVo.ophone }</td>
								</tr>
								<tr>
									<td>받는주소</td>
									<td><p>${oiVo.ozipcode }</p><p>${oiVo.oaddr } ${oiVo.oaddrde }</p></td>
								</tr>
								<tr>
									<td>배송메시지</td>
									<td>${oiVo.orequest }</td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 결제 정보 -->
						<div>
							<div class="mypage_for_subtitle">결제정보</div>
							<table class="cstyle_table cstyle_text_align_left">
								<colgroup>
									<col width="200px">
									<col width="*">
								</colgroup>
								<tr>
									<th>결제수단</th>
									<td><c:if test="${oiVo.opay == 'vbank'}">계좌이체</c:if> <c:if test="${oiVo.opay == 'card'}">카드</c:if></td>
								</tr>
								<tr>
									<th>총 결제금액</th>
									<td><fmt:formatNumber maxFractionDigits="3" type="number" value="${oiVo.result_price }"/>원</td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 취소/교환/반품 요청 -->
						<div class="btn_wrap">
							<button class="cstyle_btn" onclick="location.href='/jcappy/mypage/order/cancelwrite/${oiVo.ono}'">취소/반품 요청</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>