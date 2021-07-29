<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<script type="text/javascript">
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

// 회원 연락처 체크
function check_create_phone(phone) {
	
	if (phone.val().trim() == '') {
		alert('연락처를 입력해주세요.');
		phone.focus();
		return false;
	} else if (!/^[0-9]{9,11}$/.test(phone.val())) {
		alert('숫자 9~11자리로만 입력해주세요.');
		phone.focus();
		return false;
	} else {
		return true;
	}
}

// 우편번호, 주소, 상세주소 체크
function check_create_address() {
	
	if($('#mzipcode').val().trim() == '' || $('#maddr').val().trim() == '') {
		alert('주소입력을 확인해주세요.');
		return false;
	} else if ($('#maddrde').val().trim() == '') {
		alert('상세주소를 입력해주세요.');
		$('#maddrde').focus();
		return false;
	}	
	return true;
}

// 회원 정보 수정
function updateMembers() {

	if ($('#mpwd').val().trim() != '' || $('#check_mpwd').val().trim() != '') {
		if (!check_create_pwd($('#mpwd'), $('#check_mpwd'))) {return;}
	}
	if (!check_create_name($('#mname'))) {return;}

	if (!check_create_phone($('#mphone'))) {return;}

	if (!check_create_address()) {return;}
	
	if (confirm("수정하시겠습니까?")) {
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/members/update",
			method: 'POST',
			data: $('#frm').serialize(),
			success: function(res) {
				if (res.trim() == 'true') {
					alert('정상적으로 수정되었습니다.');
					location.href="<%=request.getContextPath()%>/admin/members/list";
				} else {
					alert('오류발생, 수정에 실패하였습니다.');
				}
			},
		});
	}
}

// 회원정보 삭제
function delMembers(no) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/members/delete",
			method: 'POST',
			data: {
				mno: no,
			},
			success: function(res) {
				if (res.trim() == 'true') {
					alert('정상적으로 삭제되었습니다.');
					location.href="<%=request.getContextPath()%>/admin/members/list";
				} else {
					alert('오류발생, 삭제에 실패하였습니다.');
				}
			},
		});
	}
}

$(function() {
	getOrderList();
	getBoardList();
});

// 해당 회원이 작성한 게시글 목록
function getBoardList(reqPage) {
	$.ajax({
		url: "<%=request.getContextPath()%>/admin/members/boardList",
		data: {
			mno: ${vo.mno},
			reqPage: reqPage
		},
		success: function(res) {
			$('#boardListArea').html(res);	
		}
	});
}

// 해당 회원의 주문 목록
function getOrderList(reqPage) {
	$.ajax({
		url: "<%=request.getContextPath()%>/admin/members/orderList",
		data: {
			mno: ${vo.mno},
			reqPage: reqPage
		},
		success: function(res) {
			$('#orderListArea').html(res);	
		}
	});
}
</script>
</head>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
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
						<div id="admin_members_detail">
							<div id="bbs" class="admin_members_detail_info">
								<div id="bread">
									<form method="post" name="frm" id="frm" action="">
										<table>
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="mno">회원번호</label></th>
													<td colspan="10"><input type="text" id="mno"
														name="mno" class="w100" value="${vo.mno }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="memail">이메일</label></th>
													<td colspan="10"><input type="text" id="memail"
														name="memail" class="w100" value="${vo.memail }" disabled />
													</td>
												</tr>
												<tr>
													<th scope="row"><label for="mgrade">회원등급</label></th>
													<td colspan="10"><select id="mgrade" name="mgrade"
														class="dSelect" title="회원등급">
															<option value="bronze"
																<c:if test="${vo.mgrade == 'bronze'}">selected</c:if>>BRONZE</option>
															<option value="silver"
																<c:if test="${vo.mgrade == 'silver'}">selected</c:if>>SILVER</option>
															<option value="gold"
																<c:if test="${vo.mgrade == 'gold'}">selected</c:if>>GOLD</option>
															<option value="vip"
																<c:if test="${vo.mgrade == 'vip'}">selected</c:if>>VIP</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row"><label for="mpwd">비밀번호</label></th>
													<td colspan="10"><input type="password" id="mpwd"
														name="mpwd" class="w100"
														placeholder="영문, 숫자, 특수문자를 각 하나이상 포함한 6~20자" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="check_mpwd">비밀번호
															확인</label></th>
													<td colspan="10"><input type="password"
														id="check_mpwd" name="check_mpwd" class="w100"
														placeholder="입력하신 비밀번호를 한번 더 입력해주세요." /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mname">이름</label></th>
													<td colspan="10"><input type="text" id="mname"
														name="mname" class="w100"
														placeholder="한글, 영문으로 이루어진 1~20자" value="${vo.mname }" />
													</td>
												</tr>
												<tr>
													<th scope="row"><label for="mphone">연락처</label></th>
													<td colspan="10"><input type="text" id="mphone"
														name="mphone" class="w100"
														placeholder="특수문자없이 숫자 9~11자리로만 입력해주세요."
														value="${vo.mphone }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mzipcode">우편번호</label></th>
													<td colspan="10"><input type="text" id="mzipcode"
														name="mzipcode" class="w100" value="${vo.mzipcode }"
														onClick="daumPostcode($('#mzipcode'), $('#maddr'), $('#maddrde'));"
														readonly /></td>
												</tr>
												<tr>
													<th scope="row"><label for="maddr">주소</label></th>
													<td colspan="10"><input type="text" id="maddr"
														name="maddr" class="w100" value="${vo.maddr }"
														onClick="daumPostcode(mzipcode, maddr, maddrde);" readonly />
													</td>
												</tr>
												<tr>
													<th scope="row"><label for="maddrde">상세주소</label></th>
													<td colspan="10"><input type="text" id="maddrde"
														name="maddrde" class="w100" value="${vo.maddrde }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mregdate">가입일</label></th>
													<td colspan="10"><input type="text" id="mregdate"
														name="mregdate" class="w100"
														value="<fmt:formatDate value="${vo.mregdate }" pattern="yyyy-MM-dd"/>"
														disabled /></td>
												</tr>
											</tbody>
										</table>
										<input type="hidden" name="mno" value="${vo.mno }" />
									</form>
									<div class="btn">
										<div class="btnLeft">
											<a class="btns" href="#" onClick="history.back();"><strong>목록</strong></a>
										</div>
										<div class="btnRight">
											<a class="btns" onclick="updateMembers();"><strong>수정</strong></a>
											<a class="btns" onclick="delMembers(${vo.mno});"><strong>삭제</strong></a>
										</div>
									</div>
									<!--//btn-->
								</div>
								<!-- //bread -->
							</div>
							<div id="orderListArea"></div>
							<div id="boardListArea"></div>
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