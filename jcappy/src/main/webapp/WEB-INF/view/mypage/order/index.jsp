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
					<h2>주문내역조회</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<table class="cstyle_table">
						<colgroup>
							<col width="100px">
							<col>
							<col width="120px">
							<col width="100px">
							<col width="100px">
						</colgroup>
						<tr>
							<th>주문번호</th>
							<th>주문상품</th>
							<th>총주문금액</th>
							<th>주문날짜</th>
							<th>배송상태</th>
						</tr>
						<c:forEach var="vo" varStatus="status" items="${list }">
							<tr>
								<td>
									<a href="/jcappy/mypage/order/detail/${vo.ono }">${vo.ono }</a>
								</td>
								<td class="cstyle_text_align_left">
									<a href="/jcappy/mypage/order/detail/${vo.ono }">${vo.oi_pname }</a>
								</td>
								<td class="cstyle_text_align_right"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.total_price }"/>원</td>
								<td><fmt:formatDate value="${vo.odate }" pattern="yyyy-MM-dd"/></td>
								<td>${vo.o_del }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>