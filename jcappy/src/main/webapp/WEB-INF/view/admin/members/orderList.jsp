<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="bbs" class="admin_members_detail_table">
	<div id="blist">
		<div class="admin_members_detail_subtitle">
			<div onClick="location.href='';">
				<input type="text" name="admin_members_detail_subtitle" value="주문목록"
					disabled size="30">
			</div>
			<c:if test="${membersVo.totCount != 0}">
				<p>
					<span><strong>총 ${membersVo.totCount }개</strong> |
						${membersVo.reqPage }/${membersVo.totPage }페이지</span>
				</p>
			</c:if>
			<form name="frm" id="frm" action="groupDelete" method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					summary="주문목록">
					<colgroup>
						<col class="w25" />
						<col class="w25" />
						<col class="w25" />
						<col class="w25" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first">주문일</th>
							<th scope="col">주문번호</th>
							<th scope="col">주문총액</th>
							<th scope="col">주문상태</th>
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
										<td class="first"><fmt:formatDate value="${vo.date }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><a
											href="detail?mno=${vo.mno }&orderby=${membersVo.orderby}&direct=${membersVo.direct}&pageRow=${membersVo.pageRow}&stype=${membersVo.stype }&sval=${membersVo.sval }&reqPage=${membersVo.reqPage}">${vo.no }</a></td>
										<td><fmt:formatNumber value="${vo.price}" pattern="#,###,###원"/></td>
										<td>${vo.state}</td>
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
				<a href="javascript:getOrderList(${membersVo.startPage - 1 });">이전</a>
			</c:if>

			<c:forEach var="page" begin="${membersVo.startPage }"
				end="${membersVo.endPage }">
				<c:if test="${membersVo.reqPage == page }">
					<a href="javascript:getOrderList(${page});"> <strong>
							${page } </strong>
					</a>
				</c:if>
				<c:if test="${membersVo.reqPage != page }">
					<a href="javascript:getOrderList(${page});"> ${page } </a>
				</c:if>
			</c:forEach>

			<c:if test="${membersVo.endPage < membersVo.totPage }">
				<a href="javascript:getOrderList(${membersVo.endPage + 1 });">다음</a>
			</c:if>
		</div>
		<!-- //페이징 처리 -->
	</div>
</div>