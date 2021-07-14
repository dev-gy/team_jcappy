<%@ page contentType="text/html; charset=utf-8" %>
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
					<h2>매출조회 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 111개</strong>  |  1/12페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">매출날짜</th>
										<th scope="col">상품판매량</th> 
										<th scope="col">매출액</th> 



									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first">2021-06</td>
										<td>123</td>
										<td>23,463,560</td>
									</tr>
									<tr>
										
										<td class="first">2021-05</td>
										<td>324</td>
										<td>21,253,560</td>
									</tr>
									<tr>
										<td class="first">2021-04</td>
										<td>423</td>
										<td>26,267,560</td>
									</tr>
									<tr>
										<td class="first">2021-03</td>
										<td>56</td>
										<td>11,293,560</td>
									</tr>
									<tr>
										<td class="first">2021-02</td>
										<td>324</td>
										<td>24,763,560</td>
									</tr>
									<tr>
										<td class="first">2021-01</td>
										<td>145</td>
										<td>21,223,560</td>
									</tr>
								</tbody>
							</table>
							</form>
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
										<option value="salesDay">매출날짜</option>
										<option value="productSale">상품판매량</option>
										<option value="salesMoney">매출액</option>
									</select>
									<input type="text" name="sval" value="" title="검색할 내용을 입력해주세요" />
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
