<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
function admin_create_checkId() {
	
}
function admin_create_checkPwd() {
	
}
function admin_create_checkName() {
	
}
function admin_create_auth() {
	
}
function regAdmin() {
	var check = true;
	
	if ($('#aid').val().trim() == '') {
		alert('아이디를 입력해주세요');
		$('#aid').focus();
		check = false;
	} else {
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/auth/isDuplicateId",
			data: {
				id: $('#aid').val()
			},
			async: false,
			success: function(res) {
				if (res.trim() == 'true') {
					alert('중복된 아이디 입니다. 다른 아이디를 입력해주세요.');
					$('#aid').val('');
					$('#aid').focus();
					check = false;
				}
			},
		});
	}
	
	var apwd = $('#apwd').val();
	if (apwd.trim() == '') {
		alert('비밀번호를 입력해주세요');
		$('#apwd').focus();
		check = false;
	}
	
	var check_apwd = $('#check_apwd').val(); 
	if (check_apwd.trim() == '') {
		alert('비밀번호 확인을 입력해주세요');
		$('#check_apwd').focus();
		check = false;
	}
	
	if (apwd != check_apwd) {
		alert('입력하신 비밀번호가 일치하지 않습니다.');
		$('#apwd').focus();
		check = false;
	}
	
	if (!check) {return;}
	
	if (confirm("등록하시겠습니까?")) {
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/auth/insert",
			method: 'POST',
			data: $('#frm').serialize(),
			success: function(res) {
				if (res.trim() == 'true') {
					alert('정상적으로 등록되었습니다.');
					location.href="<%=request.getContextPath()%>/admin/auth/create";
				} else {
					alert('오류발생, 등록에 실패하였습니다.');
				}
			},
		});
	}
}

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
											<input type="text" id="aid" name="aid" class="w100" />	
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