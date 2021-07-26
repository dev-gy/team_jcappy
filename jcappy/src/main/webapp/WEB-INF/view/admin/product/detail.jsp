<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
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
<script>
       function isDel() {
          if (confirm('삭제하시겠습니까?')) {

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
             });
          }
       }
</script>
<script>
/* select id = pcomp와 option id 의 값이 같을경우 그 값을 출력   */
</script>
<script>
// function isDelImg() {
//     if (confirm('삭제하시겠습니까?')) {

//        $.ajax({
//           url:'updateImg',
//           data:{
//              'pno':${vo.pno}
//           },
//           method:'post',
//           success:function(res) {
//              console.log(res);
//              if (res.trim() == 'true') {
//                 alert('정상적으로 삭제되었습니다.');
//                 location.href='detail?pno=${vo.pno}';s
//              } else {
//                 alert('삭제 실패');
//              }
//           },
//        });
//     }
//  }
</script>
<script>
$("#stype").change(function(){        
	  var stype = $("#stype option:selected").val();

	  if(stype == sam){
	    $(".r50").show();
	    $(".r150").hide();
	  }else{
	    $(".r50").hide();
	    $(".r150").show();
	  }
	})
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
						<h2>상품관리 - [상세보기]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm" action="update	"
									enctype="multipart/form-data">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="상품정보 상세보기">
										<colgroup>
											<col width="10%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="">상품 번호</label></th>
												<td colspan="10"><input type="text" id="ino" name="ino"
													class="w100" value="${vo.pno }" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">브랜드</label></th>
												<td colspan="10">
												<select name="stype" id="stype" title="브랜드">
														<option value="pcomp">${vo.pcompany }</option>
														<option value="sam">삼성전자</option>
														<option value="lg">LG전자</option>
														<option value="carrier">캐리어</option>
														<option value="winia">위니아전자</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품명</label></th>
												<td colspan="10"><input type="text" id="pname"
													name="pname" class="w100" value="${vo.pname }" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 가격</label></th>
												<td colspan="10"><input type="text" id="pprice"
													name="pprice" class="w100" value="${vo.pprice }" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 재고</label></th>
												<td colspan="10"><input type="text" id="pcount"
													name="pcount" class="w100" value="${vo.pcount }" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 등록일</label></th>
												<td colspan="10"><input type="text" id="pregdate"
													name="pregdate" class="w100" value="${vo.pregdate }"
													readonly /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 이미지</label></th>
												<td colspan="10" rowspan="1">
												<input type="checkbox" name="nos" id="noimg" /> <img style="width: 50px;" src="${vo.pimg1_org}">
												<input type="file" id="file" name="file" class="w100" />
												<input type="checkbox" name="nos" id="noimg" /> <img style="width: 50px;" src="${vo.pimg2_org}">
												<input type="file" id="file" name="file" class="w100" />
												<input type="checkbox" name="nos" id="noimg" /> <img style="width: 50px;" src="${vo.pimg3_org}">
												<input type="file" id="file" name="file" class="w100" />
												<a class="btns" style="cursor: pointer;" href="javascript:isDelImg();"><strong>삭제</strong></a>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 상세정보</label></th>
												<td colspan="10"><textarea name="content" id="contents"
														style="width: 100%;"></textarea></td>
										</tbody>
									</table>
									<input type="hidden" name="cmd" value="write" /> <input
										type="hidden" name="pno" value="${vo.pno}">
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="list"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" style="cursor: pointer;"
											href="javascript:goSave();"><strong>수정</strong></a> <a
											class="btns" style="cursor: pointer;"
											href="javascript:isDel();"><strong>삭제</strong></a>
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