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
					<h2>상품관리 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 x개</strong>  |  1/x페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 목록">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품 번호</th>
										<th scope="col">브랜드</th> 
										<th scope="col">상품명</th> 
										<th scope="col">상품 가격</th> 
										<th scope="col">재고량</th> 
										<th scope="col">상품 등록일</th> 
										<th scope="col">삭제</th> 
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>삼성</td>
										<td>양문형 냉장고1</td>
										<td>1,000,000</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>2021-07-10</td>
										<td><a class="btns" href="#" onclick=""><strong>삭제</strong></a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>삼성</td>
										<td>양문형 냉장고1</td>
										<td>1,000,000</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>2021-07-10</td>
										<td><a class="btns" href="#" onclick=""><strong>삭제</strong></a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>삼성</td>
										<td>양문형 냉장고1</td>
										<td>1,000,000</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>2021-07-10</td>
										<td><a class="btns" href="#" onclick=""><strong>삭제</strong></a></td>
									</tr>
									<tr>
										<td>4</td>
										<td>삼성</td>
										<td>양문형 냉장고1</td>
										<td>1,000,000</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>2021-07-10</td>
										<td><a class="btns" href="#" onclick=""><strong>삭제</strong></a></td>
									</tr>
									<tr>
										<td>5</td>
										<td>삼성</td>
										<td>양문형 냉장고1</td>
										<td>1,000,000</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>2021-07-10</td>
										<td><a class="btns" href="#" onclick=""><strong>삭제</strong></a></td>
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
									<select name="stype" title="브랜드">
										<option value="sam">삼성</option>
										<option value="lg">LG</option>
										<option value="carrier">캐리어</option>
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