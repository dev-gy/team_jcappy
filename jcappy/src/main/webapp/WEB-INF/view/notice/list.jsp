<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">

			<div class="notice_content">
				<div class="title">
					<h1 class="cstyle_h1">공지사항</h1>
				</div>
				<table class="cstyle_table">
					<colgroup>
						<col width="100px">
						<col>
						<col width="120px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list }">
                        <tr>
                            <td class="first" colspan="4">등록된 글이 없습니다.</td>
                        </tr>
                    </c:if>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td class="first">${(noticeVo.totCount-status.index)-((noticeVo.reqPage-1)*noticeVo.pageRow)}</td>
							<td class="qtitle"><a href="detail?nno=${vo.nno}&reqPage=${noticeVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">${vo.ntitle} [${vo.comment_count}]</a></td>
							<td><fmt:formatDate value="${vo.nregdate }" pattern="yyyy-MM-dd"/> </td> <!-- 년월일 포맷 폼 -->
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class='page'>
	                <c:if test="${noticeVo.startPage > noticeVo.pageRange}">
	                	<span><a href="list?reqPage=${noticeVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a></span>
	                </c:if>
	                <c:forEach var="rp" begin="${noticeVo.startPage}" end="${noticeVo.endPage }">
	                <c:if test="${noticeVo.reqPage == rp }">
						<span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'><strong>${rp }</strong></a></span>
	                </c:if>
	                <c:if test="${noticeVo.reqPage != rp }">
	                    <span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'>${rp }</a></span>
	                </c:if>
	                </c:forEach>
	                <c:if test="${noticeVo.totPage > noticeVo.endPage}">
	                	<span><a href="list?reqPage=${noticeVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a></span>
	                </c:if>
				</div>
				<form name="searchForm" id="searchForm" action="list"  method="post">
					<div class="search">
						<select name="stype" title="검색을 선택해주세요">
							<option value="all">전체</option>
							<option value="ntitle" <c:if test="${param.stype=='ntitle'}">selected</c:if>>제목</option>
							<option value="ncontent" <c:if test="${param.stype=='ncontent'}">selected</c:if>>내용</option>
						</select>
						<input type="text" name="sval" value="${param.sval }"  title="검색할 내용을 입력해주세요" />
						<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();" />
					</div>
				</form>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>