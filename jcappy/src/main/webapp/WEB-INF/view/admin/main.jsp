<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
// 품절 임박 상품 : 상품번호 클릭 시, 해당 상품 상세페이지로 이동
function admin_main_go_product(no) {
	location.href='product/detail?pno=' + no;
}

// 품절임박상품 : 타이틀 클릭 시, 상품목록으로 이동, 재고 적은 순 정렬
function admin_main_go_productList() {
	location.href='product/list?orderby=pcount&direct=asc';
}

//
function admin_main_go_orderList() {
	location.href='order/list';
}

//
function admin_main_go_sales() {
	location.href='sales/index';
}

//최근 등록 게시글 : 글 제목 클릭 시, 해당 글 상세페이지로 이동
function admin_main_go_board(cate, no) {
	if (cate == '문의') {
		location.href='<%=request.getContextPath()%>/admin/board/qna/detail?qno=' + no;
	} else if (cate == '리뷰') {
		location.href='<%=request.getContextPath()%>/admin/board/review/detail?rno=' + no;
	} else if (cate == '공지') {
		location.href='<%=request.getContextPath()%>/admin/board/notice/detail?nno=' + no;
	}
}

// 최근 등록 게시글 : 분류 클릭 시, 해당 게시판관리로 이동
function admin_main_go_boardList(cate) {
	if (cate == '문의') {
		location.href='<%=request.getContextPath()%>/admin/board/qna/list';
	} else if (cate == '리뷰') {
		location.href='<%=request.getContextPath()%>/admin/board/review/list';
	} else if (cate == '공지') {
		location.href='<%=request.getContextPath()%>/admin/board/notice/list';
	}
}
</script>
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
					<h2>메인</h2>
				</div>
				<div class="con">
					<!-- 내용 : s -->
					<div id="admin_main">
						<div id="bbs">
							<div id="blist">
								<div class="admin_main_table">
									<div onClick="admin_main_go_productList();">
										<input type="text" name="admin_main_title" value="품절 임박 상품" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col width="*" />
											<col class="w25" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">상품번호</th>
												<th scope="col">상품명</th> 
												<th scope="col" class="last">재고</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty productList }">
													<tr>
														<td class="first" colspan="3" height="150px">등록된 상품이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty productList }">
													<c:forEach var="vo" items="${productList }" varStatus="status">
														<tr>
															<td class="first">
																<a href="javascript:admin_main_go_product('${vo.no }');">
																	${vo.no }
																</a>
															</td>
															<td class="title">${vo.name }</td>
															<td class="last">${vo.count }</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div>
										<input type="text" name="admin_main_title" value="최근 등록 게시글" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w10" />
											<col class="w40" />
											<col class="w27" />
											<col class="w16" />
											<col class="w7" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">분류</th>
												<th scope="col">제목</th> 
												<th scope="col">작성자</th> 
												<th scope="col">작성일</th> 
												<th scope="col" class="last">답변</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty boardList }">
													<tr>
														<td class="first" colspan="5" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty boardList }">
													<c:forEach var="vo" items="${boardList }" varStatus="status">
														<tr>
															<td class="first">
																<a href="javascript:admin_main_go_boardList('${vo.cate }');">
																	${vo.cate }
																</a>
															</td>
															<td class="title">
																<a href="javascript:admin_main_go_board('${vo.cate }', ${vo.no });">
																	${vo.title }
																</a>
															</td>
															<td>${vo. name }</td>
															<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
															<td class="last">${vo.isReply }</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div onClick="admin_main_go_orderList();">
										<input type="text" name="admin_main_title" value="최근 주문 목록" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w10" />
											<col class="w30" />
											<col class="w25" />
											<col class="w20" />
											<col class="w15" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">주문번호</th>
												<th scope="col">주문자명</th> 
												<th scope="col">주문금액</th> 
												<th scope="col">주문일</th> 
												<th scope="col" class="last">주문상태</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty orderList }">
													<tr>
														<td class="first" colspan="5" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty orderList }">
													<c:forEach var="vo" items="${orderList }" varStatus="status">
														<tr>
															<td class="first">${vo.no }</td>
															<td>${vo.name }</td>
															<td><fmt:formatNumber value="${vo.price }" pattern="#,###,###원"/></td>
															<td><fmt:formatDate value="${vo.date }" pattern="yyyy-MM-dd"/></td>
															<td class="last">${vo.state }</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div onClick="admin_main_go_sales();">
										<input type="text" name="admin_main_title" value="매출조회" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col class="w25" />
											<col width="*" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">매출년도</th>
												<th scope="col">매출월</th> 
												<th scope="col" class="last">매출금액</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty salesList }">
													<tr>
														<td class="first" colspan="3" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty salesList }">
													<c:forEach var="vo" items="${salesList }" varStatus="status">
														<tr>
															<td class="first">${vo.year }</td>
															<td>${vo.month }</td>
															<td class="last"><fmt:formatNumber value="${vo.price }" pattern="#,###,###원"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
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