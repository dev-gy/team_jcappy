<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="bbs" class="admin_members_detail_table">
	<div id="blist">
		<div class="admin_members_detail_subtitle">
			<div>
					<input type="text" name="admin_members_detail_subtitle2" value="작성게시글" disabled size="30">
			</div>
			<c:if test="${membersVo.totCount != 0}">
				<p><span><strong>총 ${membersVo.totCount }개</strong>  |  ${membersVo.reqPage }/${membersVo.totPage }페이지</span></p>
			</c:if>
			<form name="frm" id="frm" action="groupDelete" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="작성글목록">
					<colgroup>
						<col class="w20" />
						<col class="w60" />
						<col class="w20" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"class="first">분류</th>
							<th scope="col">제목</th> 
							<th scope="col" class="last">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td class="first" colspan="10">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty list }">
								<c:forEach var="vo" items="${list }" varStatus="status">
									<tr>
										<td class="first"><a href="detail?mno=${vo.mno }&orderby=${membersVo.orderby}&direct=${membersVo.direct}&pageRow=${membersVo.pageRow}&reqPage=${membersVo.reqPage}">${vo.cate }</a></td>
										<td>${vo.title}</td>
										<td class="date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 페이징 처리 -->
		<div class='page'>
	       	<c:if test="${membersVo.endPage > membersVo.pageRange}">
	       		<a href="javascript:getBoardList(${membersVo.startPage - 1 });">이전</a>
	       	</c:if>
	       	
	       	<c:forEach var="page" begin="${membersVo.startPage }" end="${membersVo.endPage }">
	       	    <c:if test="${membersVo.reqPage == page }">
	        	    <a href="javascript:getBoardList(${page});">
	        	    	<strong>
	         	    	${page }
	         	    </strong>
	        	    </a>
	       	    </c:if>
	       	    <c:if test="${membersVo.reqPage != page }">
	        	    <a href="javascript:getBoardList(${page});">
	        	    	${page }
	        	    </a>
	       	    </c:if>
	      		</c:forEach>
	      		
	      		<c:if test="${membersVo.endPage < membersVo.totPage }">
	       		<a href="javascript:getBoardList(${membersVo.endPage + 1 });">다음</a>
	       	</c:if>	
		</div>
		<!-- //페이징 처리 -->
	</div>
</div>
