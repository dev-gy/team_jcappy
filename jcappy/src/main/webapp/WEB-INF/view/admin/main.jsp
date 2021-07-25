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
					<h2>메인</h2>
				</div>
				<div class="con">
					<!-- 내용 : s -->
					<div id="admin_main">
						<div id="bbs">
							<div id="blist">
								<div class="admin_main_table">
									<div onClick="location.href='product/list';">
										<input type="text" name="admin_main_title" value="품절 임박 상품" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">임시</th>
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="4" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div onClick="location.href='';">
										<input type="text" name="admin_main_title" value="최근 등록 게시글" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">임시</th>
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="4" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div onClick="location.href='';">
										<input type="text" name="admin_main_title" value="최근 주문 목록" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">임시</th>
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="4" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="admin_main_table">
									<div onClick="location.href='';">
										<input type="text" name="admin_main_title" value="매출조회" disabled size="30">
									</div>
									<table>
										<colgroup>
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
											<col class="w25" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">임시</th>
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
												<th scope="col">임시</th> 
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="4" height="150px">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
															<td>임시</td>
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