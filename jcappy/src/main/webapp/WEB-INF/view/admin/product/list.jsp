<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<title>상품 목록</title>
<script>
$(function() {
	$('.btns.change').each(function(idx, item) {
		$(item).click(function() {
			$('#pno').val($('.pno').eq(idx).text());
			$('#pcount').val($('input[name=pcount_ex]').eq(idx).val());
			$("#frmListCount").submit()
		})
	});
	categoryChange();
});

function isDel(no) {
	if (confirm('삭제하시겠습니까?')) {
		$.ajax({
			url : 'delete',
			data : {
				'pno' : no
			},
			method : 'post',
			success : function(res) {
				if (res.trim() == 'true') {
					alert('정상적으로 삭제되었습니다.');
					location.href = 'list';
				} else {
					alert('삭제 실패');
				}
			},
			error : function(res) {
			}
		});
	}
}

<!-- 이중 select box -->
function categoryChange() {
    var cval_frez = ["일반형냉장고", "양문형냉장고", "업소용냉장고"];
    var cval_air = ["스탠드형에어컨", "벽걸이형에어컨", "창문형에어컨"];
    var cval_tv = ["LEDTV", "QLEDTV", "OLEDTV"];
    var cval_wash = ["일반세탁기", "드럼세탁기", "미니세탁기"];
    var target = document.getElementById("cval");
 	var src = document.getElementById("tval");
 	
 	var arrCval;
    if(src.value == "냉장고") arrCval = cval_frez;
    else if(src.value == "에어컨") arrCval = cval_air;
    else if(src.value == "TV") arrCval = cval_tv;
    else if(src.value == "세탁기") arrCval = cval_wash;

    target.options.length = 0;
	
    var html = "<option value='all'>전체</option>";
    for (idx in arrCval) {
   		html += "<option value=" + arrCval[idx];
    	if ("${param.cval}" == arrCval[idx]) html += " selected";
    	html += ">" + arrCval[idx] + "</option>";
    }
    
    $(target).html(html);
}
</script>
</head>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>상품관리 - [목록]</h2>
					</div>
					<div class="con">
						<div id="bbs">
							<div id="blist">
								<p>
									<span><strong>총 ${productVo.totCount }개</strong> | ${productVo.reqPage}/${productVo.totPage }페이지</span>
								</p>
								<form name="frmListCount" id="frmListCount" action="updateCount"
									method="post">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="상품 목록">
										<colgroup>
											<col width="80px" />
											<col width="80px" />
											<col width="*" />
											<col width="120px" />
											<col width="80px" />
											<col width="160px" />
											<col width="80px" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">상품 번호</th>
												<th scope="col">브랜드</th>
												<th scope="col">상품명</th>
												<th scope="col">상품 가격</th>
												<th scope="col">재고량</th>
												<th scope="col">상품 등록일</th>
												<th scope="col">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list }">
												<tr>
													<td colspan="7">등록된 글이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="vo" items="${list }" varStatus="status">
												<tr>
													<td class="first pno">${vo.pno }</td>
													<td>${vo.pcompany }</td>
													<td style="text-align: left; padding-left: 10px;"><a href="detail?pno=${vo.pno }">${vo.pname }</a></td>
													<td><fmt:formatNumber value="${vo.pprice }" pattern="#,###,###"/></td>
													<td><input type="number" name="pcount_ex" class="w100" value="${vo.pcount }" />
													<a class="btns change" href="#"><strong>변경</strong></a>	
													</td>
													<td class="date">
													<fmt:formatDate value="${vo.pregdate }" pattern="yyyy-MM-dd HH:mm:ss" />
													</td>
													<td>
													<a href="javascript:isDel(${vo.pno });" class="btns"><strong>삭제</strong></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<input type="hidden" name="pno" id="pno" value="">
									<input type="hidden" name="pcount" id="pcount" value="">
								</form>
								<div class="btn">
									<div class="btnRight">
										<a class="wbtn" href="write"><strong>등록</strong> </a>
									</div>
								</div>
								
								<!-- 페이징 처리 -->
								<div class='page'>
									<c:if test="${productVo.startPage > productVo.pageRange}">
			                        	<a href="list?reqPage=${productVo.endPage+1 }&stype=${param.stype}&tval=${param.tval}&cval=${param.cval}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a>
			                        </c:if>
			                        <c:forEach var="rp" begin="${productVo.startPage}" end="${productVo.endPage }">
			                        	<c:if test="${rp==productVo.reqPage }">
			                        		<strong>${productVo.reqPage}</strong>
			                        	</c:if>
			                        	<c:if test="${rp!=productVo.reqPage }">
			                            <a href='list?reqPage=${rp}&stype=${param.stype}&tval=${param.tval}&cval=${param.cval}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}' >${rp }</a>
			                            </c:if>
			                        </c:forEach>
			                        <c:if test="${productVo.totPage > productVo.endPage}">
			                        	<a href="list?reqPage=${productVo.endPage+1 }&stype=${param.stype}&tval=${param.tval}&cval=${param.cval}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a>
			                        </c:if>
								</div>
								<!-- //페이징 처리 -->
								
								<form name="searchForm" id="searchForm" action="" method="get">
									<div class="search">
										<select name="stype" title="검색분류선택">
											<option value="pcompany"
												<c:if test="${param.stype=='pcompany' }">selected</c:if>>브랜드명</option>
											<option value="pname"
												<c:if test="${param.stype=='pname' }">selected</c:if>>상품명</option>
										</select> 
										
										<select id="tval" name="tval" onchange="categoryChange()" title="상품종류">
											<option value="all">전체</option>
											<option value="냉장고"
												<c:if test="${param.tval=='냉장고' }">selected</c:if>>냉장고</option>
											<option value="에어컨"
												<c:if test="${param.tval=='에어컨' }">selected</c:if>>에어컨</option>
											<option value="TV"
												<c:if test="${param.tval=='TV' }">selected</c:if>>TV</option>
											<option value="세탁기"
												<c:if test="${param.tval=='세탁기' }">selected</c:if>>세탁기</option>
										</select>
										
										<select id="cval" name="cval" title="상품카테고리">
											
										</select>
										<input type="text" id="sval" name="sval" value="${param.sval }" title="검색할 내용을 입력해주세요" />
										<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>