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
					<h2>주문관리 - [목록]</h2>
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
									<col class="w4" />
									<col class="w4" />
									<col class="w6" />
									<col class="w10" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">주문번호</th>
										<th scope="col">배송상태</th> 
										<th scope="col">결제명</th> 
										<th scope="col">주문날짜</th>
										<th scope="col" class="last">요청사항</th>
										
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">1</a></td>
										<td>배송완료</td>
										<td>신용카드</td>
										<td>2021-7-24</td>
										<td class="last">문앞에 나두어주세요</td>
									</tr>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">2</a></td>
										<td>배송완료</td>
										<td>신용카드</td>
										<td>2021-7-24</td>
										<td class="last">경비실에 맡겨주세요</td>
									</tr>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">3</a></td>
										<td>배송중</td>
										<td>무통장입금</td>
										<td>2021-7-24</td>
										<td class="last">문앞에 나두어주세요</td>
									</tr>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">4</a></td>
										<td>배송중</td>
										<td>무통장입금</td>
										<td>2021-7-24</td>
										<td class="last">경비실에 맡겨주세요</td>
									</tr>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">5</a></td>
										<td>배송중</td>
										<td>휴대폰결제</td>
										<td>2021-7-24</td>
										<td class="last">문앞에 나두어주세요</td>
									</tr>
									<tr>
										<td class="first"><a href="<%=request.getContextPath()%>/admin/order/order_view.do">6</a></td>
										<td>배송중</td>
										<td>휴대폰결제</td>
										<td>2021-7-24</td>
										<td class="last">경비실에 맡겨주세요</td>
									</tr>
								</tbody>
							</table>
							</form>
							<!--//btn-->
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
										<option value="title">요청사항</option>
										<option value="contents">배송상태</option>
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