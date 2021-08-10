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
					<h2>쿠폰함</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
					<div>
	                <table class="cstyle_table">
	                    <thead>
	                        <tr>
	                            <th>쿠폰명</th>
	                            <th>할인 금액</th> 
	                            <th>유효기간</th>
	                        </tr>
	                    </thead>
	                    <tbody>
		                    <c:forEach var="vo" items="${list }">
		                        <tr>
		                            <td>${vo.cname }</td>
		                            <td><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.cprice }"/>원</td>
		                            <td><fmt:formatDate value="${vo.cenddate }" pattern="yyyy-MM-dd"/></td>
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