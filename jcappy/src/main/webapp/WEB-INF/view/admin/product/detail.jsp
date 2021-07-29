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
function groupDel(name) {

	var count=0;
	for (var i=0; i<$('input[name="'+name+'"]').length; i++) {

		if ($('input[name="'+name+'"]').eq(i).prop('checked')) {
			count++;
			break;
		}
	}
	if (count == 0) {
		alert('하나 이상 체크해 주세요');
	} else {
		if (confirm('삭제하시겠습니까?')) {
			$("#frm").submit();
		}
	}
}

function check() {

	if ($("#noimg").prop('checked')) {
		for (var i=0; i<$('input[name="no"]').length; i++) {
			$('input[name="no"]').eq(i).prop('checked','checked');
		}
	} else {
		for (var i=0; i<$('input[name="no"]').length; i++) {
			$('input[name="no"]').eq(i).prop('checked','');
		}
	}
}
</script>
<script>
function categoryChange(e) {
    var pcate_frez = ["일반형냉장고", "양문형냉장고", "업소용냉장고"];
    var pcate_air = ["스탠드형에어컨", "벽걸이형에어컨", "창문형에어컨"];
    var pcate_tv = ["LEDTV", "QLEDTV", "OLEDTV"];
    var pcate_wash = ["일반세탁기", "드럼세탁기", "미니세탁기"];
    var target = document.getElementById("pcate");
 
    if(e.value == "frez") var d = pcate_frez;
    else if(e.value == "air") var d = pcate_air;
    else if(e.value == "tv") var d = pcate_tv;
    else if(e.value == "wash") var d = pcate_wash;
 
    target.options.length = 0;
 
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }    
}
</script>
<script>
$(document).ready(function(){
	
	  $("#stype").each(function(){
	    if($(this).val()=="${vo.pcompany}"){
	      $(this).prop("selected","selected"); // attr적용안될경우 prop으로 
	    }
	  });
	});
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
											<!-- <tr>
												<th scope="row"><label for="">상품 종류</label></th>
												<td colspan="10">
												<div>
													<select onchange="categoryChange(this)">
														<option>종류 선택</option>
														<option value="frez">냉장고</option>
														<option value="air">에어컨</option>
														<option value="tv">TV</option>
														<option value="wash">세탁기</option>
													</select> <select id="pcate">
														<option>카테고리 선택</option>
													</select>
												</div>
												</td>
											</tr> -->
											<tr>
												<th scope="row"><label for="">상품 종류</label></th>
												<td colspan="10">
												<div>
													<select onchange="categoryChange(this)">
														<option>${vo.ptype }</option>
													</select> <select id="pcate">
														<option>${vo.pcate }</option>
													</select>
												</div>
												</td>
											</tr>
											<!-- <tr>
												<th scope="row"><label for="">브랜드</label></th>
												<td colspan="10">
												<select name="stype" id="stype" title="브랜드">
														<option value="sam">삼성전자</option>
														<option value="lg">LG전자</option>
														<option value="carrier">캐리어</option>
														<option value="winia">위니아전자</option>
												</select>
												</td>
											</tr> -->
											<tr>
												<th scope="row"><label for="">브랜드</label></th>
												<td colspan="10">
													<select name="stype" id="stype" title="브랜드">
														<option value="">${vo.pcompany }</option>
													</select>
												</td>
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
												
												<input type="checkbox" name="nos" id="noimg" onClick="check()"/>
												<img style="width: 50px;" src="${vo.pimg1_org}">
												<input type="file" id="file" name="file" class="w100" />
												
												<input type="checkbox" name="nos" id="noimg" onClick="check()"/>
												<img style="width: 50px;" src="${vo.pimg2_org}">
												<input type="file" id="file" name="file" class="w100" />
												
												<input type="checkbox" name="nos" id="noimg" onClick="check()"/>
												<img style="width: 50px;" src="${vo.pimg3_org}">
												<input type="file" id="file" name="file" class="w100" />
												
												<a class="btns" style="cursor: pointer;" href="#" onclick="groupDel('nos');"><strong>삭제</strong> </a>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">상품 상세정보</label></th>
												<td colspan="10">
													<textarea name="contents" id="contents" style="width: 100%;">${vo.pdetail }</textarea>
												</td>
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