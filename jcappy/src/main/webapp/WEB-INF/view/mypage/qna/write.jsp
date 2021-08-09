<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
function qna_write_setEditor(holder){ //스마트 에디터
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: holder,
		sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	return oEditors;
}

function goSave() {
    oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // submit 할 때, Smarteditor에서 작성한 데이터 전송하기 위한 코드
    if ($("#title").val().trim() == "") { //title 빈값이면 저장안되게
		 alert("제목을 입력해 주세요");
		 console.log($("#contents").val().trim());
		 $("#title").focus();
		 return false;
	 }
	
	 if ($("#contents").val().trim() == "<p>&nbsp;</p>") { //contents 빈값이면 저장안되게
		 alert("내용을 입력해 주세요");
		 $("#contents").focus();
		 return false;
	 }
    $('#frm').submit();
 }
     
 var oEditors;
 $(function(){
	 oEditors = setEditor("contents"); // textarea 아이디 값
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
					<h2>1:1 문의 작성</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="mypage_for_line"></div>
				<div class="qna_write_content">
					<form method="post" name="frm" id="frm" action="insert" enctype="multipart/form-data" >
					<input type="hidden" name="mno" value="${membersInfo.mno }">
						<input class="qna_title" id="title" name="qtitle" type="text">
						<textarea id="contents" name="qcontent"></textarea>
						<input type="file" name="file">
						<div class="btn_wrap">
							<input class="cstyle_btn" id="button" type="button" value="작성" onclick="goSave();">
							<input class="cstyle_btn" id="button" type="button" value="취소" onclick="location.href='/jcappy/mypage/qna/list'">
						</div>
					</form>
				</div>
				
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>