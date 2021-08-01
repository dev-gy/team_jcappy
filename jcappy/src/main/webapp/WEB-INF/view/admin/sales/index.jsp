<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<title>Insert title here</title>
</head>
<script>
$(function(){
	var Year=document.getElementById('year').value;
	var Month=document.getElementById('month').value;
	var day=new Date(new Date(Year,Month,1)-86400000).getDate();
	/* = new Date(new Date(Year,Month,0)).getDate(); */
	var dayindex_len=document.getElementById('day').length;
	if(day>dayindex_len){ 
		for(var i=(dayindex_len+1); i<=day; i++){ 
			document.getElementById('day').options[i-1] = new Option(i, i);
		} 
	} 
});

</script>
<body>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>매출조회 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${salesVo.totCount }개</strong>  |  ${salesVo.reqPage}/${salesVo.totPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">년</th>
										<th scope="col">월</th> 
										<th scope="col">일</th> 
										<th scope="col">매출액</th> 
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="4">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
									<c:forEach var="vo" items="${list}" >
									<tr>
										<td class="first">${vo.year}</td>
										<td>${vo.month }</td>
										<td>${vo.day}</td>
										<td><fmt:formatNumber type="number" value="${vo.price}"/>원</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							<div class='page'>
		                        <c:if test="${salesVo.startPage > salesVo.pageRange}">
		                        	<span><a href="index?reqPage=${salesVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a></span>
		                        </c:if>
		                        <c:forEach var="rp" begin="${salesVo.startPage}" end="${salesVo.endPage }">
		                        <c:if test="${salesVo.reqPage == rp }">
									<span><a href='index?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'><strong>${rp }</strong></a></span>
		                        </c:if>
		                        <c:if test="${salesVo.reqPage != rp }">
		                            <span><a href='index?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'>${rp }</a></span>
		                        </c:if>
		                        </c:forEach>
		                        <c:if test="${salesVo.totPage > salesVo.endPage}">
		                        	<span><a href="index?reqPage=${salesVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a></span>
		                        </c:if>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index"  method="post">
								<div class="search">
	                                <select id="year" name="year" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="2021" <c:if test="${param.year=='2021'}">selected</c:if>>2021</option>
	                                    <option value="2020" <c:if test="${param.year=='2020'}">selected</c:if>>2020</option>
	                                    <option value="2019" <c:if test="${param.year=='2019'}">selected</c:if>>2019</option>
	                                </select>
	                                <select id="month" name="month" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="1" <c:if test="${param.month=='1'}">selected</c:if>>1월</option>
	                                    <option value="2" <c:if test="${param.month=='2'}">selected</c:if>>2월</option>
	                                    <option value="3" <c:if test="${param.month=='3'}">selected</c:if>>3월</option>
	                                    <option value="4" <c:if test="${param.month=='4'}">selected</c:if>>4월</option>
	                                    <option value="5" <c:if test="${param.month=='5'}">selected</c:if>>5월</option>
	                                    <option value="6" <c:if test="${param.month=='6'}">selected</c:if>>6월</option>
	                                    <option value="7" <c:if test="${param.month=='7'}">selected</c:if>>7월</option>
	                                    <option value="8" <c:if test="${param.month=='8'}">selected</c:if>>8월</option>
	                                    <option value="9" <c:if test="${param.month=='9'}">selected</c:if>>9월</option>
	                                    <option value="10" <c:if test="${param.month=='10'}">selected</c:if>>10월</option>
	                                    <option value="11" <c:if test="${param.month=='11'}">selected</c:if>>11월</option>
	                                    <option value="12" <c:if test="${param.month=='12'}">selected</c:if>>12월</option>
	                                </select>
	                                <select id="day" name="day" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                </select>
								</div>
							</form>
							<!-- //search -->
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>	
</body>
</html>
