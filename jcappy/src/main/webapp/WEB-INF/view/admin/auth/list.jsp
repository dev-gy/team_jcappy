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
					<h2>관리자계정 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${adminVo.totalCount }개</strong>  |  ${adminVo.reqPage }/${adminVo.totalPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
									<colgroup>
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
										<col class="w10" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll('nos');"/></th>
											<th scope="col">번호</th>
											<th scope="col">제목</th> 
											<th scope="col">작성일</th> 
											<th scope="col">작성일</th> 
											<th scope="col">작성일</th> 
											<th scope="col">작성일</th> 
											<th scope="col">작성일</th> 
											<th scope="col">작성자</th> 
											<th scope="col" class="last">조회수</th>
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
														<td class="first"><input type="checkbox" name="nos" value="${vo.no }" onClick="checkOne('nos');"/></td>
														<td>${(adminVo.totalCount - status.index) - ((adminVo.reqPage - 1) * adminVo.pageRow) }</td>
														<td class="txt_l" style="text-align: left; padding-left: 10px;">
															<a href="detail.do?no=${vo.no }&orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.reqPage}">
																${vo.title }[${vo.commentCount }]
															</a>
														</td>
														<td class="date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
														<td class="writer">${vo.name }</td>
														<td class="readcount">${vo.readcount}</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:checkDelete('nos');" onclick=""><strong>삭제</strong></a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
	                        	<c:if test="${adminVo.endPage > adminVo.pageRange}">
	                        		<a href="index.do?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.startPage - 1 }">이전</a>
	                        	</c:if>
	                        	
	                        	<c:forEach var="page" begin="${adminVo.startIdx }" end="${adminVo.endPage }">
	                        	    <c:if test="${adminVo.reqPage == page }">
		                        	    <a href='index.do?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${page}'>
		                        	    	<strong>
			                        	    	${page }
			                        	    </strong>
		                        	    </a>
	                        	    </c:if>
	                        	    <c:if test="${adminVo.reqPage != page }">
		                        	    <a href='index.do?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${page}'>
		                        	    	${page }
		                        	    </a>
	                        	    </c:if>
	                       		</c:forEach>
	                       		
	                       		<c:if test="${adminVo.endPage < adminVo.totalPage }">
	                        		<a href="index.do?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.endPage + 1 }">다음</a>
	                        	</c:if>	
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
										<select id="orderby" name="orderby" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit()">
											<option value="aregdate" <c:if test="${param.orderby == 'aregdate' }">selected</c:if>>등록일</option>
											<option value="aname" <c:if test="${param.orderby == 'aname' }">selected</c:if>>이름</option>
										</select>
										<select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit()">
											<option value="DESC" <c:if test="${param.direct== 'DESC' }">selected</c:if>>내림차순</option>
											<option value="ASC" <c:if test="${param.direct == 'ASC' }">selected</c:if>>오름차순</option>
										</select>
										<select id="pageRow" name="pageRow" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit()">
											<option value="10" <c:if test="${param.pageRow == '10' }">selected</c:if>>10</option>
											<option value="20" <c:if test="${param.pageRow == '20' }">selected</c:if>>20</option>
											<option value="30" <c:if test="${param.pageRow == '30' }">selected</c:if>>30</option>
										</select>
										<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
											<option value="all">전체</option>
											<option value="aid" <c:if test="${param.stype == 'aid' }">selected</c:if>>아이디</option>
											<option value="aname" <c:if test="${param.stype == 'aname' }">selected</c:if>>이름</option>
										</select>
									<input type="text" name="sval" value="${param.sval }" title="검색할 내용을 입력해주세요" />
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