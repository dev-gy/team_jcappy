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
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<%@ include file="/WEB-INF/view/include/mypage/sidebar.jsp"%>
			<%@ include file="/WEB-INF/view/include/mypage/userinfo.jsp"%>
			<!-- 마이페이지 공통 컨텐츠 -->
			<div class="mypage_content">
				<!-- 마이페이지 공통 서브타이틀 -->
				<div class="mypage_subtitle">
					<h2>1:1 문의내역</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="qna_content">
					<table class="qna_table">
						<colgroup>
							<col width="80px">
							<col width="500px">
							<col width="120px">
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="cstyle_th">번호</th>
								<th scope="col" class="cstyle_th">제목</th>
								<th scope="col" class="cstyle_th">날짜</th>
								<th scope="col" class="cstyle_th">처리상태</th>
							</tr>
						</thead>
						<tbody>
							<tr class="qna_item">
								<td class="item_no">2</td>
								<td class="item_title"><a href="">회원정보수정요청</a></td>
								<td class="item_cre_date">2021-05-27 16:00</td>
								<td>
									<div class="item_state">처리완료</div>
									<div>
										<a href="">수정</a> / <a href="">삭제</a>
									</div>
								</td>
							</tr>
							<tr class="qna_item">
								<td class="item_no">1</td>
								<td class="item_title"><a href="">회원정보수정요청</a></td>
								<td class="item_cre_date">2021-05-27 16:00</td>
								<td>
									<div class="item_state">접수대기</div> <a href="">수정</a> / <a
									href="">삭제</a>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<button class="qna_write_btn cstyle_btn">문의작성</button>
					</div>
				</div>
				
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>