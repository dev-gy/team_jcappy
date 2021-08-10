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
					<h2>취소/교환/반품 사유</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<div class="mypage_for_line"></div>
					<div class="cancel_write_content">
						<form action="/jcappy/mypage/order/update" method="POST">
							<div>
								<div>
									<select name="o_state">
										<option selected hidden="">선택해주세요</option>
										<option value="취소요청">취소</option>
										<option value="교환요청">교환</option>
										<option value="반품요청">반품</option>
									</select>
								</div>
								<div>
									<textarea name="oc_reason" id="content" placeholder="취소/교환/반품을 요청하는 간단한 사유를 작성해주세요."></textarea>
								</div>
							</div>
							<div class="btn_wrap">
								<input class="cstyle_btn" type="submit" value="작성">
								<input class="cstyle_btn" type="button" value="취소" onclick="location.href='/jcappy/mypage/order/detail/${vo.ono }'">
							</div>
							<input type="hidden" name="ono" value="${vo.ono }">
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>