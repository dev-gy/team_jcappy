<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
var oEditors;
$(function(){
   oEditors = setEditor("contents"); // textarea 아이디 값
});

function goSave() {
	oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();
}

function isDel() {
    if (confirm('삭제하시겠습니까?')) {
       // 삭제처리
       $.ajax({
          url:'delete',
          data:{
             'pno':${vo.pno}
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
					<h2>상품관리 - [상세보기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품정보 상세보기">
								<colgroup>
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">상품 번호</label></th>
										<td colspan="10">
											<input type="text" id="ino" name="ino" class="w100" value="${vo.pno }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">브랜드</label></th>
										<td colspan="10">
											<select name="stype" title="브랜드">
												<option value="">${vo.pcompany }</option>
												<option value="">만드렁</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품명</label></th>
										<td colspan="10">
											<input type="text" id="pname" name="pname" class="w100" value="${vo.pname }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 가격</label></th>
										<td colspan="10">
											<input type="text" id="pprice" name="pprice" class="w100" value="${vo.pprice }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 재고</label></th>
										<td colspan="10">
											<input type="text" id="pcount" name="pcount" class="w100" value="${vo.pcount }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 등록일</label></th>
										<td colspan="10">
											<input type="text" id="pregdate" name="pregdate" class="w100" value="${vo.pregdate }" readonly/>	
										</td>
									</tr><tr>
										<th scope="row"><label for="">상품 이미지</label></th>
										<td colspan="10">
											<img style="width: 50px;" src="${vo.pimg1_org}">
											<img style="width: 50px;" src="${vo.pimg2_org}">
											<img style="width: 50px;" src="${vo.pimg3_org}">
										
<%-- 											<a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.pimg1_org}&real=${vo.pimg1_real}"  --%>
<%--                             				target="_blank">${vo.pimg1_org}</a> --%>
<%-- 											<a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.pimg2_org}&real=${vo.pimg2_real}"  --%>
<%--                             				target="_blank">${vo.pimg2_org}</a> --%>
<%--                             				<a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.pimg3_org}&real=${vo.pimg3_real}"  --%>
<%--                             				target="_blank">${vo.pimg3_org}</a> --%>
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
									<a class="btns" style="cursor:pointer;" href="javascript:goSave();"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:isDel();"><strong>삭제</strong></a>
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