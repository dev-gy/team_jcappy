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
					<h2>관리자계정 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 5개</strong>  |  1/1페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 목록">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">관리자 등급</th>
										<th scope="col">관리자 아이디</th> 
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>운영자</td>
										<td>admin</td>
									</tr>
									<tr>
										<td>부운영자</td>
										<td>test1</td>
									</tr>
									<tr>
										<td>부운영자</td>
										<td>test2</td>
									</tr>
									<tr>
										<td>부운영자</td>
										<td>test3</td>
									</tr>
									<tr>
										<td>부운영자</td>
										<td>test4</td>
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
							<div class="btn">
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href=""><strong>관리자계정 생성</strong></a>
								</div>
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