<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<style>
	
</style>
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
					<div id="admin_create">
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert">
							<table>
								<colgroup>
									<col width="30%" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">관리자 아이디</label></th>
										<td colspan="10">
											<input type="text" id="aid" name="aid" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">관리자 비밀번호</label></th>
										<td colspan="10">
											<input type="password" id="apwd" name="apwd" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">비밀번호 확인</label></th>
										<td colspan="10">
											<input type="password" id="check_apwd" name="check_apwd" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">관리자 이름</label></th>
										<td colspan="10">
											<input type="text" id="aname" name="aname" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="3"><label for="">접근권한</label></th>
										<td class="admin_authority">
											<label><input type="checkbox" id="admin_item" name="admin_item" value="1"/>상품관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" id="admin_order" name="admin_order" value="1"/>주문관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" id="admin_members" name="admin_members" value="1"/>회원관리</label>
										</td>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" id="admin_board" name="admin_board" value="1"/>게시판관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" id="admin_add" name="admin_add" value="1"/>부가기능관리</label>	
										</td>
									</tr>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" id="admin_account" name="admin_account" value="1"/>매출조회</label>	
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<label><input type="checkbox" id="admin_admin" name="admin_admin" value="1"/>관리자계정</label>	
										</td>
									</tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="list"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" onclick="$('#frm').submit();"><strong>등록</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
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