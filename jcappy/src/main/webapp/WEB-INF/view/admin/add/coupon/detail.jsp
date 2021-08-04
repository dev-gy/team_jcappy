<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function coupon_detail_go_save(){
	var regexp = /^[0-9]*$/ // 숫자가 아닌 모든것
	
	if ($("#cname").val().trim() == "") { // 쿠폰코드 빈값 저장 안되게
		 alert("쿠폰이름을 입력해 주세요");
		 $("#cname").focus();
		 return false;
	}
	
	if ($("#cprice").val().trim() == "") { //할인금액 빈값 저장 안되게
		 alert("할인금액을 입력해 주세요");
		 $("#cprice").focus();
		 return false;
	}
	if ($("#cdate").val().trim() == "") { //유효기간 빈값 저장 안되게
		 alert("유효기간을 입력해 주세요");
		 $("#cdate").focus();
		 return false;
	}
	if (!regexp.test($("#cprice").val())) { //test() 메서드는 주어진 문자열이 정규 표현식을 만족하는지 판별하고, 그 여부를 true 또는 false로 반환합니다.
		alert("할인금액에 숫자만 입력하세요");		//할인금액에 숫자만 입력하게
		$("#cprice").focus();
		return false;
	}
	if (!regexp.test($("#cdate").val())) { // 유효기간에 숫자만 입력하게
		alert("유효기간에 숫자만 입력하세요");
		$("#cdate").focus();
		return false;
	}
	if(confirm('정말로 수정 하시겠습니까')) {
		$("#frm").submit();
	}
	
}
function coupon_detail_isDel() { //쿠폰삭제 ajax
	$.ajax({
		url:'delete',
		data:{
			'cno':${vo.cno}
		},
		method:'post',
		success:function(res) {
			console.log(res);
			if (res.trim() == 'true') {
				alert('정상적으로 삭제되었습니다.');
				location.href='list';
			} else {
				alert('삭제 실패');
			}
		},
		error : function(res) {
			console.log(res);
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
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>쿠폰관리 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs" class="coupon_detail_bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update">
							<input type="hidden" name="cno" value="${vo.cno}">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="20%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">번호</th>
										<td colspan="10">
											${vo.cno}
										</td>
									</tr>
									<tr>
										<th scope="row">쿠폰이름</th>
										<td colspan="10">
											<input type="text" id="cname" name="cname" class="w100" value="${vo.cname }" />
										</td>
									</tr>
									<tr>
										<th scope="row">할인금액</th>
										<td colspan="10">
											<input type="text" id="cprice" name="cprice" class="w100" value="${vo.cprice}" />
										</td>
									</tr>
									<tr>
										<th scope="row">발급날짜</th>
										<td colspan="10">
											${vo.cregdate }
										</td>
									</tr>
									<tr>
										<th scope="row">유효기간</th>
										<td colspan="10">
											<input type="text" id="cdate" name="cdate" class="w100" value="${vo.cdate }" />
										</td>
									</tr>
									<tr>
										<th scope="row">회원이름</th>
										<td colspan="10">
											${vo.mname}
										</td>
									</tr>
									<tr>
										<th scope="row">회원이메일</th>
										<td colspan="10">
											${vo.memail}
										</td>
									</tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="list?<c:if test="${!empty param.reqPage}">reqPage=${param.reqPage}</c:if>&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:coupon_detail_go_save();"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:coupon_detail_isDel()"><strong>삭제</strong></a>
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