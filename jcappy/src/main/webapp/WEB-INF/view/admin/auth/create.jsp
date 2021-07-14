<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
$(function() {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents", // textarea ID
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
					<h2>관리자 계정 - [생성]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 계정 생성">
								<colgroup>
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">관리자 등급</label></th>
										<td colspan="10">
											<input type="text" id="agrade" name="agrade" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td colspan="10">
											<input type="text" id="aname" name="aname" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">관리자 아이디</label></th>
										<td colspan="10">
											<input type="text" id="aid" name="aid" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호</label></th>
										<td colspan="10">
											<input type="password" id="apwd" name="apwd" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호 확인</label></th>
										<td colspan="10">
											<input type="password" id="apwd" name="apwd" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">접근권한</label></th>
										<td>
											<input type="checkbox" id="title" name="title"/>주문관리	
										</td>
										<td>
											<input type="checkbox" id="title" name="title"/>회원관리	
										</td>
										<td>
											<input type="checkbox" id="title" name="title"/>게시판관리	
										</td>
										<td>
											<input type="checkbox" id="title" name="title"/>부가관리	
										</td>
										<td>
											<input type="checkbox" id="title" name="title"/>매출조회	
										</td>
									</tr>
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href=""><strong>삭제</strong></a>
									<a class="btns" style="cursor:pointer;" href=""><strong>수정</strong></a>
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