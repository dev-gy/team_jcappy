<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">

// 아이디 체크 
function check_create_id(id, url) {
	
	var check = true;
	
	if (id.val().trim() == '') {
		alert('아이디를 입력해주세요');
		id.focus();
		check = false;
	} else if (!/^[A-Za-z]{1}[A-Za-z0-9]{5,20}$/.test(id.val())) {
		alert('아이디 : 영문대소문자로 시작, 영문대소문자, 숫자로 이루어진 5~20자');
		id.focus();
		check = false;
	} else {
		$.ajax({
			url: url,
			data: {
				id: id.val()
			},
			async: false,
			success: function(res) {
				if (res.trim() == 'true') {
					alert('중복된 아이디 입니다. 다른 아이디를 입력해주세요.');
					id.val('');
					id.focus();
					check = false;
					return;
				}
			},
		});
	}
	return check;
}

// 아이디 체크 버튼
function check_create_id_button(id, url) {
	if (!check_create_id($('#aid'), "<%=request.getContextPath()%>/admin/auth/isDuplicateId")) {
		return;
	} else {
		alert('사용할 수 있는 아이디입니다.');
	}
}

// 비밀번호 체크
function check_create_pwd(pwd, chkPwd) {

	var check = true;
	
	if (pwd.val().trim() == '') {
		alert('비밀번호를 입력해주세요');
		pwd.focus();
		check = false;
		return;
	} else if (!/(?=.*\d)(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,20}/.test(pwd.val())) {
		alert('비밀번호 : 영문대소문자, 숫자, 특수문자를 각 하나이상 포함한 6~20자');
		pwd.focus();
		check = false;
		return;
	}
	
	if (chkPwd.val().trim() == '') {
		alert('비밀번호 확인을 입력해주세요');
		chkPwd.focus();
		check = false;
		return;
	}
	
	if (pwd.val() != chkPwd.val()) {
		alert('입력하신 비밀번호가 일치하지 않습니다.');
		pwd.focus();
		check = false;
		return;
	}
	return check;
}

// 이름 체크
function check_create_name(name) {
	
	if (name.val().trim() == '') {
		alert('이름을 입력해주세요.');
		name.focus();
		return false;
	} else if (!/^[가-힣a-zA-Z]{1,20}$/.test(name.val())) {
		alert('이름 : 한글, 영문으로 이루어진 1~20자');
		name.focus();
		return false;
	} else {
		return true;
	}
}

// 체크박스 체크
function check_create_auth(checkbox) {
	
	var check = true;
	var count = 0;
	
	for (var i = 0; i < checkbox.length; i++) {
		if (checkbox.eq(i).prop('checked')) {
			count++;
		}
	}
	
	if (count < 1) {
		alert('권한을 하나 이상 선택해야합니다.');
		check = false;
		return;
	}
	return check;	
}

// 관리자 계정 등록
function regAdmin() {
	
	var check = true;

	if (!check_create_id($('#aid'), "<%=request.getContextPath()%>/admin/auth/isDuplicateId")) {return;}
	
	if (!check_create_pwd($('#apwd'), $('#check_apwd'))) {return;}

	if (!check_create_name($('#aname'))) {return;}
	 
	if (!check_create_auth($('input[class=check_auth]'))) {return;}
	
	// 관리자계정 권한 선택 시, 권한 코드 입력체크
	if ($('#admin_auth').prop("checked")) {
		if ($('#check_authority').val().trim() == '') {
			alert('"관리자계정" 권한은 권한코드를 필요로합니다.\n권한코드를 입력해주세요.');
			$('#check_authority').focus();
			return;
		} else {
			$.ajax({
				url: "<%=request.getContextPath()%>/admin/auth/checkAuthority",
				data: {
					code: $('#check_authority').val()
				},
				async: false,
				success: function(res) {
					if (res.trim() == 'false') {
						alert('코드가 잘못 입력되었습니다.');
						$('#check_authority').val('');
						$('#check_authority').focus();
						check = false;
						return;
					}
				},
			});
		}
	}

	if (!check) {return;}
	
	checkbox_value();
	
	if (confirm("등록하시겠습니까?")) {
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/auth/insert",
			method: 'POST',
			data: $('#frm').serialize(),
			success: function(res) {
				if (res.trim() == 'true') {
					alert('정상적으로 등록되었습니다.');
					location.href="<%=request.getContextPath()%>/admin/auth/list";
				} else {
					alert('오류발생, 등록에 실패하였습니다.');
				}
			},
		});
	}
}

$(function () {
	$('#check_authority').hide(); // 관리자계정권한 권한코드 입력 칸 숨기기
});

// 관리자계정 권한 선택 시, 권한 코드 입력 칸 출력
function check_admin_authority() {
	if ($('#admin_auth').prop("checked")) {
		$('#check_authority').show();
	} else {
		$('#check_authority').hide();
	}
}

// 관리자계정 권한 전체선택
function checkAll() {

	if ($('#allChk').prop("checked")) {
		$('input[class=check_auth]').prop("checked", true);
		check_admin_authority();
	} else {
		$('input[class=check_auth]').prop("checked", false);
		check_admin_authority();
	}
}

function checkOne() {
	
	var count = 0;
	
	for (var i = 0; i < $('input[class=check_auth]').length; i++) {
		if ($('input[class=check_auth]').eq(i).prop("checked"))
		count++;
	}
	
	if (count == $('input[class=check_auth]').length) {
		$('#allChk').prop("checked", true);
	} else {
		$('#allChk').prop("checked", false);
	}
}

//체크박스 선택하지 않은 값들도 넘겨주기위한 함수
function checkbox_value() {
	$('input[class=check_auth]').each(function() {  
        if ($(this).prop("checked")) { 
            $(this).val("1");
        } else {
            $(this).val("0");
        }
    });
    $('input[class=check_auth]').prop("checked", true); 
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
										<th scope="row" rowspan="3"><label for="allChk">접근권한</label>&nbsp;<input type="checkbox" name="allChk" id="allChk" onClick="checkAll();"/></th>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_item" name="auths" value="1" onClick="checkOne();"/>상품관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_order" name="auths" value="1" onClick="checkOne();"/>주문관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_members" name="auths" value="1" onClick="checkOne();"/>회원관리</label>
										</td>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_board" name="auths" value="1" onClick="checkOne();"/>게시판관리</label>
											&nbsp;&nbsp;|&nbsp;&nbsp;	
											<label><input type="checkbox" class="check_auth" id="admin_add" name="auths" value="1" onClick="checkOne();"/>부가기능관리</label>	
										</td>
									</tr>
									<tr>
										<td class="admin_authority">
											<label><input type="checkbox" class="check_auth" id="admin_account" name="auths" value="1" onClick="checkOne();"/>매출조회</label>	
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<label><input type="checkbox" class="check_auth" id="admin_auth" name="auths" value="1" onClick="check_admin_authority(); checkOne();"/>관리자계정</label>
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