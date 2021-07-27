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
<script>
$(function() {
    $("#file1").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
            reader.onloadend = function(){ 
             $('.imagePreview1').css("background-image", "url("+this.result+")"); 
            };
        }
    });
    
    $("#file2").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
            reader.onloadend = function(){ 
             $('.imagePreview2').css("background-image", "url("+this.result+")"); 
            };
        }
    });
    
    $("#file3").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
            reader.onloadend = function(){ 
             $('.imagePreview3').css("background-image", "url("+this.result+")"); 
            };
        }
    });
});
</script>
<script>
if (value == 'frez'){
	return frez;
}
</script>
<script>
	$(function() {
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
			if ($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
			} else {
				$("#selboxDirect").hide();
			}
		})
	});
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
									<col width="10%"/>
								</colgroup>
								<tbody>
									<!-- <tr> 앞으로 나올 번호 구현
										<th scope="row"><label for="">상품 번호</label></th>
										<td colspan="10">
											<input type="text" id="ino" name="ino" class="w100"/>	
										</td>
									</tr> -->
									<tr>
										<th scope="row"><label for="">상품 종류</label></th>
										<td colspan="10">
										<div>
											<select name="ptype" id="ptype" title="종류">
											    <option value="" selected disabled>종류 선택</option>
											    <option value="frez">냉장고</option>
											    <option value="air">에어컨</option>
											    <option value="tv">TV</option>
											    <option value="wash">세탁기</option>
											</select>

											<select name="pfrez" id="pfrez" title="카테고리">
											 	<option value="" selected disabled>카테고리 선택</option>
												<option value="lfrez">일반형냉장고</option>
											    <option value="efrez">양문형냉장고</option>
											</select>

											<select name="pair" id="pair" title="카테고리">
												<option value="" selected disabled>카테고리 선택</option>
												<option value="wair">벽걸이형에어컨</option>
											    <option value="sair">스탠드형에어컨</option>
											    <option value="wdair">창문형에어컨</option>
											</select>	
											
											<select name="ptv" id="ptv" title="카테고리">
												<option value="" selected disabled>카테고리 선택</option>
												<option value="ltv">LEDTV</option>
											    <option value="oltv">OLEDTV</option>
											    <option value="qltv">QLEDTV</option>
											</select>			
											
											<select name="pwash" id="pwash" title="카테고리">
												<option value="" selected disabled>카테고리 선택</option>
												<option value="lwash">일반세탁기</option>
											    <option value="dwash">드럼세탁기</option>
											    <option value="mwash">미니세탁기</option>
											</select>							
										</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">브랜드</label></th>
										<td colspan="10">
											<select name="stype" title="브랜드">
												<option value="sam">삼성전자</option>
												<option value="lg">LG전자</option>
												<option value="carrier">캐리어</option>
												<option value="winia">위니아전자</option>
												<option value="direct">기타</option>
											</select>
											<input type="text" id="selboxDirect" name="selboxDirect"/>
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
									</tr>
									<tr>
										<th scope="row"><label for="">상품 이미지1</label></th>
										<td colspan="10">
										<div class="imagePreview1"></div>
											<input id="file1" type="file" name="file1" class="img" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 이미지2</label></th>
										<td>
										<div class="imagePreview2"></div>	
											<input id="file2" type="file" name="file2" class="img" />	
										</td>
									</tr>
									<tr>	
										<th scope="row"><label for="">상품 이미지3</label></th>
										<td>
										<div class="imagePreview3"></div>
											<input id="file3" type="file" name="file3" class="img" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 상세정보</label></th>
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