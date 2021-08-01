<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
function goSave() {
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // submit 할 때, Smarteditor에서 작성한 데이터 전송하기 위한 코드
    $('#frm').submit();
 }
     
 var oEditors;
 $(function(){
    oEditors = setEditor("content"); // textarea 아이디 값
 });
</script>
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
				<div class="mypage_for_line"></div>
				<div class="qna_edit_content">
					<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" >
						<input class="qna_title" type="text" value="{수정할 글 제목}">
						<textarea id="content">{수정할 글 내용}</textarea>
						<div class="btn_wrap">
							<button class="cstyle_btn" onclick="javascript:goSave();">수정</button>
							<button class="cstyle_btn" onclick="location.href='/mypage/qna/index'">취소</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>