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
					<h2>공지게시판 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 111개</strong>  |  1/12페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="" />
									<col class="w4" />
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
									<tr>
										<td class="first">1</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">1번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">232</td>
									</tr>
									<tr>
										<td class="first">2</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">2번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">564</td>
									</tr>
									<tr>
										<td class="first">3</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">3번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">545</td>
									</tr>
									<tr>
										<td class="first">4</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">4번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">423</td>
									</tr>
									<tr>
										<td class="first">5</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">5번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">124</td>
									</tr>
									<tr>
										<td class="first">6</td>
										<td class="title"><a href="<%=request.getContextPath()%>/admin/board/notice_view.do">6번째 공지입니다.</a></td>
										<td>2021-7-24</td>
										<td class="last">514</td>
									</tr>
								</tbody>
							</table>
							</form>
							<!--//btn-->
							<div class="btn">
								<div class="btnRight">
									<a class="wbtn" href="<%=request.getContextPath()%>/admin/board/notice_write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!-- 페이징 처리 -->
							<div class='page'>
								<strong>1</strong>
								<a href="">2</a>
								<a href="">3</a>
								<a href="">4</a>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
									</select>
									<input type="text" name="sval" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
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