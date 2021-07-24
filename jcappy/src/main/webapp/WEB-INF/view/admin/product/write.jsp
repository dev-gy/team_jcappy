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
var valueFactory = (function() {
	  var cfrez = [일반형냉장고, 양문형냉장고];
	  var cair = [스탠드형에어컨, 벽걸이형에어컨];
	  var ctv = [LEDTV, OLEDTV, QLEDTV];
	  var cwash = [일반세탁기, 드럼세탁기, 미니세탁기];

	  return {
	    create: function(target, value) {
	      if (target === 'pcate') {
	        if (value === 'frez') {
	          return cfrez;
	        } else if (value === 'air') {
	          return cair;
	        } else if (value === 'tv') {
	          return ctv;
	        } else if (value === 'wash') {
	          return cwash;
	        }
	      }
	    }
	  }
	})();

	/**
	 * @param target  값이 삽입될 select 태그명
	 * @param value  값을 구분해줌
	 */
	var retrieves = function(target, value) {

	  // 해당 target에 맞는 data 가져오는 부분
	  // 나중에 DB와 연동할 시 ajax를(비동기부분) 이용해 data가져오는 구분으로 변경해도됨
	  var arr = valueFactory.create(target, value);

	  $("select[name=" + target + "]").empty();

	  $.each(arr, function(idx, item) {
	    $("<option>" + (target + "_" + item) + "</option>").attr({
	      'value': (idx + 1),
	    }).appendTo($("select[name=" + target + "]"));

	  });
	};

	//select 태그 중 hierarchy란 클래스를 가지고 있는 Element가 change 이벤트가 발생 할시 실행함
	$("select.hierarchy").on('change', function() {
	  var target = $(this).data('target');
	  var value = $(this).val();

	  retrieves(target, value);
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
										<span>
											<select class="hierarchy" name="ptype" id="ptype" title="종류" data-target="pcate">
												<option value="" selected disabled>종류를 선택</option>
												<option value="frez">냉장고</option>
												<option value="air">에어컨</option>
												<option value="tv">TV</option>
												<option value="wash">세탁기</option>
											</select>
										</span>
										<span>
											<select class="hierarchy" name="pcate" id="pcate" title="카테고리">
											</select>
										</span>
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