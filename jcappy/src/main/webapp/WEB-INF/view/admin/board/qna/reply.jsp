<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function qna_reply_setEditor(holder){ //스마트 에디터
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
				//alert("아싸!");	
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
function qna_reply_goSave() {
	qna_reply_oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
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
	$("#frm").submit();
}
var qna_reply_oEditors; //스마트 에디터
$(function(){
	qna_reply_oEditors = qna_reply_setEditor("contents"); // id
});
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>공지게시판 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insertReply" enctype="multipart/form-data">
							<input type="hidden" name="mno" value="${membersInfo.mno }">
			                <input type="hidden" name="q_gno" value="${q_gno }">
			                <input type="hidden" name="q_ono" value="${q_ono }">
			                <input type="hidden" name="q_nested" value="${q_nested }">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="qtitle" class="w100" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											<textarea id="contents" name="qcontent" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>
			                        	<th scope="row">파일첨부</th>
			                        	<td colspan="10">
			                        		<input type="file" name="file">
			                        	</td>
			                        </tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="list?<c:if test="${!empty param.reqPage}">reqPage=${param.reqPage}</c:if>&stype=${param.stype}&sval=${param.sval}"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:qna_reply_goSave();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>