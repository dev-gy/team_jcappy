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
					<h2>취소/교환/반품</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="qna_content">
					<table class="ordercanceltable">
						<colgroup>
							<col width="100px">
							<col width="250px">
							<col width="200px">
							<col width="100px">
							<col width="150px">
						</colgroup>
						<tr class="qna_item">
							<th class="cstyle_th">주문번호</th>
							<th class="cstyle_th">주문상품</th>
							<th class="cstyle_th">총주문금액</th>
							<th class="cstyle_th">주문날짜</th>
							<th class="cstyle_th">처리상태</th>
						</tr>
						<tr class="qna_item">
							<td><a href="mypage_ordercanceldetail.do" ><div>9999</div></a></td>
							<td>냉장고 외1건</td>
							<td>10,000,000원</td>
							<td>2021-05-05</td>
							<td>취소/교환/반품 요청</td>
						</tr>
						<tr class="qna_item">
							<td><a href=""><div>8888</div></a></td>
							<td>세탁기 외2건</td>
							<td>10,000,000원</td>
							<td>2021-05-05</td>
							<td>취소완료</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>