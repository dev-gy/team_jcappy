<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<style>
.qna_edit_content > .qna_title { width: 100%; font-size: 16px; margin: 10px 0px; }
.qna_edit_content > .qna_content { width: 100%; height: 300px; font-size: 16px; margin:10px 0px; }
.qna_edit_content > .btn_wrap { float: right; margin: 10px 0px; }
.qna_edit_content > .btn_wrap > button { width: 100px; height: 40px; margin-left: 20px; }
</style>
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
					<h2>1:1 문의 수정</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="qna_edit_content">
					<!-- 서브메뉴 본문 -->
					<input class="qna_title" type="text" placeholder="제목">
					<textarea class="qna_content" placeholder="내용을 입력해주세요"></textarea>
					<div class="btn_wrap">
						<button class="cstyle_btn" onclick="location.href='/mypage/qna/update'">수정</button>
						<button class="cstyle_btn" onclick="location.href='/mypage/qna/index'">취소</button>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>