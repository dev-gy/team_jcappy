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
					<h2>주문관리 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="30%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">주문번호</label></th>
										<th scope="row"><label for="">주문날짜</label></th>
										<th scope="row"><label for="">배송상태</label></th>
										<th scope="row"><label for="">회원이름</label></th>
										<th scope="row"><label for="">회원이메일</label></th>
										<th scope="row"><label for="">회원연락처</label></th>
										<th scope="row"><label for="">주소</label></th>
										
									</tr>
									<tr>
										<td>
											<input type="text" id="order_no" name="order_no" class="w100" value="1" />
										</td>
										<td>
											<input type="text" id="order_day" name="order_day" class="w100" value="2021-7-10" />
										</td>
										<td>
											<input type="text" id="delivery_status" name="delivery_status" class="w100" value="배송완료" />
										</td>
										<td>
											<input type="text" id="member_name" name="member_name" class="w100" value="안두용" />
										</td>
										<td>
											<input type="text" id="member_email" name="member_email" class="w100" value="ady4709@naver.com" />
										</td>
										<td>
											<input type="text" id="member_tel" name="member_tel" class="w100" value="010-2134-8859" />
										</td>
										<td>
											<input type="text" id="address" name="address" class="w100" value="경기도 파주시 야당동 한빛마을 5단지" />
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="30%" />
									<col width="25%" />
									<col width="25%" />
									<col width="20%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">상품명</label></th>
										<th scope="row"><label for="">상품가격</label></th>
										<th scope="row"><label for="">상품수량</label></th>
										<th scope="row"><label for="">주문총액</label></th>
									</tr>
									<tr>
										<td>
											<input type="text" id="product_name" name="product_name" class="w100" value="냉장고" />
										</td>
										<td>
											<input type="text" id="product_price" name="product_price" class="w100" value="800000" />
										</td>
										<td>
											<input type="text" id="product_quantity" name="product_quantity" class="w100" value="1" />
										</td>
										<td rowspan="4">
											<input type="text" id="order_total_price" name="order_total_price" class="w100" value="4000000" />
										</td>
									</tr>
									<tr>
										<td>
											<input type="text" id="product_name" name="product_name" class="w100" value="tv" />
										</td>
										<td>
											<input type="text" id="product_price" name="product_price" class="w100" value="900000" />
										</td>
										<td>
											<input type="text" id="product_quantity" name="product_quantity" class="w100" value="1" />
										</td>
										
									</tr>
									<tr>
										<td>
											<input type="text" id="product_name" name="product_name" class="w100" value="에어콘" />
										</td>
										<td>
											<input type="text" id="product_price" name="product_price" class="w100" value="1000000" />
										</td>
										<td>
											<input type="text" id="product_quantity" name="product_quantity" class="w100" value="1" />
										</td>
										
									</tr>
									<tr>
										<td>
											<input type="text" id="product_name" name="product_name" class="w100" value="세탁기" />
										</td>
										<td>
											<input type="text" id="product_price" name="product_price" class="w100" value="1300000" />
										</td>
										<td>
											<input type="text" id="product_quantity" name="product_quantity" class="w100" value="1" />
										</td>
										
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=request.getContextPath()%>/admin/order/order_list.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href=""><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href=""><strong>삭제</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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