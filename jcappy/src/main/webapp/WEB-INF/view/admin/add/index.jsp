<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>부가기능 - [목록]</h2>
				</div>
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<a class="add_ons_a" href="<%=request.getContextPath()%>/admin/add/coupon/list">
								<div class="add_ons_div">
								쿠폰관리
								</div>
							</a>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>			
</body>
</html>