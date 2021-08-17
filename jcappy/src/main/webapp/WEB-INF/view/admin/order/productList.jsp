<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {
	categoryChange();
});

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
	
    var html = "<option value=''>전체</option>";
    for (idx in arrCval) {
   		html += "<option value=" + arrCval[idx];
    	if ("${param.cval}" == arrCval[idx]) html += " selected";
    	html += ">" + arrCval[idx] + "</option>";
    }
    
    $(target).html(html);
}
</script>
<div id="bbs" class="admin_product_list" style="width: 100%; height: 400px">
	<div id="blist">
		<p>
			<span><strong>총 ${productVo.totCount }개</strong> | ${productVo.reqPage}/${productVo.totPage }페이지</span>
		</p>
		<form name="frmListCount" id="frmListCount" action="updateCount" method="post" style="width: 100%;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 목록" class="productListTable">
				<colgroup>
					<col class="w6" />
					<col class="w10" />
					<col width="*" />
					<col class="w15" />
					<col class="w6" />
					<col class="w8" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">번호</th>
						<th scope="col">브랜드</th>
						<th scope="col">상품명</th>
						<th scope="col">가격</th>
						<th scope="col">재고</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty productList }">
						<tr>
							<td colspan="6" class="first">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${productList }" varStatus="status">
						<tr>
							<td class="first pno">${vo.pno }</td>
							<td>${vo.pcompany }</td>
							<td style="text-align: left; padding-left: 10px;">${vo.pname }</td>
							<td><fmt:formatNumber value="${vo.pprice }" pattern="#,###,###원"/></td>
							<td>${vo.pcount }</td>
							<td>
							<a href="javascript:isDel(${vo.pno });" class="btns"><strong>선택</strong></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<!-- 페이징 처리 -->
		<div class='page'>
			<c:if test="${productVo.startPage > productVo.pageRange}">
            	<a href="javascript:getProductList(${productVo.startPage - 1 },'${productVo.orderby }', '${productVo.direct}', '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');"><</a>
            </c:if>
            <c:forEach var="rp" begin="${productVo.startPage}" end="${productVo.endPage }">
            	<c:if test="${rp==productVo.reqPage }">
            		<a href="javascript:getProductList(${rp }, '${productVo.orderby }', '${productVo.direct}', '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');" >
            			<strong>${productVo.reqPage}</strong>
            		</a>
            	</c:if>
            	<c:if test="${rp!=productVo.reqPage }">
	                <a href="javascript:getProductList(${rp }, '${productVo.orderby }', '${productVo.direct}', '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');" >
	                	${rp }
	                </a>
                </c:if>
            </c:forEach>
            <c:if test="${productVo.totPage > productVo.endPage}">
            	<a href="javascript:getProductList(${productVo.endPage + 1 }, '${productVo.orderby }', '${productVo.direct}', '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');">></a>
            </c:if>
		</div>
		<form name="searchForm" id="searchForm" action=""  method="get">
			<div class="search">
				<select id="orderby" name="orderby" class="dSelect" title="정렬기준" onchange="getProductList(${productVo.reqPage }, $('#orderby').val(), '${productVo.direct}', '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');">
					<option value="pregdate" <c:if test="${param.orderby == 'pregdate' }">selected</c:if>>등록일</option>
					<option value="pcount" <c:if test="${param.orderby == 'pcount' }">selected</c:if>>재고량</option>
				</select>
				<select id="direct" name="orderby" class="dSelect" title="정렬순서" onchange="getProductList(${productVo.reqPage }, '${productVo.orderby }', $('#direct').val(), '${productVo.stype}', '${productVo.tval}', '${productVo.cval}', '${productVo.sval }');">
					<option value="desc" <c:if test="${param.direct== 'desc' }">selected</c:if>>내림차순</option>
					<option value="asc" <c:if test="${param.direct == 'asc' }">selected</c:if>>오름차순</option>
				</select>
				<select name="stype" title="검색분류선택">
				<option value="pname"
					<c:if test="${param.stype=='pname' }">selected</c:if>>상품명</option>
				<option value="pcompany"
						<c:if test="${param.stype=='pcompany' }">selected</c:if>>브랜드명</option>
				</select> 
				
				<select id="tval" name="tval" onchange="categoryChange()" title="상품종류">
					<option value="">전체</option>
					<option value="냉장고"
						<c:if test="${param.tval=='냉장고' }">selected</c:if>>냉장고</option>
					<option value="에어컨"
						<c:if test="${param.tval=='에어컨' }">selected</c:if>>에어컨</option>
					<option value="TV"
						<c:if test="${param.tval=='TV' }">selected</c:if>>TV</option>
					<option value="세탁기"
						<c:if test="${param.tval=='세탁기' }">selected</c:if>>세탁기</option>
				</select>
				
				<select id="cval" name="tval" title="상품카테고리">
					
				</select>
				<input type="text" id="sval" name="sval" value="${param.sval }" title="검색할 내용을 입력해주세요" />
				<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
			</div>
		</form>
	</div>
</div>