<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function setEditor(holder){
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
function goSave() {
	oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();
}
var oEditors;
$(function(){
	oEditors = setEditor("contents"); // id
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
					<h2>공지게시판 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data">
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
											<input type="text" id="title" name="ntitle" class="w100" title="제목을 입력해주세요" value="${vo.ntitle}" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											<textarea id="contents" name="ncontent" title="내용을 입력해주세요" style="width:100%;">${vo.ncontent }</textarea>	
										</td>
									</tr>
									<tr>
			                        	<th scope="row">파일첨부</th>
			                        	<td colspan="10">
			                        		기존파일 : ${vo.nfile_org}
                        					<input type="checkbox" name="isDel" value="1"><br>
			                        		<input type="file" name="file">
			                        	</td>
			                        </tr>
								</tbody>
							</table>
							<input type="hidden" name="nno" value="${vo.nno}">
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:goSave();"><strong>저장</strong></a>
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