<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>공지게시판 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${noticeVo.totCount}개</strong>  |  ${noticeVo.reqPage}/${noticeVo.totPage }페이지</span></p>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="" />
									<col class="w15" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th>
										<th scope="col" class="last">조회수</th>
										
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="4">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
									<c:forEach var="vo" items="${list}">
									<tr>
										<td class="first">${vo.nno}</td>
										<!-- 상세페이지 링크 and 리플 갯수 -->
										<td class="title"><a href="detail?nno=${vo.nno}&reqPage=${noticeVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">${vo.ntitle} [${vo.comment_count}]</a></td>
										<td><fmt:formatDate value="${vo.nregdate }" pattern="yyyy-MM-dd"/> </td> <!-- 년월일 포맷 폼 -->
										<td>${vo.nreadcount}</td>
									</tr>
									
																
									</c:forEach>
									
								</tbody>
							</table>
							<!--//btn-->
							<div class="btn">
								<div class="btnRight">
									<a class="wbtn" href="write?reqPage=${noticeVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><strong>등록</strong> </a>
								</div>
							</div>
							<!-- 페이징 처리 -->
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
							<!-- //페이징 처리 -->
							<!-- 검색 조건들 -->
							<form name="searchForm" id="searchForm" action="list"  method="post">
								<div class="search">
									 <select id="orderby" name="orderby" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="nregdate" <c:if test="${param.orderby=='nregdate'}">selected</c:if>>작성일</option>
	                                    <option value="nreadcount" <c:if test="${param.orderby=='nreadcount'}">selected</c:if>>조회수</option>
	                                </select>
	                                <select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="DESC" <c:if test="${param.direct=='DESC'}">selected</c:if>>내림차순</option>
	                                    <option value="ASC" <c:if test="${param.direct=='ASC'}">selected</c:if>>오름차순</option>
	                                </select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="ntitle" <c:if test="${param.stype=='ntitle'}">selected</c:if>>제목</option>
										<option value="ncontent" <c:if test="${param.stype=='ncontent'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="sval" value="${param.sval }"  title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();" />
								</div>
							</form>
							<!-- //검색 조건들 -->
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
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