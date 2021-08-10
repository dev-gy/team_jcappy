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
					<h2>취소/교환/반품</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="cancel_content">
					<table class="cstyle_table">
						<colgroup>
							<col width="100px">
							<col width="250px">
							<col width="200px">
							<col width="100px">
							<col width="150px">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문상품</th>
								<th>총주문금액</th>
								<th>주문날짜</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>
										<a <c:if test="${vo.oc_cancel == 1 }">href="/jcappy/mypage/order/canceldetail/${vo.ono }"</c:if>>${vo.ono }</a>
										</td>
									<td class="cstyle_text_align_left">
										<a <c:if test="${vo.oc_cancel == 1 }">href="/jcappy/mypage/order/canceldetail/${vo.ono }"</c:if>>${vo.oi_pname }</a>
									</td>
									<td><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.result_price }"/>원</td>
									<td><fmt:formatDate value="${vo.odate }" pattern="yyyy-MM-dd"/></td>
									<td>${vo.o_state }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>