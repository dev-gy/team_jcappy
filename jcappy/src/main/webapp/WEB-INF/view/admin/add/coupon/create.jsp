<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function coupon_create_goSave() {
	
	var regexp = /^[0-9]*$/ // 숫자가 아닌 모든것
	
	if ($("#ccode").val().trim() == "") { // 쿠폰코드가 빈값이면 작동
		 alert("쿠폰코드를 입력해 주세요");
		 $("#ccode").focus();
		 return false;
	} 
	
	if ($("#cprice").val().trim() == "") {  //할인금액가 빈값이면 작동
		 alert("할인금액을 입력해 주세요");
		 $("#cprice").focus();
		 return false;
	}
	if ($("#cdate").val().trim() == "") { // 유효기간이 빈값이면 작동
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
	$.ajax({	// 이메일이 존재하면 폼 전송 존재하지 않으면 폼 전송하지 않음
		url:'countMemail',
		data:{
			memail:$('#memail').val()
		},
		success:function(res) {
			if(res.trim() == 'true') {
				if(confirm('이메일이 존재합니다 정말 등록하시겠습니까?')) {
					$("#frm").submit();
				}
			} else {
				alert('이메일이 존재하지 않습니다 다시한번 입력해주세요');
			}
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
					<h2>쿠폰관리 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">쿠폰코드</th>
										<td colspan="10">
											<input type="text" id="ccode" name="ccode" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row">할인금액</th>
										<td colspan="10">
											<input type="text" id="cprice" name="cprice" class="w100" />		
										</td>
									</tr>
									<tr>
										<th scope="row">유효기간</th>
										<td colspan="10">
											<input type="text" id="cdate" name="cdate" class="w100" />
										</td>
									</tr>
									<tr>
										<th scope="row">회원이메일</th>
										<td colspan="10">
											<input type="text" id="memail" name="memail" class="w100" />
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
									<a class="btns" style="cursor:pointer;" href="javascript:coupon_create_goSave();"><strong>저장</strong></a>
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