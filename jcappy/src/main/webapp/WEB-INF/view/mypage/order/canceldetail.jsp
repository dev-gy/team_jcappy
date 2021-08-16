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
					<h2>취소/반품 정보</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
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
								<td>${oiVo.ono }</td>
								<th>주문날짜</th>
								<td><fmt:formatDate value="${oiVo.odate }" pattern="yyyy-MM-dd"/></td>
								<th>처리상태</th>
								<td><div>${oiVo.o_state }</div></td>
							</tr>
						</table>
					</div>
					<div class="mypage_for_blank"></div>
					<!-- 주문상품 -->
					<div>
						<table class="cstyle_table ordertable_img">
							<colgroup>
								<col width="400px">
								<col width="100px">
								<col width="150px">
								<col width="150px">
							</colgroup>
							<tr>
								<th>상품</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>합계</th>
							</tr>
							<c:forEach var="olVo" items="${olList }">
								<tr>
									<td class="cstyle_text_align_left"><a href="/jcappy/product/detail/${olVo.pno }"><img src="${olVo.pimg1_org }"><span class="item_name">${olVo.ol_pname }</span></a></td>
									<td>${olVo.pno }</td>
									<td class="cstyle_text_align_right"><fmt:formatNumber maxFractionDigits="3" type="number" value="${olVo.ol_price }"/>원</td>
									<td class="cstyle_text_align_right"><fmt:formatNumber maxFractionDigits="3" type="number" value="${olVo.total_price }"/>원</td>
								</tr>
							</c:forEach>
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
								<th>받는사람</th>
								<td>${oiVo.oname }</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${oiVo.ophone }</td>
							</tr>
							<tr>
								<th>받는주소</th>
								<td>
									<p>${oiVo.ozipcode }</p>
									${oiVo.oaddr } ${oiVo.oaddr }
								</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td>${oiVo.orequest }</td>
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
								<td><fmt:formatNumber maxFractionDigits="3" type="number" value="${oiVo.result_price }" />원</td>
							</tr>
						</table>
					</div>
					<div class="mypage_for_blank"></div>
					<!-- 취소/교환/반품 사유 -->
					<div>
						<div class="mypage_for_subtitle">취소/반품 사유</div>
						<table class="cstyle_table cstyle_text_align_left">
							<tr>
								<td>${oiVo.oc_reason }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>