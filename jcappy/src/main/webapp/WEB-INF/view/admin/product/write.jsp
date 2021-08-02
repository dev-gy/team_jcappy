<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script src="/jcappy/js/common.js"></script>
<!-- 스마트에디터, 등록 -->
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
<!-- 이미지 썸네일 -->
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
<!-- 이중 select box -->
<script>
function categoryChange(e) {
    var pcate_frez = ["일반형냉장고", "양문형냉장고", "업소용냉장고"];
    var pcate_air = ["스탠드형에어컨", "벽걸이형에어컨", "창문형에어컨"];
    var pcate_tv = ["LEDTV", "QLEDTV", "OLEDTV"];
    var pcate_wash = ["일반세탁기", "드럼세탁기", "미니세탁기"];
    var target = document.getElementById("pcate");
 
    if(e.value == "냉장고") var d = pcate_frez;
    else if(e.value == "에어컨") var d = pcate_air;
    else if(e.value == "TV") var d = pcate_tv;
    else if(e.value == "세탁기") var d = pcate_wash;
 
    target.options.length = 0;
 
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }    
}
</script>
<!-- 브랜드에서 기타 선택시 input box 나오는것 -->
<script>
	$(function() {

		$("#brandEtc").hide();
		$("#stype").change(function() {

			if ($("#stype").val() == "기타") {
				$("#brandEtc").show();
			} else {
				$("#brandEtc").hide();
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
									<tr>
										<th scope="row"><label for="">상품 종류</label></th>
										<td colspan="10">
										<div>
											<select name="ptype" style="font-size: 13px" onchange="categoryChange(this)">
												<option>종류 선택</option>
												<option value="냉장고">냉장고</option>
												<option value="에어컨">에어컨</option>
												<option value="TV">TV</option>
												<option value="세탁기">세탁기</option>
											</select> 
											<select name="pcate" style="font-size: 13px" id="pcate">
												<option>카테고리 선택</option>
											</select>
										</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">브랜드</label></th>
										<td colspan="10">
											<select name="pcompany" style="font-size: 13px" id="stype" title="브랜드">
											<option>브랜드 선택</option>
											<option value="삼성전자">삼성전자</option>
											<option value="LG전자">LG전자</option>
											<option value="캐리어">캐리어</option>
											<option value="위니아전자">위니아전자</option>
											<option value="기타">기타</option>
										</select>
										<input type="text" id="brandEtc" name="brandEtc" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품명</label></th>
										<td colspan="10">
											<input type="text" id="pname" name="pname" class="w100" placeholder="상품명을 입력해주세요"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 가격</label></th>
										<td colspan="10">
											<input type="text" id="pprice" name="pprice" class="w100" placeholder="금액을 입력해주세요"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 재고</label></th>
										<td colspan="10">
											<input type="text" id="pcount" name="pcount" class="w100" placeholder="재고를 입력해주세요"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 이미지1</label></th>
										<td colspan="10">
										<div class="imagePreview1"></div>
											<input type="file" id="file1" name="file1" class="img" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 이미지2</label></th>
										<td>
										<div class="imagePreview2"></div>	
											<input type="file" id="file2" name="file2" class="img" />	
										</td>
									</tr>
									<tr>	
										<th scope="row"><label for="">상품 이미지3</label></th>
										<td>
										<div class="imagePreview3"></div>
											<input type="file" id="file3" name="file3" class="img" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품 상세정보</label></th>
										<td colspan="10">
											<textarea name="pdetail" id="contents" style="width:100%;"></textarea>
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