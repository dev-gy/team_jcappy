<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<script>
$(function(){
	$('#datepicker').datepicker({
		dateFormat:"yymmdd"    // 날짜 출력폼 설정
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
	});
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
									<c:if test="${!empty daySelect}">
									<col class="w10" />
									</c:if>
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">년</th>
										<th scope="col">월</th> 
										<c:if test="${!empty daySelect}">
										<th scope="col">일</th>
										</c:if> 
										<th scope="col">매출액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list}" >
									<tr>
										<td class="first">${vo.year}</td>
										<td>${vo.month }</td>
										<td><fmt:formatNumber type="number" value="${vo.price}"/>원</td>
									</tr>
									</c:forEach>
									<c:if test="${!empty daySelect}">
									<tr>
										<td class="first">${daySelect.year}</td>
										<td>${daySelect.month }</td>
										<td>${daySelect.day }</td>
										<td><fmt:formatNumber type="number" value="${daySelect.price}"/>원</td>
									</tr>
									</c:if>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							<c:if test="${empty daySelect}">
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
							</c:if>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index"  method="post">
								<div class="search">
	                                <input type="text" id="datepicker" name="datepicker">
	                                <input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();" />
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
