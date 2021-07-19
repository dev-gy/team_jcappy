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
					<h2>정보수정</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<div class="mypage_for_line"></div>
					<!-- 내정보수정 -->
					<div>
						<div class="mypage_member_update">
							<form action="" method="POST">
								<div>
									<table class="">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<td>비밀번호</td>
											<td><input class="pwd1" type="password" name="pwd"></td>
										</tr>
										<tr>
											<td>비밀번호확인</td>
											<td><input class="pwd2" type="password" name="pwd"></td>
										</tr>
										<tr>
											<td>이름</td>
											<td><input type="text" name="name" value=""></td>
										</tr>
										<tr>
											<td>연락처</td>
											<td><input type="text" name="name" value=""></td>
										</tr>
										<tr>
											<td>우편번호</td>
											<td class="zipcode_td">
												<input class="zipcode" id="zipcode" type="text" name="zipcode" value=""><input class="cstyle_btn search_zipcode" type="button" value="검색" onclick="daumPostcode($('#zipcode'), $('#addr1'), $('#addr2'));">
											</td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" id="addr1" name="name"  value=""></td>
										</tr>
										<tr>
											<td>상세주소</td>
											<td><input type="text" id="addr2" name="name" value=""></td>
										</tr>
										<tr>
											<td colspan="2">
												<input class="cstyle_btn" type="submit" value="수정">
												<input class="cstyle_btn" type="button" value="취소" onclick="location.href='/jcappy/mypage/order/index.do'">
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>