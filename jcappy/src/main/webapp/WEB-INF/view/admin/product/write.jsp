<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script src="/jcappy/js/common.js"></script>
<script>
var oEditors;
$(function(){
   oEditors = setEditor("contents"); // textarea 아이디 값
});

function goSave() {
	oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();
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
					<h2>상품관리 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 등록">
								<colgroup>
									<col width="10%" />
								</colgroup>
								<tbody>
									<!-- <tr> 앞으로 나올 번호 구현
										<th scope="row"><label for="">상품 번호</label></th>
										<td colspan="10">
											<input type="text" id="ino" name="ino" class="w100"/>	
										</td>
									</tr> -->
									<tr>
										<th scope="row"><label for="">브랜드</label></th>
										<td colspan="10">
											<select name="stype" title="브랜드">
												<option value="sam">삼성전자</option>
												<option value="lg">LG전자</option>
												<option value="carrier">캐리어</option>
												<option value="winia">위니아전자</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품명</label></th>
										<td colspan="10">
											<input type="text" id="pname" name="pname" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 가격</label></th>
										<td colspan="10">
											<input type="text" id="pprice" name="pprice" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 재고</label></th>
										<td colspan="10">
											<input type="text" id="pcount" name="pcount" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 등록일</label></th>
										<td colspan="10">
											<input type="text" id="pregdate" name="pregdate" class="w100"/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">상품 이미지</label></th>
										<td colspan="10">
											<input type="file" id="file" name="file" class="w100"/>	
											<input type="file" id="file" name="file" class="w100"/>	
											<input type="file" id="file" name="file" class="w100"/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">상품 상세이미지</label></th>
										<td colspan="10">
											<textarea name="content" id="contents" style="width:100%;"></textarea>
										</td>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="list"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();" style="cursor:pointer;"><strong>등록</strong></a>
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