<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>문의게시판 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">번호</label></th>
										<td colspan="10">
											1
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											상품이 너무 예뻐요
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작성날짜</label></th>
										<td colspan="10">
											2021-7-10
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">답변여부</label></th>
										<td colspan="10">
											Y
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원이름</label></th>
										<td colspan="10">
											안두용
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원연락처</label></th>
										<td colspan="10">
											010-5645-8941
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원이메일</label></th>
										<td colspan="10">
											ady4709@naver.com
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품명</label></th>
										<td colspan="10">
											냉장고
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											내용입니다.
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">답글</label></th>
										<td colspan="10">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;">최대한 빠른 조취 하도록 하겠습니다.</textarea>	
										</td>
									</tr>
									
									
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=request.getContextPath()%>/admin/board/qna_list.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href=""><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href=""><strong>삭제</strong></a>
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