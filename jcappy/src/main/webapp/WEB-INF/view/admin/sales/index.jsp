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
							<p><span><strong>총 111개</strong>  |  1/12페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">년</th>
										<th scope="col">월</th> 
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
										<td><fmt:formatNumber type="number" value="${vo.price}"/>원</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							
							<!-- //페이징 처리 -->
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>	
</body>
</html>
