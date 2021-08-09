<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<h2>주문상세정보</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<!-- 주문상세정보 -->
					<div class="order_detail_content">
						<!-- 주문번호, 주문날짜, 배송상태 -->
						<div>
							<table class="cstyle_table">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<tr>
									<th>주문번호</th>
									<td>9999</td>
									<th>주문날짜</th>
									<td>2021-05-05</td>
									<th>배송상태</th>
									<td><div>상품준비중</div></td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 주문상품 -->
						<div>
							<table class="cstyle_table ordertable_img ordertable_button">
								<colgroup>
									<col width="350px">
									<col width="100px">
									<col width="130px">
									<col width="130px">
									<col width="*">
								</colgroup>
								<tr>
									<th>상품</th>
									<th>수량</th>
									<th>상품금액</th>
									<th>합계</th>
									<th></th>
								</tr>
								<tr>
									<td class="cstyle_text_align_left"><a href="/jcappy/mypage/product/detail.do"><img
											src="/jcappy/img/냉장고.jpg"></a>냉장고1</td>
									<td>1</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
									<td><button class="cstyle_btn" onclick="location.href='/jcappy/review/write.do'">리뷰작성</button></td>
								</tr>
								<tr>
									<td class="cstyle_text_align_left"><a href="/jcappy/mypage/product/detail.do"><img
											src="/jcappy/img/냉장고.jpg"></a>에어컨1</td>
									<td>2</td>
									<td>1,000,000</td>
									<td>2,000,000</td>
									<td><button class="cstyle_btn" onclick="location.href='/jcappy/review/write.do">리뷰작성</button></td>
								</tr>
								<tr>
									<td class="cstyle_text_align_left"><a href="/jcappy/mypage/product/detail.do"><img
											src="/jcappy/img/냉장고.jpg"></a>세탁기1</td>
									<td>2</td>
									<td>1,000,000</td>
									<td>2,000,000</td>
									<td><button class="cstyle_btn" onclick="location.href='/jcappy/review/write.do">리뷰작성</button></td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 배송지 정보 -->
						<div>
							<div class="mypage_for_subtitle">배송지정보</div>
							<table class="cstyle_table cstyle_text_align_left">
								<colgroup>
									<col width="200px">
									<col width="*">
								</colgroup>
								<tr>
									<td>받는사람</td>
									<td>이강인</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>123-456-789</td>
								</tr>
								<tr>
									<td>받는주소</td>
									<td>경기도 고양시 일산서구</td>
								</tr>
								<tr>
									<td>배송메시지</td>
									<td>빠른 배송 희망</td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 결제 정보 -->
						<div>
							<div class="mypage_for_subtitle">결제정보</div>
							<table class="cstyle_table cstyle_text_align_left">
								<colgroup>
									<col width="200px">
									<col width="*">
								</colgroup>
								<tr>
									<th>결제수단</th>
									<td>신용카드</td>
								</tr>
								<tr>
									<th>총 결제금액</th>
									<td>5,000,000</td>
								</tr>
							</table>
						</div>
						<div class="mypage_for_blank"></div>
						<!-- 취소/교환/반품 요청 -->
						<div class="btn_wrap">
							<button class="cstyle_btn" onclick="location.href='/jcappy/mypage/order/cancel.do'">취소/교환/반품 요청</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>