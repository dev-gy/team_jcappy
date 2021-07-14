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
					<h2>회원관리 - [상세보기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회원정보 상세보기">
								<colgroup>
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">회원 번호</label></th>
										<td colspan="10">
											<input type="text" id="mno" name="mno" class="w100" value="예시"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원 등급</label></th>
										<td colspan="10">
											<input type="text" id="mgrade" name="mgrade" class="w100" value="예시"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원 이메일</label></th>
										<td colspan="10">
											<input type="text" id="memail" name="memail" class="w100" value="예시"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호</label></th>
										<td colspan="10">
											<input type="password" id="mpwd" name="mpwd" class="w100" value="예시"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호 확인</label></th>
										<td colspan="10">
											<input type="password" id="mpwd" name="mpwd" class="w100" value="예시"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원 이름</label></th>
										<td colspan="10">
											<input type="text" id="mname" name="mname" class="w100" value="예시"/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">연락처</label></th>
										<td colspan="10">
											<input type="text" id="mphone" name="mphone" class="w100" value="예시"/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">주소</label></th>
										<td colspan="10">
											<input type="text" id="maddr" name="maddr" class="w100" value="예시"/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">가입날짜</label></th>
										<td colspan="10">
											<input type="text" id="mregdate" name="mregdate" class="w100" value="예시"/>	
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
				<!-- 주문목록 -->
				<div class="con">
					<div id="bbs">
						<div id="blist">
						<h2>주문 목록</h2>
							<p><span><strong>총 x개</strong>  |  1/x페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문 목록">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">주문일</th>
										<th scope="col">주문 번호</th> 
										<th scope="col">주문 총액</th> 
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2021-07-10</td>
										<td><a href="">1234</a></td>
										<td>100,000</td>
									</tr>
									<tr>
										<td>2021-07-10</td>
										<td><a href="">1234</a></td>
										<td>100,000</td>
									</tr>
									<tr>
										<td>2021-07-10</td>
										<td><a href="">1234</a></td>
										<td>100,000</td>
									</tr>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							<div class='page'>
								<strong>1</strong>
								<a href="">2</a>
								<a href="">3</a>
								<a href="">4</a>
							</div>
							<!-- //페이징 처리 -->
						</div>
					</div>
				</div>
				<!-- 작성 게시글 -->
				<div class="con">
					<div id="bbs">
						<div id="blist">
						<h2>작성 게시글</h2>
							<p><span><strong>총 x개</strong>  |  1/x페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문 목록">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">분류</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
										<th scope="col">답변 여부</th> 
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>리뷰</td>
										<td><a href="">테스트</a></td>
										<td>2021-07-10</td>
										<td>N</td>
									</tr>
									<tr>
										<td>문의</td>
										<td><a href="">테스트</a></td>
										<td>2021-07-10</td>
										<td>Y</td>
									</tr>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							<div class='page'>
								<strong>1</strong>
								<a href="">2</a>
								<a href="">3</a>
								<a href="">4</a>
							</div>
							<!-- //페이징 처리 -->
						</div>
					</div>
				</div>
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