<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
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
							<col width="250px">
							<col width="200px">
							<col width="100px">
							<col width="150px">
						</colgroup>
						<tr>
							<th>주문번호</th>
							<th>주문상품</th>
							<th>총주문금액</th>
							<th>주문날짜</th>
							<th>배송상태</th>
						</tr>
						<tr>
							<td><a href="mypage_orderdetail.do"><div>9999</div></a></td>
							<td class="cstyle_text_align_left">냉장고 외1건</td>
							<td>10,000,000원</td>
							<td>2021-05-05</td>
							<td>상품준비중</td>
						</tr>
						<tr>
							<td><a href=""><div>8888</div></a></td>
							<td class="cstyle_text_align_left">세탁기 외2건</td>
							<td>10,000,000원</td>
							<td>2021-05-05</td>
							<td>배송준비중</td>
						</tr>
						<tr>
							<td><a href=""><div>7777</div></a></td>
							<td class="cstyle_text_align_left">에어컨</td>
							<td>1,000,000원</td>
							<td>2021-05-05</td>
							<td>배송완료</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>