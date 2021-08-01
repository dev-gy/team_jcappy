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
										<th scope="row"><label for="aid">관리자 아이디</label></th>
										<td colspan="10">
											<input type="text" id="aid" name="aid" class="w80" placeholder="영문으로 시작, 영문, 숫자로 이루어진 5~20자"/>
											<span><a class="btns" href="#" onClick="check_create_id_button($('#aid'), '<%=request.getContextPath()%>/admin/auth/isDuplicateId');"><strong>체크</strong></a></span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="apwd">관리자 비밀번호</label></th>
										<td colspan="10">
											<input type="password" id="apwd" name="apwd" class="w100" placeholder="영문, 숫자, 특수문자를 각 하나이상 포함한 6~20자"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="check_apwd">비밀번호 확인</label></th>
										<td colspan="10">
											<input type="password" id="check_apwd" name="check_apwd" class="w100" placeholder="입력하신 비밀번호를 한번 더 입력해주세요."/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="aname">관리자 이름</label></th>
										<td colspan="10">
											<input type="text" id="aname" name="aname" class="w100" placeholder="한글, 영문으로 이루어진 1~20자"/>	
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="3"><label for="admin_auth_allChk">접근권한</label>&nbsp;<input type="checkbox" name="admin_auth_allChk" id="admin_auth_allChk" onClick="admin_auth_checkAll();"/></th>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_item" name="auths" value="1" onClick="admin_auth_checkOne();"/>상품관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_order" name="auths" value="1" onClick="admin_auth_checkOne();"/>주문관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_members" name="auths" value="1" onClick="admin_auth_checkOne();"/>회원관리</label>
										</td>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_board" name="auths" value="1" onClick="admin_auth_checkOne();"/>게시판관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_add" name="auths" value="1" onClick="admin_auth_checkOne();"/>부가기능관리</label>	
										</td>
									</tr>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_account" name="auths" value="1" onClick="admin_auth_checkOne();"/>매출조회</label>	
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<label><input type="checkbox" class="check_auth" id="admin_auth" name="auths" value="1" onClick="check_admin_authority(); admin_auth_checkOne();"/>관리자계정</label>
											&nbsp;
											<input type="password" id="check_authority" name="check_authority" class="w30" placeholder="권한코드 입력"/>
										</td>
									</tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onClick="history.back();"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" onclick="regAdmin();"><strong>등록</strong></a>
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