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
					<h2>관리자 계정 - [상세보기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 계정 상세보기">
								<colgroup>
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">관리자 등급</label></th>
										<td colspan="10">
											1
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td colspan="10">
											홍길동
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">관리자 아이디</label></th>
										<td colspan="10">
											admin	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호</label></th>
										<td colspan="10">
											1234
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호 확인</label></th>
										<td colspan="10">
											1234
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