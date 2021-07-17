<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">

			<div class="notice_content">
				<div class="title">
					<h1 class="cstyle_h1">공지사항</h1>
				</div>
				<table class="cstyle_table">
					<colgroup>
						<col width="80px">
						<col>
						<col width="100px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="item_no">2</td>
							<td class="item_title cstyle_text_align_left"><a href="">회원정보수정요청</a></td>
							<td class="item_cre_date">2021-05-27</td>
						</tr>
						<tr>
							<td class="item_no">1</td>
							<td class="item_title cstyle_text_align_left"><a href="">회원정보수정요청</a></td>
							<td class="item_cre_date">2021-05-27</td>
						</tr>
					</tbody>
				</table>
				<div>
					<button class="qna_write_btn cstyle_btn" onclick="location.href='/jcappy/notice/write.do'">문의작성</button>
				</div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>