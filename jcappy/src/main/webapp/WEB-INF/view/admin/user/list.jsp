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
					<h2>회원관리 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 30개</strong>  |  1/3페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회원 목록">
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
										<th scope="col">회원 번호</th>
										<th scope="col">회원 이메일</th> 
										<th scope="col">회원 이름</th> 
										<th scope="col">회원 연락처</th> 
										<th scope="col">가입일</th> 
										<th scope="col">고객 등급</th> 
										<th scope="col">계정 삭제</th> 
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>test@gmail.com</td>
										<td>손흥민</td>
										<td>01012345678</td>
										<td>20210710</td>
										<td>VIP</td>
										<td>
											<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>test@gmail1.com</td>
										<td>이강인</td>
										<td>01012345678</td>
										<td>20210710</td>
										<td>GOLD</td>
										<td>
											<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>test@gmail2.com</td>
										<td>황의조</td>
										<td>01012345678</td>
										<td>20210710</td>
										<td>SILVER</td>
										<td>
											<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>test@gmail3.com</td>
										<td>김민재</td>
										<td>01012345678</td>
										<td>20210710</td>
										<td>BRONZE</td>
										<td>
											<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td>test@gmail4.com</td>
										<td>이재성</td>
										<td>01012345678</td>
										<td>20210710</td>
										<td>VIP</td>
										<td>
											<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
										</td>
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
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
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