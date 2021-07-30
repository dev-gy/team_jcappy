<%@ page contentType="text/html; charset=utf-8" %>
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
					<h2>리뷰게시판 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${reviewVo.totCount}개</strong>  | ${reviewVo.reqPage}/${reviewVo.totPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3" />
									<col class="*" />
									<col class="w15" />
									<col class="w6" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">[상품명]제목</th> 
										<th scope="col">작성자(이메일)</th>
										<th scope="col">작성일</th>
										<th scope="col" class="last">조회수</th>
										
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
									<c:forEach var="vo" items="${list}" varStatus="status">
									<tr>
										<td class="first">${(reviewVo.totCount-status.index)-((reviewVo.reqPage-1)*reviewVo.pageRow)}</td>
										<!-- 상세페이지 링크 and 리플 갯수 -->
										<td class="title"><a href="detail?rno=${vo.rno}&reqPage=${reviewVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><strong style="font-size: 15px;">[${vo.pname}]</strong> ${vo.rtitle} [${vo.comment_count}]</a></td>
										<td>${vo.mname }(${vo.memail})</td>
										<td><fmt:formatDate value="${vo.rregdate }" pattern="yyyy-MM-dd"/> </td> <!-- 년월일 포맷 폼 -->
										<td>${vo.rreadcount}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
		                        <c:if test="${reviewVo.startPage > reviewVo.pageRange}">
		                        	<span><a href="list?reqPage=${reviewVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a></span>
		                        </c:if>
		                        <c:forEach var="rp" begin="${reviewVo.startPage}" end="${reviewVo.endPage }">
		                        <c:if test="${reviewVo.reqPage == rp }">
									<span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'><strong >${rp }</strong></a></span>
		                        </c:if>
		                        <c:if test="${reviewVo.reqPage != rp }">
		                            <span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'>${rp }</a></span>
		                        </c:if>
		                        </c:forEach>
		                        <c:if test="${reviewVo.totPage > reviewVo.endPage}">
		                        	<span><a href="list?reqPage=${reviewVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a></span>
		                        </c:if>
							</div>
							<!-- //페이징 처리 -->
							<!-- 검색 조건들 -->
							<form name="searchForm" id="searchForm" action="list"  method="post">
								<div class="search">
									 <select id="orderby" name="orderby" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="rregdate" <c:if test="${param.orderby=='rregdate'}">selected</c:if>>작성일</option>
	                                    <option value="rreadcount" <c:if test="${param.orderby=='rreadcount'}">selected</c:if>>조회수</option>
	                                </select>
	                                <select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="DESC" <c:if test="${param.direct=='DESC'}">selected</c:if>>내림차순</option>
	                                    <option value="ASC" <c:if test="${param.direct=='ASC'}">selected</c:if>>오름차순</option>
	                                </select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="rtitle" <c:if test="${param.stype=='rtitle'}">selected</c:if>>제목</option>
										<option value="rcontent" <c:if test="${param.stype=='rcontent'}">selected</c:if>>내용</option>
										<option value="mname" <c:if test="${param.stype=='mname'}">selected</c:if>>작성자</option>
										<option value="memail" <c:if test="${param.stype=='memail'}">selected</c:if>>이메일</option>
										<option value="pname" <c:if test="${param.stype=='pname'}">selected</c:if>>상품명</option>
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