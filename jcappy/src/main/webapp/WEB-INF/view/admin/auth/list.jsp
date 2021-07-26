<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
function checkDelete(name) {

	var count = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked"))
		count++;
	}

	if (count == 0) {
		alert('체크된 항목이 없습니다.');
		return false;
	} else {
		if (confirm('총 ' + count + '건을 삭제하시겠습니까?')) {
			$('#frm').submit();
		}
	}
}

function checkAll(name) {

	if ($('#allChk').prop("checked")) {
		$('input[name="' + name + '"]').prop("checked", true);
	} else {
		$('input[name="' + name + '"]').prop("checked", false);
	}
}

function checkOne(name) {
	
	var count = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked"))
		count++;
	}
	
	if (count == $('input[name="' + name + '"]').length) {
		$('#allChk').prop("checked", true);
	} else {
		$('#allChk').prop("checked", false);
	}
}
</script>
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
					<div id="admin_list">
						<div id="bbs">
							<div id="blist">
								<p><span><strong>총 ${adminVo.totCount }개</strong>  |  ${adminVo.reqPage }/${adminVo.totPage }페이지</span></p>
								<form name="frm" id="frm" action="groupDelete" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
										<colgroup>
											<col class="w6" />
											<col class="w15" />
											<col class="w15" />
											<col class="w15" />
											<col class="w7" />
											<col class="w7" />
											<col class="w7" />
											<col class="w7" />
											<col class="w7" />
											<col class="w7" />
											<col class="w7" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll('anos');"/></th>
												<th scope="col">관리자 계정</th>
												<th scope="col">관리자 이름</th> 
												<th scope="col">등록일</th> 
												<th scope="col">상품관리</th> 
												<th scope="col">주문관리</th> 
												<th scope="col">회원관리</th> 
												<th scope="col">게시판관리</th> 
												<th scope="col">부가기능관리</th> 
												<th scope="col">매출조회</th> 
												<th scope="col" class="last">관리자계정</th>
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
															<td class="first"><input type="checkbox" name="anos" value="${vo.ano }" onClick="checkOne('anos');"/></td>
															<td><a href="detail?ano=${vo.ano }&orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.reqPage}">${vo.aid }</a></td>
															<td>${vo.aname}</td>
															<td class="date"><fmt:formatDate value="${vo.aregdate }" pattern="yyyy-MM-dd"/></td>
															<td>${vo.admin_product eq 1 ? "○": "-"}</td>
															<td>${vo.admin_order eq 1 ? "○": "-"}</td>
															<td>${vo.admin_members eq 1 ? "○": "-"}</td>
															<td>${vo.admin_board eq 1 ? "○": "-"}</td>
															<td>${vo.admin_add eq 1 ? "○": "-"}</td>
															<td>${vo.admin_account eq 1 ? "○": "-"}</td>
															<td>${vo.admin_auth eq 1 ? "○": "-"}</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="javascript:checkDelete('anos');" onclick=""><strong>삭제</strong></a>
									</div>
									<div class="btnRight">
										<a class="wbtn" href="create"><strong>등록</strong> </a>
									</div>
								</div>
								<!--//btn-->
								<!-- 페이징 처리 -->
								<div class='page'>
		                        	<c:if test="${adminVo.endPage > adminVo.pageRange}">
		                        		<a href="index.do?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.startPage - 1 }">이전</a>
		                        	</c:if>
		                        	
		                        	<c:forEach var="page" begin="${adminVo.startPage }" end="${adminVo.endPage }">
		                        	    <c:if test="${adminVo.reqPage == page }">
			                        	    <a href='list?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${page}'>
			                        	    	<strong>
				                        	    	${page }
				                        	    </strong>
			                        	    </a>
		                        	    </c:if>
		                        	    <c:if test="${adminVo.reqPage != page }">
			                        	    <a href='list?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${page}'>
			                        	    	${page }
			                        	    </a>
		                        	    </c:if>
		                       		</c:forEach>
		                       		
		                       		<c:if test="${adminVo.endPage < adminVo.totPage }">
		                        		<a href="list?orderby=${adminVo.orderby}&direct=${adminVo.direct}&pageRow=${adminVo.pageRow}&stype=${adminVo.stype }&sval=${adminVo.sval }&reqPage=${adminVo.endPage + 1 }">다음</a>
		                        	</c:if>	
								</div>
								<!-- //페이징 처리 -->
								<form name="searchForm" id="searchForm" action="list"  method="post">
									<div class="search">
											<select id="orderby" name="orderby" class="dSelect" title="정렬기준" onchange="$('#searchForm').submit()">
												<option value="aregdate" <c:if test="${param.orderby == 'aregdate' }">selected</c:if>>등록일</option>
												<option value="aname" <c:if test="${param.orderby == 'aname' }">selected</c:if>>이름</option>
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
</div>	
</body>
</html>