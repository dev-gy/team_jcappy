<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>주문관리 - [목록]</h2>
				</div>
				<div class="con">
					<div id="admin_members_list">
						<div id="bbs">
							<div id="blist">
								<p><span><strong>총 ${orderinfoVo.totCount }개</strong>  |  ${orderinfoVo.reqPage }/${orderinfoVo.totPage }페이지</span></p>
								<form name="frm" id="frm" action="groupDelete" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문목록">
										<colgroup>
											<col class="w7" />
											<col class="w21" />
											<col class="w28" />
											<col class="w15" />
											<col class="w7" />
											<col class="w15" />
											<col class="w7" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">주문번호</th>
												<th scope="col">주문자명</th> 
												<th scope="col">주문상품</th> 
												<th scope="col">주문일</th> 
												<th scope="col">주문상태</th> 
												<th scope="col">주문금액</th> 
												<th scope="col" class="last">배송상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="10">주문이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td class="first"><a href="detail?mno=${vo.mno }&orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.reqPage}">${vo.mno }</a></td>
															<td>${vo.memail}</td>
															<td>${vo.mname}</td>
															<td>${vo.mphone}</td>
															<td>${vo.mphone}</td>
															<td>${vo.mgrade}</td>
															<td class="date"><fmt:formatDate value="${vo.mregdate }" pattern="yyyy-MM-dd"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="javascript:checkDelete('mnos');" onclick=""><strong>삭제</strong></a>
									</div>
								</div>
								<!--//btn-->
								<!-- 페이징 처리 -->
								<div class='page'>
		                        	<c:if test="${orderinfoVo.endPage > orderinfoVo.pageRange}">
		                        		<a href="index.do?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.startPage - 1 }">이전</a>
		                        	</c:if>
		                        	
		                        	<c:forEach var="page" begin="${orderinfoVo.startPage }" end="${orderinfoVo.endPage }">
		                        	    <c:if test="${orderinfoVo.reqPage == page }">
			                        	    <a href='list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${page}'>
			                        	    	<strong>
				                        	    	${page }
				                        	    </strong>
			                        	    </a>
		                        	    </c:if>
		                        	    <c:if test="${orderinfoVo.reqPage != page }">
			                        	    <a href='list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${page}'>
			                        	    	${page }
			                        	    </a>
		                        	    </c:if>
		                       		</c:forEach>
		                       		
		                       		<c:if test="${orderinfoVo.endPage < orderinfoVo.totPage }">
		                        		<a href="list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.endPage + 1 }">다음</a>
		                        	</c:if>	
								</div>
								<!-- //페이징 처리 -->
								<form name="searchForm" id="searchForm" action="list"  method="post">
									<div class="search">
											<select id="orderby" name="orderby" class="dSelect" title="정렬기준" onchange="$('#searchForm').submit()">
												<option value="mregdate" <c:if test="${param.orderby == 'mregdate' }">selected</c:if>>등록일</option>
												<option value="memail" <c:if test="${param.orderby == 'memail' }">selected</c:if>>이메일</option>
												<option value="mname" <c:if test="${param.orderby == 'mname' }">selected</c:if>>이름</option>
											</select>
											<select id="direct" name="direct" class="dSelect" title="정렬순서" onchange="$('#searchForm').submit()">
												<option value="DESC" <c:if test="${param.direct== 'DESC' }">selected</c:if>>내림차순</option>
												<option value="ASC" <c:if test="${param.direct == 'ASC' }">selected</c:if>>오름차순</option>
											</select>
											<select id="pageRow" name="pageRow" class="dSelect" title="출력갯수" onchange="$('#searchForm').submit()">
												<option value="10" <c:if test="${param.pageRow == '10' }">selected</c:if>>10</option>
												<option value="20" <c:if test="${param.pageRow == '20' }">selected</c:if>>20</option>
												<option value="30" <c:if test="${param.pageRow == '30' }">selected</c:if>>30</option>
											</select>
											<select id="stype" name="stype" class="dSelect" title="검색분류">
												<option value="all">전체</option>
												<option value="memail" <c:if test="${param.stype == 'memail' }">selected</c:if>>이메일</option>
												<option value="mname" <c:if test="${param.stype == 'mname' }">selected</c:if>>이름</option>
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
</div>	
</body>
</html>