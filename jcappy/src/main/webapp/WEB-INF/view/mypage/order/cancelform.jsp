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
					<h2>취소/교환/반품 사유</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					
					<div class="cancel_write_content">
						<form action="" method="POST">
							<div>
								<div>
									<select>
										<option name="cancel_type" value="0" selected>선택해주세요.</option>
										<option name="cancel_type" value="1">취소</option>
										<option name="cancel_type" value="2">교환</option>
										<option name="cancel_type" value="3">반품</option>
									</select>
								</div>
								<div>
									<textarea name="cancel_content" id="content" placeholder="취소/교환/반품을 요청하는 간단한 사유를 작성해주세요."></textarea>
								</div>
							</div>
							<div class="btn_wrap">
								<button class="cstyle_btn" onclick="cancel_back();">작성</button>
								<button class="cstyle_btn" onclick="cancel_submit();">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>